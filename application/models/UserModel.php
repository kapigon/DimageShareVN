<?php

class UserModel extends CI_Model{
    
    // Check Login
    public function login($user, $pass){
        $query = $this->db->get_where('users', array('username' => $user,
                                'password' => $pass,
                                'active'=> 1,
                            ));
        
        if($query->num_rows() == 1){
            return $query->row(0);
        }else{
            return false;
        }
    }
    
    // Get Thông tin User đăng nhập
    public function getUser($user, $pass){
         
         
        $query = $this->db->query('SELECT ID, FullName, UserName, RoleId FROM users Where UserName ="' . $user . '" and Password="' . $pass . '" and Active = 1' );
        
        if ( $query->num_rows() > 0 )
        {
            $row = $query->result();
            return $row;
        }
    }
    
    public function getUserNotActive_Total(){
        return $this->db->from('users')->where('Active', 0)->count_all_results();
    }
    
    public function getUserList($start, $limit){
        //$query = $this->db->query('SELECT ID, Email, FullName, UserName FROM user Where Active = 0');
        $this->db->select('*');
        $this->db->from('users');
        $this->db->limit($limit, $start);
        $this->db->where('Active', 0);
        $query = $this->db->get();
        
        if ($query->num_rows() > 0)
        {
            $row = $query->result();
            return $row;
        }
    }
        
    // Check User có tồn tại không
    public function isExistUser($userName){
        
        $query = $this->db->get_where('users', array('UserName' => $userName));
        if(!empty($query->row_array())) {
            return true;
        }else{
            return false;
        }
    }
    
    // Check Email có tồn tại không
    public function isExistEmail($email){
        
        $query = $this->db->get_where('users', array('Email' => $email));
        if(!empty($query->row_array())) {
            return true;
        }else{
            return false;
        }
    }
    
    // Create user mới
    public function create_User(){
        $username       = $this->input->post('username');
        $name           = $this->input->post('name');
        $email          = $this->input->post('email');
        $pass           = md5($this->input->post('password'));
        $roleId         = $this->input->post('roleId');
        $active         = 0;

        if($this->input->post('active') == '1'){
            $active = 1;
        }

        $data = array(
            'fullname'      => $name,
            'username'      => $username,
            'email'         => $email,
            'password'      => $pass,
            'RoleId'        => $roleId,               // Người dùng
            'Active'        => $active
        );
        
        // Insert user
        return $this->db->insert('users', $data);
        
    }
    
    # Get Thông tin User thông qua ID
    public function getInfoUserById($id){
         
        $query = $this->db->query('SELECT * FROM users Where ID =' . $id);
        
        if ($query->num_rows() > 0 )
        {
            $row = $query->result();
            return $row;
        }
    }
    
    public function get_roles(){
        $this->db->order_by('ID');
        $query = $this->db->get('Roles');
        return $query->result_array();
    }
    
    public function get_Users($active = 0, $id = 0, $limit = FALSE, $offset = FALSE){
        if($limit){
            $this->db->limit($limit, $offset);
        }

        if($id == 0){
            $query = $this->db->get_where('users', array('active' => $active));
            return $query->result_array();
        }

        $query = $this->db->get_where('users', array('id' => $id));
        return $query->row_array();
    }
    
    // Kích hoạt bài viết
    public function active_User($id){
        $data = array(
            'active' => 1,
        );

        $this->db->where('id', $id);
        return $this->db->update('users', $data);
    }
    
    // Cập nhật user
    public function update_User($data, $id){

        $this->db->where('id', $id);
        return $this->db->update('users', $data);
    }
}
?>
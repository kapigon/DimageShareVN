<?php

class Users extends CI_Controller{
    function __construct()
    {
        parent::__construct();
        $this->load->model('UserModel');
        $this->load->library('form_validation');
    }
    
    public function view($sign = 'signIn'){
        if(!file_exists(APPPATH . 'views/users/'. $sign . '.php')){
                //show_404();
        }	

        $data['title'] = ucfirst($sign);

        $this->load->view('templates/header');
        $this->load->view('users/' . $sign, $data);
        $this->load->view('templates/footer');

    }
	
    public function index(){
        $this->load->view('users/SignIn');
    }
    
    // Register User mới
    public function register(){
        
        // Get All danh sách quyền
        $data['roles'] = $this->UserModel->get_roles();
        
        // Check dữ liệu đầu vào
        $this->form_validation->set_rules('username', 'Tên truy cập', 'required|callback_checkUser');
        $this->form_validation->set_rules('password', 'Mật khẩu', 'required');
        $this->form_validation->set_rules('re-password', 'Mật khẩu nhắc lại', 'matches[password]');
        $this->form_validation->set_rules('email', 'Email', 'required|callback_checkEmail');
        
        $this->form_validation->set_error_delimiters('<div class="alert alert-warning" role="alert">', '</div>');
        
        if($this->form_validation->run() === FALSE){
            $this->load->view('templates/header');
            $this->load->view('users/register', $data);
            $this->load->view('templates/footer');
        }else{
           
            // Create user
            $this->UserModel->create_User();
            
            // Set message
            $this->session->set_flashdata('user_registered', 'Bạn đã đăng ký thành công.! Hãy đăng nhập vào hệ thống...');
            
            redirect('Users/View/login');
            /*if($this->UserModel->createUser($data) > 0) {
                redirect('Users/View/SignIn');
            }
            else{
                //$this->load->view('users/signUp');
                $this->view('SignUp');
            }*/
        }
    }
    
    // Login 
    public function login(){
        $data['title'] = 'Đăng nhập';
        
        $this->form_validation->set_rules('username', 'UserName', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if($this->form_validation->run() === FALSE){
            $this->load->view('templates/header');
            $this->load->view('users/login', $data);
            $this->load->view('templates/footer');
        }else{
            $username = $this->input->post('username');
            $password = md5($this->input->post('password'));

            $user_login = $this->UserModel->login($username, $password);

            if($user_login){
                // create session
                $user_data = array(
                    'user_id'   => $user_login->id,
                    'user_role' => $user_login->roleId,
                    'username'  => $username,
                    'logged_in' => true,
                );
                
                $this->session->set_userdata($user_data);
                //die("success");
                
                // Set message
                $this->session->set_flashdata('user_loggedin', 'Bạn đã đăng nhập thành công.!');
                redirect('');
            }else{                
                 // Set message
                $this->session->set_flashdata('login_falied', 'Lỗi đăng nhập!');
                
                redirect('users/login');
            }
        }   
    }
    
    # LogOut
    public function logOut(){
        $this->session->unset_userdata('user_id');
        $this->session->unset_userdata('user_role');
        $this->session->unset_userdata('username');
        $this->session->unset_userdata('logged_in');
        
        // Set message
        $this->session->set_flashdata('user_loggedout', 'Bạn đã thoát ra khỏi tài khoản.!');
        
        redirect('users/Login');
    }
         
    # Check Định dạng username và kiểm tra User tồn tại không
    public function checkUser(){
        $username = $this->input->post('username');
        if (preg_match('/^[A-Za-z0-9_]+$/', $username)) 
        {
            # Check User có tồn tại không?
            if($this->UserModel->isExistUser($username)) {
                $this->form_validation->set_message('checkUser','Tên truy nhập "' . $username . '" đã tồn tại.');
                return false;
            }
            else{
                $this->form_validation->set_message('checkUser','Đăng ký thành công.');
                return true;
            }
        }
        else
        {
            $this->form_validation->set_message('checkUser','Tên truy nhập không được có các ký tự đặc biệt và khoảng trống.');
            return false;
        }
    }
    
    # Check Email
    public function checkEmail(){
        $email = $this->input->post('email');
        
        if (preg_match('/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/', $email)) 
        {
            // Set message
            $this->form_validation->set_message('checkEmail','Email "' . $email . '" đã được đăng ký.');
            
            if($this->UserModel->isExistEmail($email)){
                return false;
            }    
            else{
                return true;
            }
        }
        else
        {
            // Set message
            $this->form_validation->set_message('checkEmail','Email không đúng định dạng');
            return false;
        }
    }
    
    # Check User có tồn tại không?
    public function isExitUser(){
        $this->form_validation->set_message('isExitUser','Tên truy nhập "' . $username . '" đã tồn tại.');
        
        if($this->UserModel->isExistUser($username)) {
            return false;
        }    
        else{
            return true;
        }
    }
    
    public function MyAccount(){
         // Check session
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }
        
        $id = $this->session->userdata('user_id');
        $data['info'] = $this->UserModel->getInfoUserById($id);

        $this->load->view('templates/header');
        $this->load->view('users/myAccount', $data);
        $this->load->view('templates/footer');
            
    }
    
    // Update: User
    public function updateUser($id = 0){       
        $this->form_validation->set_rules('name', 'Tên', 'required');
        if($this->input->post('password') != '')
            $this->form_validation->set_rules('re-password', 'Mật khẩu nhắc lại', 'matches[password]');
                
        if($this->form_validation->run() === FALSE){
             redirect('thong-tin-tai-khoan');
        }
        else{
            
            $name       = $this->input->post('name');
            $pass       = $this->input->post('password');
            
            if($this->session->userdata('user_id') && $id == 0){
                $id = $this->session->userdata('user_id');
       
                $data = array(
                    'name'      => $name,
                );
                if($pass != ""){
                    $data['password'] = md5($pass);
                }
                
                // Nếu thành công
                if($this->UserModel->update_User($data, $id) > 0){
                    $this->session->set_flashdata('user_updated','Thông tin tài khoản đã được cập nhật.');
                    redirect('thong-tin-tai-khoan');
                    //$this->form_validation->set_message('checkPass','Lỗi mật khẩu không trùng nhau.');
                }
            }   
        }
    }
    
    // Lấy ra danh sách user chờ duyệt
    public function waitActive($offset = 0){
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }
        else if($this->session->userdata('user_role') == 1){
            // Pagination
            $query = $this->db->get_where('users', array('active' => 0));
            $total = count($query->result_array());

            $config['base_url'] = base_url() . 'user-cho-duyet/';
            $config['total_rows'] = $total;
            $config['per_page'] = 10;
            $config['uri_segment'] = 3;
            $config['attributes'] = array('class' => 'pagination-links');

            $this->pagination->initialize($config);
            $data['title'] = 'Danh sách user chờ duyệt';           

            $data['users'] = $this->UserModel->get_Users(0, 0, $config['per_page'], $offset);

            $this->load->view('templates/header');
            $this->load->view('users/userList', $data);
            $this->load->view('templates/footer');
        }
    }
    
    # Active User
    public function activeUser($id){
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }
        else if($this->session->userdata('user_role') == 1){
            $this->UserModel->active_User($id);

            // Set message
            $this->session->set_flashdata('user_actived', 'User đã được duyệt');
            
            redirect('user-cho-duyet');
        }
    }
}
?>
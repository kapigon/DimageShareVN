<?php

class Posts extends CI_Controller{    
    function __construct()
    {
        parent::__construct();
        $this->load->model('PostModel');
    }
	
    public function index($offset = 0){
        // Pagination
        $query = $this->db->get_where('posts', array('active' => 1));
        $total = count($query->result_array());
        
        $config['base_url'] = base_url() . 'posts/index/';
        $config['total_rows'] = $total;
        $config['per_page'] = 5;
        $config['uri_segment'] = 3;
        $config['attributes'] = array('class' => 'pagination-links');

        $this->pagination->initialize($config);
        $data['title'] = 'Danh sách bài viết mới nhất';           

        $data['posts'] = $this->PostModel->get_Posts(1, FALSE, $config['per_page'], $offset);

        $this->load->view('templates/header');
        $this->load->view('posts/index', $data);
        $this->load->view('templates/footer');
    }
    
    public function myPosts($offset = 0){
        // Check session
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }else{
            $user_id = $this->session->userdata('user_id');
            // Pagination
            $query = $this->db->get_where('posts', array('user_id' => $user_id));
            $total = count($query->result_array());

            $config['base_url'] = base_url() . 'posts/index/';
            $config['total_rows'] = $total;
            $config['per_page'] = 5;
            $config['uri_segment'] = 3;
            $config['attributes'] = array('class' => 'pagination-links');

            $this->pagination->initialize($config);
            $data['title'] = 'Danh sách bài viết mới nhất';           

            $data['posts'] = $this->PostModel->get_MyPosts(FALSE, $config['per_page'], $offset);

            $this->load->view('templates/header');
            $this->load->view('posts/index', $data);
            $this->load->view('templates/footer');
        }
    }
    
    public function view($slug = NULL){
            $data['post'] = $this->PostModel->get_Post($slug);

            if(empty($data['post'])){
                show_404();
            }

            $data['title'] = $data['post']['title'];
            
            $this->load->view('templates/header');
            $this->load->view('posts/view', $data);
            $this->load->view('templates/footer');
	}

    public function create(){
        // Check session
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }

        $data['title'] = "Thêm bài viết";

        // Lấy danh sách danh mục
        $data['categories'] = $this->PostModel->get_categories();

        $this->form_validation->set_rules('title', 'Tiêu đề', 'required');
        $this->form_validation->set_rules('body', 'Nội dung', 'required');

        if($this->form_validation->run() === FALSE){
            $this->load->view('templates/header');
            $this->load->view('posts/create', $data);
            $this->load->view('templates/footer');
        }
        else{
            // Upload Image
            $config['upload_path'] = './customs/images/posts';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['max_size'] = '2048';
            $config['max_width'] = '2000';
            $config['max_height'] = '2000';

            $this->load->library('upload', $config);

            if(!$this->upload->do_upload('post_image')){
                    $errors = array('error' => $this->upload->display_errors());
                    $post_image = 'noimage.jpg';
            } else {
                    $data = array('upload_data' => $this->upload->data());
                    $post_image = $_FILES['post_image']['name'];
            }

            $slug = $this->myclass->vn_to_str($this->input->post('title'));

            $this->PostModel->create_Post($post_image, $slug);

            // Set message
            $this->session->set_flashdata('post_update', 'Thêm mới thành công.!');

            redirect('');
        }
    }

    public function delete($id){
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }

        $post = $this->PostModel->get_Post_By_Id($id);
        if(isset($post) && $this->session->userdata('user_id') == $post['user_id']){
            $this->PostModel->delete_post($id);
            redirect('');
        }
    }

    public function edit($id){
        $data['post'] = $this->PostModel->get_Post_By_Id($id);

        // Lấy danh sách danh mục
        $data['categories'] = $this->PostModel->get_categories();
        if(empty($data['post'])){
            show_404();
        }

        $data['title'] = $data['post']['title'];
        $this->load->view('templates/header');
        $this->load->view('posts/edit', $data);
        $this->load->view('templates/footer');
    }

    public function update(){
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }

        // Upload Image
        $config['upload_path'] = './customs/images/posts';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = '2048';
        $config['max_width'] = '2000';
        $config['max_height'] = '2000';

        $this->load->library('upload', $config);

        if($this->upload->do_upload('post_image')){
            $data = array('upload_data' => $this->upload->data());
            $post_image = $_FILES['post_image']['name'];
        }

        $slug = $this->myclass->vn_to_str($this->input->post('title'));

        $this->PostModel->update_post($post_image, $slug);

        // Set message
        $this->session->set_flashdata('post_update', 'Bạn đã cập nhật thành công.!');

        redirect('');
    }
    
    public function waitActive($offset = 0){
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }
        else if($this->session->userdata('user_role') == 1){
            // Pagination
            $query = $this->db->get_where('posts', array('active' => 0));
            $total = count($query->result_array());

            $config['base_url'] = base_url() . 'posts/index/';
            $config['total_rows'] = $total;
            $config['per_page'] = 5;
            $config['uri_segment'] = 3;
            $config['attributes'] = array('class' => 'pagination-links');

            $this->pagination->initialize($config);
            $data['title'] = 'Danh sách bài viết chờ duyệt';           

            $data['posts'] = $this->PostModel->get_Posts(0, FALSE, $config['per_page'], $offset);

            $this->load->view('templates/header');
            $this->load->view('posts/active', $data);
            $this->load->view('templates/footer');
        }
    }
    
    public function active($id){
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }
        else if($this->session->userdata('user_role') == 1){
            $this->PostModel->active_Post($id);

            // Set message
            $this->session->set_flashdata('post_actived', 'Bài viết đã được duyệt');
            
            redirect('bai-viet-cho-duyet');
        }
    }
}
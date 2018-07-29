<?php
    class Categories extends CI_Controller{
        function __construct()
        {
            parent::__construct();
            $this->load->model('CategoryModel', 'PostModel');
        }
        public function index(){
            $data['title'] = 'Danh mục';

            $data['categories'] = $this->CategoryModel->get_categories();

            $this->load->view('templates/header');
            $this->load->view('categories/index', $data);
            $this->load->view('templates/footer');
        }

        public function create(){
            // Check login
            if(!$this->session->userdata('logged_in')){
                    redirect('users/login');
            }

            $data['title'] = 'Thêm danh mục';

            $this->form_validation->set_rules('name', 'Tên danh mục', 'required');

            if($this->form_validation->run() === FALSE){
                $this->load->view('templates/header');
                $this->load->view('categories/create', $data);
                $this->load->view('templates/footer');
            } else {
                    $this->CategoryModel->create_category();

                    // Set message
                    $this->session->set_flashdata('category_created', 'Danh mục đã được thêm mới.');

                    redirect('danh-muc');
            }
        }

        public function posts($id){
            $data['title'] = $this->CategoryModel->get_category($id)->name;

            $data['posts'] = $this->PostModel->get_posts_by_category($id);

            $this->load->view('templates/header');
            $this->load->view('posts/index', $data);
            $this->load->view('templates/footer');
        }

        public function delete($id){
            // Check login
            if(!$this->session->userdata('logged_in')){
                redirect('users/login');
            }
            else if($this->session->userdata('user_role') == 1){
                if($this->CategoryModel->isExitPostByCategoryId($id)){
                    // Set message
                    $this->session->set_flashdata('category_error', 'Danh mục không thể xóa do đang sử dụng trong bài viết.');
                }
                else{
                    $this->CategoryModel->delete_category($id);

                    // Set message
                    $this->session->set_flashdata('category_deleted', 'Danh mục đã được xóa');
                }

                redirect('danh-muc');
            }
            
        }
    }
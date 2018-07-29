<?php
    class PostModel extends CI_Model{

        public function __construct(){
            $this->load->database();
        }

        // Lấy ra tât cả bài viết đã duyệt (bài viết)
        public function get_Posts($active = 0, $slug = FALSE, $limit = FALSE, $offset = FALSE){
            $this->db->order_by('updated_at', 'DESC');
            if($limit){
                $this->db->limit($limit, $offset);
            }
            
            if($slug === FALSE){
                $query = $this->db->get_where('posts', array('active' => $active));
                return $query->result_array();
            }

            $query = $this->db->get_where('posts', array('slug' => $slug));
            return $query->row_array();
        }
        
        // Lấy ra tât cả bài viết đã duyệt (bài viết)
        public function get_Post($slug = FALSE){
            $query = $this->db->get_where('posts', array('slug' => $slug));
            return $query->row_array();
        }
        
        // Lấy ra bài viết theo Id
        public function get_Post_By_Id($id){

            $query = $this->db->get_where('posts', array('id' => $id));
            return $query->row_array();
        }
        
        // Lấy ra nhưng bài viết theo User tạo
        public function get_MyPosts($slug = FALSE, $limit = FALSE, $offset = FALSE){
            if($limit){
                $this->db->limit($limit, $offset);
            }
            
            if($slug === FALSE){
                $query = $this->db->get_where('posts', array('user_id' => $this->session->userdata('user_id')));
                return $query->result_array();
            }
        }
        
        // Tạo bài viết mới
        public function create_Post($post_image, $slug){
            $slug = url_title($slug);
            $data = array(
                'title'             => $this->input->post('title'),
                'slug'              => $slug,
                'body'              => $this->input->post('body'),
                'active'            => 0,
                'post_image'        => $post_image,
                'user_id'           => $this->session->userdata('user_id')
            );

            return $this->db->insert('posts', $data);
        }

        // Xóa bài viết
        public function delete_Post($id){
            
            $this->db->where('id', $id);
            $this->db->delete('posts');

            return true;
        }

        // Cập nhật bài viết
        public function update_Post($post_image, $slug){
            $slug = url_title($slug);
            
            $data = array(
                    'title'             => $this->input->post('title'),
                    'slug'              => $slug,
                    'body'              => $this->input->post('body'),
                    'category_id'       => $this->input->post('category_id'),
                    );
            if(!empty($post_image)){
                $data['post_image'] = $post_image;
            }

            $this->db->where('id', $this->input->post('id'));
            return $this->db->update('posts', $data);
        }
        
        // Kích hoạt bài viết
        public function active_Post($id){
            $data = array(
                'active' => 1,
                'updated_at' => date('Y-m-d')
            );

            $this->db->where('id', $id);
            return $this->db->update('posts', $data);
        }
        
        // Lấy ra danh sách danh mục
        public function get_categories(){
            $this->db->order_by('name');
            $query = $this->db->get('categories');
            return $query->result_array();
        }

        // Lấy ra bài viết theo danh mục
        public function get_posts_by_category($category_id){
            $this->db->order_by('posts.id', 'DESC');
            $this->db->join('categories', 'categories.id = posts.category_id');
                    $query = $this->db->get_where('posts', array('category_id' => $category_id, 'active' => 1));
            return $query->result_array();
        }
    }
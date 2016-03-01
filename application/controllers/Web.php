<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Web extends CI_Controller {

    public function __construct() {
        parent::__construct();
        if($this->session->userdata('username')){
            redirect('home');
        }
        $this->load->model('Users_model', 'obj_users', TRUE);
    }

    public function index() {


        $data = array();
        $this->load->view('web/index', $data);
    }

    function login() {

        $this->form_validation->set_rules('username', 'Username', 'required|xss_clean|trim');
        $this->form_validation->set_rules('password', 'Password', 'required|xss_clean|trim');

        if ($this->form_validation->run() === TRUE) {
            /* retrun 1-Account Locked,2-Success,3-Invalid username/password,4-Invalid user */
            if ($this->obj_users->check_login() === 1) {
                $this->session->set_flashdata('login_error', 'Account Locked');
            } else if ($this->obj_users->check_login() === 2) {
                redirect('home');
            } else if ($this->obj_users->check_login() === 3) {
                $this->session->set_flashdata('login_error', 'Invalid username & password');
                $condition = array(
                    'USERNAME' => $this->input->post('username')
                );
                $user_details = $this->obj_users->get_entry($condition);
                $user_condition = array('EMP_ID'=>$user_details->EMP_ID);
                $failed_attempts = $user_details->PWD_FAILED_ATTEMPTS;
                if ($failed_attempts >= 3) {
                    $data = array(
                        'ACCOUNT_LOCKED' => 1,
                        'PWD_FAILED_ATTEMPTS' => $failed_attempts+1
                    );
                    $this->obj_users->edit($user_condition, $data);
                    $this->session->set_flashdata('login_error', 'Your account is locked');
                } else {
                    $data = array(
                        'PWD_FAILED_ATTEMPTS' => $failed_attempts+1
                    );
                    $this->obj_users->edit($user_condition, $data);
                }
            }if ($this->obj_users->check_login() === 4) {
                $this->session->set_flashdata('login_error', 'This user is not registered');
            }
        }
        $this->load->view('web/index');
    }

    function hashPass() {
        $str = 'gilson!@#';
        $str = hash("sha256", $str);
        echo $str;
    }

//    public function search(){
//        $search_result = array();
//        $search_query = $this->input->get('search_query');
//        $conditions = array('blog_status' => 'Y');
//        $row = 0;
//        $limit = $this->obj_blog->countrows($conditions);
//        $search_result = $this->obj_blog->search_blog($limit,$row);
//        if($search_result){
//            $data['blog'] = $search_result;
//        }else{
//          $limit = '6';
//          $row = 0;
//          $condition = array('blog_status' => 'Y','blog_homepage_status'=>'Y');
//          $search_result = $this->obj_blog->get_all_entries($row, $limit, $condition, 'blog_display_order', 'asc');
//        }
//        $data['blog'] = $search_result;
//        $this->load->view('web/search', $data);
//    }
}

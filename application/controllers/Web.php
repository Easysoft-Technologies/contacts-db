<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Web extends CI_Controller {

    public function __construct() {
        parent::__construct();
        if ($this->session->userdata('username')) {
            redirect('home');
        }
        $this->load->model('Users_model', 'obj_users', TRUE);
        $this->load->model('Common_model', 'obj_common', TRUE);
    }

    public function index() {
        $data['login_error']='';
        $this->load->view('web/index', $data);
    }

    function login() {
        $data['login_error']='';
        $this->form_validation->set_rules('username', 'Username', 'required|xss_clean|trim');
        $this->form_validation->set_rules('password', 'Password', 'required|xss_clean|trim');
        
        if ($this->form_validation->run() === TRUE) {
            /* --------------General Information----------------
              1-Account Locked
              2-Login Success
              3-Invalid username/password
              4-User not registered
            */
            if ($this->obj_users->check_login() === 4) {
                $data['login_error'] = 'This user is not registered with us..!!';
//                $this->session->set_flashdata('login_error', 'This user is not registered');
            }
            if ($this->obj_users->check_login() === 1) {
                $data['login_error'] = 'Account Locked. Please contact administrator..!';
//                $this->session->set_flashdata('login_error', 'Account Locked');
            }
            
            if ($this->obj_users->check_login() === 2) {
                redirect('home');
            }
            
            if ($this->obj_users->check_login() === 3) {
                
//                $this->session->set_flashdata('login_error', 'Invalid username & password');
                $condition = array(
                    'USERNAME' => $this->input->post('username')
                );
                $user_details = $this->obj_users->get_entry($condition);
                $user_condition = array('EMP_ID' => $user_details->EMP_ID);
                $failed_attempts = $user_details->PWD_FAILED_ATTEMPTS;
                if ($failed_attempts >= 3) {
                    $data = array(
                        'ACCOUNT_LOCKED' => 0,
                        'PWD_FAILED_ATTEMPTS' => $failed_attempts + 1
                    );
                    $this->obj_users->edit($user_condition, $data);
                    $data['login_error'] = 'Your account got locked. Please conatct administrator..!';
//                    $this->session->set_flashdata('login_error', 'Your account is locked');
                } else {
                    $data = array(
                        'PWD_FAILED_ATTEMPTS' => $failed_attempts + 1
                    );
                    $this->obj_users->edit($user_condition, $data);
                    $data['login_error'] = 'Invalid username & password';
                }
            }
            
        }
        $this->load->view('web/index',$data);
    }

    function hashPass() {
        $str = 'gilson!@#';
        $str = hash("sha256", $str);
        echo $str;
    }
}

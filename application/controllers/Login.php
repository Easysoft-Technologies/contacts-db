<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        if ($this->session->userdata('username')) {
            redirect('home');
        }
        $this->load->library('user_agent');
        $this->load->model('Users_model', 'obj_users', TRUE);
        $this->load->model('Common_model', 'obj_common', TRUE);
    }

    function index() {
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
                $data['login_error'] = 'This user is not registered with us..!';
            }
            if ($this->obj_users->check_login() === 1) {
                $data['login_error'] = 'Account Locked. Please contact administrator..!';
            }
            
            if ($this->obj_users->check_login() === 2) {
                $user_log_data = array(
                    'USERNAME' => $this->session->userdata('username'),
                    'LOGIN_TIME' => date('Y-m-d H:i:s'),
                    'IP_ADDR'=>$_SERVER['REMOTE_ADDR'],
                    'BROWSER' => $this->agent->browser(),
                    'SYSTEM_DETAILS' => $this->agent->platform()
                );
                $this->obj_common->add('user_log_4',$user_log_data);
                redirect('home');
            }
            
            if ($this->obj_users->check_login() === 3) {
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
                } else {
                    $data = array(
                        'PWD_FAILED_ATTEMPTS' => $failed_attempts + 1
                    );
                    $this->obj_users->edit($user_condition, $data);
                    $data['login_error'] = 'The username and password that you entered doesnt match..!';
                }
            }
            
        }
        $this->load->view('web/index',$data);
    }
    
}

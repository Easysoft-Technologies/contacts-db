<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct() {
        parent::__construct();
        if(!$this->session->userdata('username')){
            redirect('/');
        }
        $this->load->model('Users_model', 'obj_users', TRUE);
        $this->load->model('Common_model', 'obj_common', TRUE);
    }

    public function index() {
        $data = array();
        $this->load->view('web/home', $data);
    }
    
    public function logout(){
        $this->session->sess_destroy();
        redirect('/'); 
    }

}

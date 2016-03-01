<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Users_model extends CI_Model {

    var $table = 'user_account_3';

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    function edit($condition = array(), $data_array = array()) {

        if ($condition) {
            $this->db->where($condition);
        }
        if ($this->db->update($this->table, $data_array)) {
            return true;
        } else {
            return false;
        }
    }

    function get_all_entries($row, $limit, $condition = array(), $order_by_fieled, $order_by_type = "asc") {
        //$this->db->where('blog_status','E');
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get($this->table, $limit, $row);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function get_all($condition = array(), $order_by_fieled = '', $order_by_type = "asc") {
        $this->db->from($this->table);
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function countrows($condition = array()) {

        $this->db->from($this->table);
        if ($condition) {
            $this->db->where($condition);
        }
        $query = $this->db->get();
        $row = $query->num_rows();
        return $row;
    }

    function add($data_array = array()) {

        $this->db->insert($this->table, $data_array);
        return $this->db->insert_id();
    }

    function get_entry($condition = array()) {

        $this->db->from($this->table);
        if ($condition) {
            $this->db->where($condition);
        }
        $query = $this->db->get();
        if ($query->num_rows() == 1) {
            return $query->row();
        } else {
            return false;
        }
    }

    function delete($condition = array()) {

        $this->db->where($condition);
        $this->db->delete($this->table);
    }

    function get_all_category($condition = array(), $order_by_fieled = '', $order_by_type = "asc") {
        $this->db->from('userss_category');
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function get_field_data($condition = array(), $field_name = '') {


        $this->db->select($field_name);
        $this->db->from($this->table);
        $this->db->where($condition);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $firstname = $query->row();

            $return_value = $firstname->$field_name;
            return $return_value;
        }
    }

    function check_login() {
        /* --------------General Information----------------
          1-Account Locked
          2-Login Success
          3-Invalid username/password
          4-User not registered
        */
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $password = hash("sha256", $password);

        /* Registered users checking section starts */
        $this->db->where(array('USERNAME' => $username));
        $this->db->from($this->table);
        $querys = $this->db->get();
        if ($querys->num_rows() <= 0) {
            return 4;
        }
        /* Registered users checking section ends */

        /* Username and password checking starts */ else {
            $condition = array(
                'USERNAME' => $username,
                'PASSWORD' => $password
            );
            $this->db->from($this->table);
            if ($condition) {
                $this->db->where($condition);
            }
            $query = $this->db->get();
            if ($query->num_rows() > 0) {
                $result = $query->result();

                /* Account locked checking starts */
                if ($result[0]->ACCOUNT_LOCKED == 0) {
                    return 1;
                }
                /* Account locked checking ends */ 
                
                else {
                    $this->session->set_userdata('username', $result[0]->USERNAME);
                    $this->session->set_userdata('user_category', $result[0]->USER_CATEGORY);
                    $this->session->set_userdata('user_id', $result[0]->EMP_ID);
                    return 2;
                }
            } else {
                return 3;
            }
        }
        /* Username and password checking ends */
    }

    function change_password() {

        $password = $this->input->post('password');
        $old = $this->input->post('old_password');
        $salt = sha1($password);
        $password = md5($salt . $password);
        $salt = sha1($old);
        $old = md5($salt . $old);
        $this->db->where(array("users_id" => $this->session->userdata('users_id'), 'users_password' => $old));
        $query = $this->db->get('users');
        if ($query->num_rows() > 0) {
            $this->db->where(array("users_id" => $this->session->userdata('users_id')));
            $this->db->update('users', array('users_password' => $password));
            return 1;
        } else {
            return 0;
        }
    }

    function change_password_user($user_id = '') {

        $password = $this->input->post('password');
        $salt = sha1($password);
        $password = md5($salt . $password);

        $this->db->where(array("user_login_id" => $user_id));
        $query = $this->db->get('user_login');
        if ($query->num_rows() > 0) {
            $this->db->where(array("user_login_id" => $user_id));
            $this->db->update('user_login', array('user_login_password' => $password));
            return 1;
        } else {
            return 0;
        }
    }

}

?>

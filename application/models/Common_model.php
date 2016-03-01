<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Common_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    function edit($table, $condition = array(), $data_array = array()) {

        if ($condition) {
            $this->db->where($condition);
        }
        if ($this->db->update($table, $data_array)) {
            return true;
        } else {
            return false;
        }
    }

    function get_slider_details($condition, $order_by_fieled = '', $order_by_type = 'asc') {
        $this->db->select('template_content.*,');

        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
    }

    function get_all_entries($table, $row = 0, $limit = 100, $condition = array(), $order_by_fieled = '', $order_by_type = "asc") {
        //$this->db->where('blog_status','E');
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get($table, $limit, $row);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function get_all($table, $condition = array(), $order_by_fieled = '', $order_by_type = "asc") {
        $this->db->from($table);
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

    function countrows($table, $condition = array()) {

        $this->db->from($table);
        if ($condition) {
            $this->db->where($condition);
        }
        $query = $this->db->get();
        $row = $query->num_rows();
        return $row;
    }

    function count_total_rows($table, $condition = array()) {

        $this->db->from($table);
        $this->db->join('orders', 'orders.order_id = order_items.order_id');
        if ($condition) {
            $this->db->where($condition);
            $this->db->where('customer_id', $this->session->userdata('USER_ID'));
        }


        $query = $this->db->get();
        //echo $this->db->last_query();

        $row = $query->num_rows();
        return $row;
    }

    function add($table, $data_array = array()) {

        $this->db->insert($table, $data_array);
        return $this->db->insert_id();
    }

    function get_entry($table, $condition = array()) {

        $this->db->from($table);
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

    function get_all_data($table, $condition = array()) {

        $this->db->from($table);
        if ($condition) {
            $this->db->where($condition);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function delete($table, $condition = array()) {

        $this->db->where($condition);
        $this->db->delete($table);
    }

    function get_all_blog($table, $condition = array(), $order_by_fieled = '', $order_by_type = "asc") {
        $this->db->from('products_blog');
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

    function reset_password($forgot_email = '') {

        $this->db->select('user_login_id');
        $this->db->where(array('user_login_email' => $forgot_email));
        $query = $this->db->get('user_login');
        $login_id = $query->first_row()->user_login_id;
        $password = substr(str_shuffle('abcdefghijklmnopqrstuvwxyz123456789'), 0, 6);
        $password_new = $password;
        $salt = sha1($password);
        $password = md5($salt . $password);
        $datas = array('user_login_password' => $password);

        $this->db->where(array('user_login_id' => $login_id));
        $this->db->update('user_login', $datas);

        $return_array = array();

        $return_array[0] = $login_id;
        $return_array[1] = $password_new;


        return $return_array;
    }

    function get_field_data($table, $condition = array(), $field = '') {


        $this->db->select($field);
        $this->db->from($table);
        $this->db->where($condition);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $firstname = $query->row();

            $return_value = $firstname->$field;
            return $return_value;
        }
    }

    function display_select($table, $condition = array(), $order_by_fieled = '', $order_by_type = "desc", $select_name = '', $select_id = '', $select_value = '') {
        $return_value = '';
        $this->db->from($table);
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $results = $query->result_array();
            //print_r($results);
            foreach ($results as $res) {
                if ($res[$select_id] == $select_name) {

                    $return_value.='<option selected value=' . $res[$select_id] . '>' . $res[$select_value] . '</option>';
                } else {
                    $return_value.='<option  value=' . $res[$select_id] . '>' . $res[$select_value] . '</option>';
                }
            }
            return $return_value;
        } else {
            return $return_value;
        }
    }

    function display_radio($table, $condition = array(), $order_by_fieled = '', $order_by_type = "desc", $select_name = '', $select_id = '', $select_value = '', $option_name) {
        $return_value = '';
        $this->db->from($table);
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $results = $query->result_array();
            //print_r($results);
            $i = 0;
            foreach ($results as $res) {

                if ($res[$select_id] == $select_name) {

                    $return_value.='<input class="' . $option_name . '" checked type="radio" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                } else {
                    if ($i == 0) {
                        $return_value.='<input class="' . $option_name . '" checked type="radio" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                    } else {
                        $return_value.='<input class="' . $option_name . '" type="radio" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                    }
                }
                $i++;
            }
            return $return_value;
        } else {
            return $return_value;
        }
    }

    function display_radio_list($table, $condition = array(), $order_by_fieled = '', $order_by_type = "desc", $select_name = '', $select_id = '', $select_value = '', $option_name) {
        $return_value = '';
        $this->db->from($table);
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $results = $query->result_array();
            //print_r($results);
            $i = 0;
            foreach ($results as $res) {

                if ($res[$select_id] == $select_name) {

                    $return_value.='<input  checked type="radio" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                    $return_value.='<br/>';
                } else {
                    if ($i == 0) {
                        $return_value.='<input checked type="radio" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                        $return_value.='<br/>';
                    } else {
                        $return_value.='<input type="radio" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                        $return_value.='<br/>';
                    }
                }
                $i++;
            }
            return $return_value;
        } else {
            return $return_value;
        }
    }

    function display_radio_list_activate($table, $condition = array(), $order_by_fieled = '', $order_by_type = "desc", $select_name = '', $select_id = '', $select_value = '', $option_name, $user_gallery_id = '') {
        $return_value = '';
        $this->db->from($table);
        if ($condition) {
            $this->db->where($condition);
        }
        if ($order_by_fieled) {
            $this->db->order_by($order_by_fieled, $order_by_type);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $results = $query->result_array();
            //print_r($results);
            $i = 0;
            foreach ($results as $res) {

                if ($res[$select_id] == $select_name) {

                    $return_value.='<input  checked type="radio" onClick="update_profile_status(' . $user_gallery_id . ',' . $res[$select_id] . ');" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                    $return_value.='<br/>';
                } else {
                    if ($i == 0) {
                        $return_value.='<input checked type="radio" onClick="update_profile_status(' . $user_gallery_id . ',' . $res[$select_id] . ');" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                        $return_value.='<br/>';
                    } else {
                        $return_value.='<input type="radio" onClick="update_profile_status(' . $user_gallery_id . ',' . $res[$select_id] . ');" value="' . $res[$select_id] . '" name="' . $option_name . '" >' . $res[$select_value];
                        $return_value.='<br/>';
                    }
                }
                $i++;
            }
            return $return_value;
        } else {
            return $return_value;
        }
    }

}

?>

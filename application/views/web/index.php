<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>CONTACTS-DB</title>
        <link href="<?php echo base_url();?>css/style-contacts-DB.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url();?>css/custom.css" rel="stylesheet" type="text/css" />
    </head>

    <body class="home-bg">
        <DIV id="wrapper"> 

            <!-- header div -->
            <div id="header">
                <div class="logo"><img src="<?php echo base_url();?>images/contacts-DB-LOGO.png" width="204" height="110" /></div>
                <div class="menu-top">
                    <ul>
                        <li><a href="#" class="active">Home</a></li>
                        <li><a href="#">About Contacts DB</a></li>
                    </ul>
                </div>
            </div>
            <!-- header div --> 

            <!-- title div -->
            <div id="home-title"><img src="<?php echo base_url();?>images/title.png" width="960" height="70" /></div>
            <!-- title div --> 

            <!-- content div -->
            <div id="main-content-DIV">
                <div id="content-footer">
                    <div class="content">
                        <div class="content-left">
                            <div class="text">
                                <p><img src="<?php echo base_url();?>images/business-contacts-title.jpg" width="281" height="67" /></p>
                                <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites.</p>
                                <p>Various versions have evolved over the years, sometimes by accident, sometimes on purpose 
                                    (injected humour and the like).</p>
                            </div>
                            <div class="text">
                                <p><img src="<?php echo base_url();?>images/personal-contacts-title.jpg" width="281" height="67" /></p>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,</p>
                                <p>Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
                            </div>
                        </div>
                        <div class="content-right">
                            <h2>SIGN IN</h2>
                            <?php if($this->session->flashdata('login_error')){?>
                            <span class="error-message"><?php echo $this->session->flashdata('login_error');?></span>
                            <?php }?>
                            <form name="loginForm" id="loginForm" action="<?php echo base_url();?>web/login" method="post">
                                <ol>
                                    <li>
                                        <input type="text" class="textbox" name="username" id="username" placeholder="Username" value="<?php echo set_value('username');?>"/>
                                        <?php echo form_error('username', '<p class="error-message">', '</p>'); ?>
                                    </li>
                                    <li>
                                        <input type="password" class="textbox" name="password" id="password" placeholder="Password" value="<?php echo set_value('password');?>"/>
                                        <?php echo form_error('password', '<p class="error-message">', '</p>'); ?>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="checkbox-1-1" class="regular-checkbox" />
                                        <label for="checkbox-1-1"></label>
                                        <span>Keep me logged in</span>
                                    </li>
                                    <li class="part1">
                                        <input type="submit" name="submit" class="sign-in-btn" id="submit_btn" value="" />
                                    </li>
                                    <li class="part2">
                                    <!--  <p><a href="#">Forgot User Name?</a></p>-->
                                        <p><a href="#">Forgot password?</a></p>
                                    </li>
                                </ol>
                            </form>
                        </div>
                    </div>

                    <!--Footer Div -->
                    <div class="footer">Copyright © 2012 <b>Contacts DB</b>. All rights reserved. <span><a href="#">Home</a> / <a href="#">About Contacts DB</a></span></div>
                    <!-- Footer Div --> 
                </div>
            </div>
            <!-- content div --> 

        </DIV>
    </body>
</html>

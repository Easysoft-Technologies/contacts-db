<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>CONTACTS-DB</title>
        <link href="<?php echo base_url();?>css/style-contacts-DB.css" rel="stylesheet" type="text/css" />
        <script src="<?php echo base_url();?>js/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script src="<?php echo base_url();?>js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            // <![CDATA[
            $(document).ready(function () {
                $('#menu').tabify();
                $('#menu2').tabify();
            });
            // ]]>
        </script>
    </head>

    <body class="inside-bg">
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
            <div id="inside-title"><img src="<?php echo base_url();?>images/title.png" width="960" height="70" /></div>
            <!-- title div --> 

            <!-- content div -->
            <div id="main-content-DIV">
                <div id="content-footer">
                    <h1>Home</h1>
                    <div class="inside-content-left-menu">
                        <ul>
                            <li><a href="<?php echo base_url();?>">Home</a></li>
                            <li><a href="<?php echo base_url();?>home/logout">Log out</a></li>
                        </ul>
                    </div>
                    <div class="inside-content">


<!--                        <ul id="menu2" class="menu">
                            <li class="active">Category</li>
                            <li>Profile Info</li>
                            <li>Contact Info</li>
                        </ul>-->
                        <div id="description2" class="content">
<!--                            <ol>
                                <li>
                                    <label for="name">Select Type</label>
                                    <select name="employee list" class="selectbox">
                                        <option>Employe</option>
                                    </select>
                                </li>
                                <li>
                                    <label for="name">Privacy</label>
                                    <input type="checkbox" id="checkbox-1-1" checked="checked" />
                                    <span>&nbsp;&nbsp;Public</span> </li>
                                <li>
                                    <label for="name">Log-in Status</label>
                                    <input type="checkbox" id="checkbox1" checked="checked" />
                                    <span>&nbsp;&nbsp;Locked</span> </li>
                                <li style="padding-top:10px">
                                    <div class="iconGroup">
                                        <a href="#" class="addtovisitor"></a>
                                        <a href="#" class="audittrail"></a>
                                        <a href="#" class="mergecontact"></a>
                                        <a href="#" class="print"></a>
                                        <a href="#" class="delete"></a>
                                        <a href="#" class="edit"></a>
                                    </div>
                                    <input type="submit" name="submit" class="next-btn" id="submit_btn" value="" />
                                    <input type="submit" name="submit" class="cancel-btn" id="submit_btn" value="" />
                                </li>
                            </ol>-->
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

<!DOCTYPE HTML>
<html lang="en">
    <head>
        <title>Dimage Share Viet Nam</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url() . 'customs/css/bootstrap.css' ?>"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="<?php echo base_url() . 'customs/css/customs.css' ?>"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">        
    </head>
    <body>
        <div class="container">
            <div class ="row">
                <div class="span12">
                    <div class="well">
                        <center><h1>PHP CODEIGNITER TEST</h1></center>
                    </div>
                </div>
            </div>
            
            <?php include 'navbar.php';?>
            
            <?php 
            if($this->session->flashdata('user_registered')):
                echo '<p class="alert alert-success">' . $this->session->flashdata('user_registered') . '</p>';
            endif;
            ?>
            
            <?php 
            if($this->session->flashdata('user_loggedin')):
                echo '<p class="alert alert-success">' . $this->session->flashdata('user_loggedin') . '</p>';
            endif;
            ?>
            
            <?php
            if($this->session->flashdata('user_updated')):
                echo '<p class="alert alert-success">' . $this->session->flashdata('user_updated') . '</p>';
            endif;
            ?>
            
            <?php 
            if($this->session->flashdata('user_loggedout')):
                echo '<p class="alert alert-success">' . $this->session->flashdata('user_loggedout') . '</p>';
            endif;
            ?>
            
            <?php 
            if($this->session->flashdata('user_actived')):
                echo '<p class="alert alert-success">' . $this->session->flashdata('user_actived') . '</p>';
            endif;
            ?>
            
            <?php 
            if($this->session->flashdata('login_falied')):
                echo '<p class="alert alert-danger">' . $this->session->flashdata('login_falied') . '</p>';
            endif;
            ?>
            
            <?php 
            if($this->session->flashdata('category_error')):
                echo '<p class="alert alert-danger">' . $this->session->flashdata('category_error') . '</p>';
            endif;
            ?>
            <?php 
            if($this->session->flashdata('category_deleted')):
                echo '<p class="alert alert-success">' . $this->session->flashdata('category_deleted') . '</p>';
            endif;
            ?>
            
            <?php 
            if($this->session->flashdata('post_actived')):
                echo '<p class="alert alert-success">' . $this->session->flashdata('post_actived') . '</p>';
            endif;
            ?>
            <div class="ui-widget">
                <!--<label for="tags">Tags: </label>
                <input id="tags">-->
              </div>
            <?php
                // Check Session User đăng nhập, chưa
            ?>
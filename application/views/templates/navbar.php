<?php
$uri = $this->uri->uri_string();

$danh_muc ='';
$bai_viet_cua_toi = '';
$bai_viet_cho_duyet = '';
$user_cho_duyet = '';
$thong_tin_nguoi_dung = '';
$dang_ky = '';
$dang_nhap = '';
$active = 'active';


if($uri == 'thong-tin-nguoi-dung'){
    $thong_tin_nguoi_dung = $active;
}else if($uri == 'dang-ky'){
    $dang_ky = $active;
}else if($uri == 'dang-nhap'){
    $dang_nhap = $active;
}
else if($uri == 'bai-viet'){
    $bai_viet = $active;
}
else if($uri == 'gioi-thieu'){
    $gioi_thieu = $active;
}else if($uri == 'danh-muc'){
    $danh_muc = $active;
}

?>
<div class="row" style="margin-bottom: 25px;">
    <div class="span12">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand" href="<?php echo base_url();?>">DimageShareVN</a>
                </div>
                <ul class="nav navbar-nav">
                <?php
                    if($this->session->userdata('logged_in')){ 
                        if($this->session->userdata('user_role') == 2){ ?>
                            <li class="<?php echo $bai_viet_cua_toi;?>"><a href="<?php echo base_url();?>bai-viet-cua-toi">Bài viết của tôi</a></li>
                <?php   }
                        else if($this->session->userdata('user_role') == 1){ ?>
                            <li class="<?php echo $danh_muc;?>"><a href="<?php echo base_url();?>danh-muc">Danh mục</a></li>
                            <li class="<?php echo $bai_viet_cho_duyet;?>"><a href="<?php echo base_url();?>bai-viet-cho-duyet">Bài viết chờ duyệt</a></li>
                            <li class="<?php echo $user_cho_duyet;?>"><a href="<?php echo base_url();?>user-cho-duyet">User chờ duyệt</a></li>
                <?php   }
                    }?>
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <?php
                    if($this->session->userdata('logged_in')){?>
                        <?php 
                               if($this->session->userdata('user_role') == 2){ ?>
                                <li><a href="<?php echo base_url();?>bai-viet/them-moi"><span class="glyphicon glyphicon-book"></span>Thêm bài</a></li>
                        <?php }       
                              else if($this->session->userdata('user_role') == 1){ ?>
                                <li><a href="<?php echo base_url();?>danh-muc/them-moi"><span class="glyphicon glyphicon-book"></span>Thêm danh mục</a></li>
                        <?php 
                            }
                        ?>
                        <li class="<?php echo $thong_tin_nguoi_dung;?>"><a href="<?php echo base_url();?>thong-tin-tai-khoan"><span class="glyphicon glyphicon-user"></span> <?php echo $this->session->userdata('username'); ?></a></li>
                        <li><a href="<?php echo base_url();?>users/logOut"><span class="glyphicon glyphicon-log-out"></span> Thoát</a></li>
                    <?php    
                    }else{
                    ?>
                        <li class="<?php echo $dang_ky;?>"><a href="<?php echo base_url();?>dang-ky"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
                        <li class="<?php echo $dang_nhap;?>"><a href="<?php echo base_url();?>dang-nhap"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
                    <?php
                    }
                    ?>
                </ul>
          </div>
        </nav>
    </div>
</div>
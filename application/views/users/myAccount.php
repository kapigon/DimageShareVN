<?php echo validation_errors(); ?>
<?php    
    $checked    = '';
    $name       = '';
    $username   = '';
    $email      = '';
    $password   = '';
    $rePassword = '';
    $id         = 0;
    if(isset($info) && count($info) > 0){
        $cUser      = $info[0];
        $name       = $cUser->name;
        $username   = $cUser->username;
        $email      = $cUser->email;
        $id         = $cUser->id;
        $password   = '';
        $rePassword = '';
        
        if(isset($_POST['name'])){
            $name = $_POST['name'];
        }

        if(isset($_POST['username'])){
            $username = $_POST['username'];
        }

        if(isset($_POST['email'])){
            $email = $_POST['email'];
        }
        
        if(isset($_POST['id'])){
            $id= $_POST['id'];
        }
    }
?>

<form class="form-horizontal" action="<?php echo base_url();?>Users/updateUser" method="post">
    <div class="form-group">
      <label for="usr" class="col-sm-2 control-label">Tên đăng nhập</label>
      <div class="col-sm-10">
        <input type="username" class="form-control"  id="usr"  name="username" placeholder="Tên đăng nhập" value="<?php echo $username;?>" readonly>
      </div>
    </div>
    
    <div class="form-group">
      <label for="name" class="col-sm-2 control-label">Tên</label>
      <div class="col-sm-10">
        <input type="name" class="form-control"  id="name"  name="name" placeholder="Tên" value="<?php echo $name;?>">
      </div>
    </div>
    <div class="form-group">
      <label for="email" class="col-sm-2 control-label">Email</label>
      <div class="col-sm-10">
        <input type="email" class="form-control"  id="email"  name="email" placeholder="Email" value="<?php echo $email;?>" readonly>
      </div>
    </div>
    
    <div class="form-group">
      <label for="pwd" class="col-sm-2 control-label">Mật khẩu</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="pwd"   name="password" placeholder="Mật khẩu" value="<?php echo $password;?>">
      </div>
    </div>
    
    <div class="form-group">
      <label for="repwd" class="col-sm-2 control-label">Mật khẩu nhắc lại</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="repwd"   name="re-password" placeholder="Mật khẩu nhắc lại" value="<?php echo $rePassword;?>">
      </div>
    </div>
    
    <!--<div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label>
            <input type="checkbox" name="active"> kích hoạt
          </label>
        </div>
      </div>
    </div>-->
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-warning" value="Cập nhật" name="Update">Cập nhật</button>
        <input type="hidden" name="id" value='<?php echo $id; ?>'/>
      </div>
    </div>
</form>
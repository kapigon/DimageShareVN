<h2><?php echo $post['title']; ?></h2>
<br/><br/>
<div class="row">
    <div class="col-md-4">
        <img class="col-md-12" src="<?php echo site_url(); ?>customs/images/posts/<?php echo $post['post_image']; ?>">
    </div>
    <div class="col-md-8">
        <small class="post-date">Ngày đăng: <?php echo $post['created_at']; ?></small><br>
        <div class="post-body">
                <?php echo $post['body']; ?>
        </div>
    </div>
</div>
<br><br>
<?php if($this->session->userdata('user_id') == $post['user_id']): ?>
	<hr>
	<a class="btn btn-default pull-left" href="<?php echo base_url(); ?>bai-viet/sua/<?php echo $post['id']; ?>">Sửa</a>
	<?php echo form_open('/bai-viet/xoa/'.$post['id']); ?>
            <input type="submit" value="Xóa" class="btn btn-danger">
	</form>
<?php endif; ?>
<br>
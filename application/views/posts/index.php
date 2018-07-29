<h2><?= $title ?></h2>

<?php 
    foreach($posts as $post): ?>
        <div class="row">
            <div class="col-md-2">
                <img class="post-thumb" src="<?php echo site_url(); ?>customs/images/posts/<?php echo $post['post_image']; ?>">
            </div>
            <div class="col-md-10">
                <h3><?php echo $post['title']; ?></h3>
                <small class="post-date">Ngày đăng: <?php echo $post['created_at']; ?></small>
            <br/>
            <?php echo word_limiter($post['body'], 45); ?>
            <br>
            <p><a class="btn btn-default" href="<?php echo site_url('/bai-viet/'.$post['slug']); ?>">Đọc thêm</a>
                <?php if(!$post['active']){ ?>
                    <button type="button" class="btn btn-danger">Chưa duyệt</button>
                <?php } ?>
            </p>
            </div>
	</div>
        <br><br>
<?php endforeach; ?>

<div class="pagination-links">
    <?php echo $this->pagination->create_links();?>
</div>

   
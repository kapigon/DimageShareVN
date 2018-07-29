<h2><?= $title ?></h2>

<?php 
    foreach($posts as $post): ?>
        <div class="row">
            <div class="col-md-2">
                <img class="post-thumb" src="<?php echo site_url(); ?>customs/images/posts/<?php echo $post['post_image']; ?>">
            </div>
            <div class="col-md-10">
                <h3><?php echo $post['title']; ?></h3>
                <small class="post-date">Ngày tạo: <?php echo $post['created_at']; ?></small>
            <br/>
            <?php echo word_limiter($post['body'], 60); ?>
            <br>
            <p>
                <?php if($this->session->userdata('user_role') == 1): ?>
                <form class="cat-delete" action="bai-viet/duyet/<?php echo $post['id']; ?>" method="POST">
                    <input type="submit" class="btn btn-default" value="Duyệt">
                </form>
                <?php endif; ?>
            </p>
            </div>
	</div>
        <br><br>
<?php endforeach; ?>

<div class="pagination-links">
    <?php echo $this->pagination->create_links();?>
</div>

   
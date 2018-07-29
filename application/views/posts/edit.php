<h2><?= $title; ?></h2>

<?php echo validation_errors(); ?>

<?php echo form_open_multipart('posts/update'); ?>
	<input type="hidden" name="id" value="<?php echo $post['id']; ?>">
        <div class="form-group">
          <label>Title</label>
          <input type="text" class="form-control" name="title" placeholder="Tiêu đề" value="<?php echo $post['title']; ?>">
        </div>
        <div class="form-group">
          <label>Body</label>
          <textarea id="editor" class="form-control" name="body" placeholder="Nội dung"><?php echo $post['body']; ?></textarea>
        </div>
        <div class="form-group">
          <label>Danh mục</label>
          <select name="category_id" class="">
            <?php foreach($categories as $category): ?>
              <option value="<?php echo $category['id']; ?>"  selected="<?php if($category['id'] == $post['category_id']) echo 'selected';?>">
                  <?php echo $category['name']; ?>
              </option>
            <?php endforeach; ?>
          </select>
        </div>
        <div class="form-group">
            <label>Tải ảnh</label>
            <input type="file" name="post_image" size="20">
        </div>
  <button type="submit" class="btn btn-default">Cập nhật</button>
</form>
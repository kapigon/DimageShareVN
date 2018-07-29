<h2><?= $title; ?></h2>

<?php echo validation_errors(); ?>

<?php echo form_open_multipart('posts/create'); ?>
  <div class="form-group">
    <label>Tiêu đề</label>
    <input type="text" class="form-control" name="title" placeholder="Thêm tiêu đề">
  </div>
  <div class="form-group">
    <label>Nội dung</label>
    <textarea id="editor" class="form-control" name="body" placeholder="Thêm nội dung"></textarea>
  </div>
  <div class="form-group">
        <label>Danh mục</label> <br/>
        <select name="category_id" class="">
            <?php foreach($categories as $category): ?>
                  <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
            <?php endforeach; ?>
        </select>
  </div>
  <div class="form-group">
        <label>Tải ảnh</label>
        <input type="file" name="post_image" size="20">
  </div>
  <button type="submit" class="btn btn-default">Thêm mới</button>
</form>
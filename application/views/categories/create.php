<h2><?= $title ;?></h2>

<?php echo validation_errors(); ?>

<?php echo form_open_multipart('categories/create'); ?>
	<div class="form-group">
            <label>Tên</label>
            <input type="text" class="form-control" name="name" placeholder="Nhập danh mục">
	</div>
	<button type="submit" class="btn btn-default">Thêm mới</button>
</form>
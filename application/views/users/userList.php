<h2> <?= $title ?></h2>
<?php echo validation_errors(); ?>

<table class="table table-striped"> 
    <thead> 
        <tr> 
            <th>#</th>
            <th>Email</th>
            <th>Tên</th>
            <th>Tên đăng nhập</th>
            <th class="text-center">Duyệt</th>
        </tr> 
    </thead> 
    <tbody> 
        <?php
        if(count($users) > 0){
            $count = 1;
            foreach($users as $user){?>
                <tr>
                    <th scope="row"><?php echo $count; ?></th>
                    <td><?php echo $user['email']; ?></td> 
                    <td><?php echo $user['name']; ?></td>
                    <td><?php echo $user['username']; ?></td>
                    <td class="text-center">
                        <form class="cat-delete" action="user-cho-duyet/<?php echo $user['id']; ?>" method="POST">
                            <input type="submit" class="btn btn-default" value="Duyệt">
                        </form>
                    </td>
                </tr> 
            <?php
                $count++;
            }
        }
        ?>
    </tbody> 
</table>

<div class="pagination-links">
    <?php echo $this->pagination->create_links();?>
</div>

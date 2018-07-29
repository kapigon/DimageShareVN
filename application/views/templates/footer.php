<?php
    /* Paging */
    echo isset($list_pagination) ? $list_pagination : '';
?>

<div class="row">
    <div class="span12">
        <div class="well">
            <center><h3>Copyright &copy; hoalp2908@gmail.com</h3></center>
        </div>
    </div>
</div>

        </div>
    </body>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/10.1.0/classic/ckeditor.js"></script>
                
        <script type="text/javascript">
            ClassicEditor
                .create( document.querySelector( '#editor' ) )
                .catch( error => {
                    console.error( error );
                } );
        </script>
</html>
###################
DimageShareVN
###################

*******************
Cài đặt cổng 8080
*******************
Đường dẫn: DimageShareVN\application\config\config.php
$config['base_url'] = 'http://localhost:8080/DimageShareVN';


*******************
Cài đặt SQL
*******************
Đường dẫn: DimageShareVN\news.sql

*******************
Cấu hình database
*******************
Đường dẫn: DimageShareVN\application\config\database.php
$db['default'] = array(
	'dsn'	=> '',
	'hostname' => 'localhost',
	'username' => 'root',
	'password' => '',
	'database' => 'news',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);

*******************
Tài khoản đăng nhập
*******************
* Tài khoản admin : 
	Username: admin / password: 123456

* Tài khoản author : 
	Username: author  / password: 123456
	Username: author1 / password: 123456
	
*******************
Sử dụng
*******************
* Tài khoản admin: có quyền tạo danh mục, duyệt bài viết tạo do author, duyệt user đăng ký

* Tài khoản author: có quyền tạo, chỉnh sửa, xóa bài viết của mình tạo

*******************
Thời gian sử dụng lần cuối
*******************
30/7/2018

###################
NGƯỜI LÀM BÀI TEST
###################
Họ và tên: Lê Đình Hòa
Email: hoalp2908@gmail.com
ĐT: 0902255004

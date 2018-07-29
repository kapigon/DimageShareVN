<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

$route['bai-viet-cho-duyet']    = 'posts/waitActive';
$route['bai-viet/them-moi']     = 'posts/create';
$route['bai-viet/duyet/(:any)'] = 'posts/active/$1';
$route['bai-viet/sua/(:any)']   = 'posts/edit/$1';
$route['bai-viet/xoa/(:any)']   = 'posts/delete/$1';
$route['bai-viet/(:any)']       = 'posts/view/$1';
$route['bai-viet-cua-toi']      = 'posts/myPosts';
$route['bai-viet']              = 'posts/index';

$route['bai-viet-theo-danh-muc/(:any)'] = 'categories/posts/$1';
$route['danh-muc/them-moi']             = 'categories/create';
$route['danh-muc']                      = 'categories/index';

$route['dang-nhap']             = 'users/login';
$route['dang-ky']               = 'users/register';
$route['user-cho-duyet/(:any)']  = 'users/activeUser/$1';
$route['thong-tin-tai-khoan']   = 'users/MyAccount/';
$route['user-cho-duyet']        = 'users/waitActive';
$route['users']                 = 'users/view';
$route['users/(:any)']          = 'users/$1';

$route['default_controller'] = 'posts/index';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

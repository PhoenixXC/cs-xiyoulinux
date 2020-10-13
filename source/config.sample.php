<?php
/*配置文件
 * 
 * 此文件主要配置一些常量等等
 * 
 * */

/*网站根目录*/
define('BASE_PATH', dirname(__FILE__));
/**/
define('SITE_DOMAIN','http://***.org');

/*MYSQL地址*/
define('MYSQL_HOST', 'localhost');
/*数据库用户名*/
define('MYSQL_USER_NAME', '***');
/*数据库密码*/
define('MYSQL_USER_PASSWORD', '***');
/*数据库名*/
define('MYSQL_DB_NAME', 'cs_linux');
/*数据库字符集*/
define('MYSQL_CHARSET', 'utf8');

/*邮件通知相关配置*/
define('SMTP_SERVER_HOST', 'smtp.exmail.qq.com');
define('SMTP_SERVER_PORT', 25);
define('SMTP_SERVER_EMAIL', '***');
define('SMTP_SERVER_USER', '***');
define('SMTP_SERVER_PASS', '***');

# 报名二维码地址
define('JOIN_QR_LINK', 'http://join.xiyoulinux.org');

/*Smary相关配置*/
define('SMARTY_HOME_PATH', '/usr/local/lib/php/smarty');

?>

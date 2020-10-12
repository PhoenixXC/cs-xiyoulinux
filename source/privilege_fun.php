<?php
require_once(dirname(__FILE__) . '/includes/user.class.php');

//if (!isset($_SESSION['uid'])) {
//    exit;
//}

function isadmin($flag = true)
{
    $userObj = new UserClass();
    $permisson = $userObj->get_privilege($_SESSION['uid']);
    if($permisson != '1') {
        if($flag == true){
	    echo '<script type="text/javascript">javascript:history.back(1);</script>';
            //header('location: ' . $_SERVER["HTTP_REFERER"]);
            exit;
        }else
        return false;
    }
    return true;
}

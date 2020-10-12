<?php
    include_once(dirname(__FILE__) . '/config.php');
    include_once(SMARTY_HOME_PATH . '/Smarty.class.php');
    
    $smarty = new Smarty();
    $smarty->template_dir = BASE_PATH . '/templates/';
    $smarty->compile_dir = BASE_PATH . '/templates_c/';
    $smarty->config_dir = BASE_PATH . '/configs/';
    $smarty->cache_dir = BASE_PATH . '/cache/';
    $smarty->left_delimiter = '<{';
    $smarty->right_delimiter = '}>';

    $smarty->assign("site_domain", SITE_DOMAIN);
?>

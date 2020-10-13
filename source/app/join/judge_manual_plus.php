<?php
require_once('./preprocess.php');
require_once(BASE_PATH . '/privilege_ctrl.php');

/**
 * 获取所有的面试记录
 */

if (isset($_GET["uid"])) $uid = $_GET["uid"];
else {
	$sql = "SELECT * FROM app_join_info WHERE status = ".$Current_Status;
	$result = $dbObj->query($sql);
	if($result->num_rows > 0)
	{
		$com = $result->fetch_assoc();
		$uid = $com["uid"];
	}
}
if (isset($uid))
{
	$sql = "SELECT * FROM app_join_info WHERE uid = ".$uid;
	$result = $dbObj->query($sql);
	if($result->num_rows > 0)
	{
		$com = $result->fetch_assoc();
		$info = $com;
	}
	$sql = "SELECT * FROM app_join_record WHERE uid = ".$uid." ORDER BY rid DESC";
    $graderesult = $dbObj->query($sql);
    $records = array();
	while ($g1 = $graderesult->fetch_assoc()) {
		$json_str = $CUser->get_userinfo($g1["interviewer"]);
		$user_obj = json_decode($json_str);
        $g1["interviewer"] = $user_obj[0]->name;
        $round = $g1["round"];
		if (!$records[$round]) {
            $records[$round] = array();
        }
        array_push($records[$round], $g1);
    }
    
}
$smarty->assign("info", $info);
$smarty->assign("records", $records);
$smarty->assign("chineseNum", array("加面", "一面", "二面", "三面", "四面", "五面"));

$smarty->display(dirname(__FILE__) . '/templates/judge_manual_plus.tpl');
?>
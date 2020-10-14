<{extends file="../../../templates/frame.tpl"}>

<{block name="stylesheet" append}>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/hide.css" type="text/css" />
<{/block}>

<{block name="content"}> 
    <div class="row page-content">
        <div id="op-hide" class="glyphicon glyphicon-resize-full hidden" aria-hidden="true" id="hideItem"></div>
        <div id="v-aside" class="col-md-4">
            <div class="panel panel-default">
                <div id="op" class="glyphicon glyphicon-resize-small" aria-hidden="true"></div>
                <div class="panel-body">
                    <ul class="nav nav-list">
                        <li class="nav-list-group">
                            概览
                        </li>
                        <li class="nav-list-item">
                            <a href="index.php"><i class="fa fa-home"></i> 管理面板</a>
                        </li>
                        <li class="nav-list-item">
                            <a href="record.php"><i class="fa fa-list"></i> 报名记录
                                <span class="badge bg-info"><{$status["round1"]}></span>
                            </a>
                        </li>
                        <li class="nav-list-group">
                            面试
                        </li>
                        <li class="nav-list-item">
                            <a href="start.php"><i class="fa fa-pencil"></i> 面试评价</a>
                        </li>
                        <li class="nav-list-item">
                            <a href="history.php"><i class="fa fa-edit"></i> 评价记录</a>
                        </li>
                        </li>
                        <li class="nav-list-group">
                            决策
                        </li>
                        <li class="nav-list-item">
                            <a id="judge_link" data-privilege="<{$laside_user_privilege}>" href="judge.php"><i class="fa fa-check"></i> 结果筛选</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <legend>人数统计</legend>
                    <ul class="summary-list">
                        <li class="summary-list-item">
                            <a href="record.php"><h3 class="count text-dark"><{$status["round1"]}></h3> 报名/一面</a>
                        </li>
                        <li class="summary-list-item">
                            <h3 class="count text-info"><{$status["round2"]}></h3> 加面
                        </li>
                        <li class="summary-list-item">
                            <h3 class="count text-primary"><{$status["round3"]}></h3> 二面
                        </li>
                        <li class="summary-list-item">
                            <h3 class="count text-success"><{$status["round4"]}></h3> 三面
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="v-main" class="col-md-8">
            <legend>手动决策</legend>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <h4 class="col-md-6"><{$info["uid"]}> | <{$info["name"]}> | <{$info["class"]}> </h4>
                        <div class="col-md-2"><a data-type="button" data-action="pass" class="btn btn-success btn-block">通 过</a></div>
                        <div class="col-md-2"><a data-type="button" data-action="drop" class="btn btn-danger btn-block">淘 汰</a></div>
                        <div class="col-md-2"><a data-type="button" data-action="undecide" class="btn btn-warning btn-block">待 定</a></div>
                    </div>
                </div>
            </div>

            <{foreach $records as $round=>$roundRes}>
                <h4 data-toggle="collapse" data-target="#round-collapse-<{$round}>">
                    <{$chineseNum[$round]}>
                </h4>
                <div class="row" id="round-collapse-<{$round}>">
                    <div class="col-md-12">
                        <div class="panel-group" id="accordion">
                        <{foreach $roundRes as $index=>$res}>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <legend data-toggle="collapse" data-parent="#accordion" href="#collapse-<{$res["rid"]}>">
                                        <{if $res["grade"] == 5}> S
                                        <{elseif $res["grade"] == 4}> A+
                                        <{elseif $res["grade"] == 3}> A-
                                        <{elseif $res["grade"] == 2}> B
                                        <{elseif $res["grade"] == 1}> C
                                        <{/if}>
                                        <{$res["interviewer"]}>
                                    </legend>
                                    <div id="collapse-<{$res["rid"]}>" class="panel-collapse collapse in">
                                        <p><label class="label bg-info">基础技能</label></p>
                                        <p><{$res["basic_skill"]}></p>
                                        <p><label class="label bg-info">加分技能</label></p>
                                        <p><{$res["extra_skill"]}></p>
                                        <p><label class="label bg-info">总体评价</label></p>
                                        <p><{$res["overall"]}></p>
                                    </div>
                                </div>
                            </div>
                        <{/foreach}>
                        </div>
                    </div>
                </div>
            <{foreachelse}>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <legend>
                                    没有面试记录
                                </legend>
                            </div>
                        </div>
                    </div>
                </div>
            <{/foreach}>

        </div>

    </div>
<{/block}>

<{block name="scripts" append}>
<script type="text/javascript" src="js/hide.js"></script>
<script type="text/javascript">
    (function() {
        var uid = "<{$info["uid"]}>";
        console.log(uid);
        if (uid == "") {
            alert("本轮决策已完成！");
            location.href="judge.php";
        }
    })();
    $('[data-type="button"]').click(function() {
        var param = {
            action: $(this).data("action"),
            uid: "<{$info["uid"]}>"
        };

        $.post("./async.php", param, function(data) {
            location.href="judge_manual_plus.php";
        });
    });
</script>
<{/block}>

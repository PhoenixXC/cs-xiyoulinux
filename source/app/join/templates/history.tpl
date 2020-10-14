<{extends file="../../../templates/frame.tpl"}>

<{block name="stylesheet" append}>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/hide.css" type="text/css" />
<style type="text/css">
    .panel-group .panel {
        border: 0px;
        -webkit-box-shadow: 0 0px 0px rgba(0, 0, 0, .05); */
        box-shadow: 0 0px 0px rgba(0, 0, 0, .05);
    }
    .panel-heading {
        border-radius: 0px;
        background-color: white !important;
        box-shadow: unset !important;
        border-top: unset !important;
        border-bottom: unset !important;
    }
    .panel-group .panel-heading + .panel-collapse .panel-body {
        border-top: 0px solid #eaedef;
    }
</style>
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
                        <li class="nav-list-item active">
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
                <ul class="history-list">
                    <{section name=n loop=$records}>
                    <li class="history-list-item">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <legend>评价记录</legend>
                                <div class="row">
                                    <div class="col-md-12" style="border-bottom: 1px solid #dadada;">
                                        <p><label class="label bg-info">报名信息</label></p>
                                        <p>编号：<strong><{$records[n]["uid"]}></strong></p>
                                        <p>姓名：<strong><{$records[n]["name"]}></strong></p>
                                        <p>班级：<{$records[n]["class"]}></p>
                                        <p><label class="label bg-info">面试信息</label></p>
                                        <p>环节：<strong>
                                        <{if $records[n]["round"] == 0}>0<{else}><{$records[n]["round"]}><{/if}>
                                        </strong>面</p>
                                        <p>等级：<strong>
                                            <{if $records[n]["grade"] == 5}> S
                                            <{elseif $records[n]["grade"] == 4}> A+
                                            <{elseif $records[n]["grade"] == 3}> A-
                                            <{elseif $records[n]["grade"] == 2}> B
                                            <{elseif $records[n]["grade"] == 1}> C
                                            <{/if}> 
                                        </strong></p>
                                        <p><label class="label bg-info">面试时间</label></p>
                                        <p><{$records[n]["time"]}></p>
                                    </div>
                                    <div class="col-md-12" style="margin-top:10px;padding-left:0px;padding-right:0px;">
                                        <div class="panel-group" id="accordion" style="margin-bottom: 0px">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" 
                                                        href="#collapseOne-<{$smarty.section.n.index}>">
                                                            <label class="label bg-info">基础技能</label>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne-<{$smarty.section.n.index}>" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <{$records[n]["basic"]}>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" 
                                                        href="#collapseTwo-<{$smarty.section.n.index}>">
                                                            <label class="label bg-info">加分技能</label>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo-<{$smarty.section.n.index}>" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <{$records[n]["extra"]}>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" 
                                                        href="#collapseThree-<{$smarty.section.n.index}>">
                                                            <label class="label bg-info">总体评价</label>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseThree-<{$smarty.section.n.index}>" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <{$records[n]["overall"]}>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <{sectionelse}>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                您还没有对任何人进行面试评价！
                            </div>
                        </div>
                    <{/section}>
                </ul>
            </div>
        </div>
    </div>
<{/block}>

<{block name="scripts" append}>
    <script type="text/javascript" src="js/init.js"></script>
    <script type="text/javascript" src="js/hide.js"></script>
    <script type="text/javascript">

    </script>

<{/block}>

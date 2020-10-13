<{extends file="../../../templates/base.tpl"}>

<{block name="stylesheet" append}>
<link rel="stylesheet" href="<{$site_domain}>/js/datatables/datatables.css" type="text/css" />
<link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/bootstrap-switch/3.0.1/css/bootstrap2/bootstrap-switch.min.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<style>
    div#control {
        display: block;
        position: absolute;
        top: 50%;
        left: 0%;
        padding: 10px;
        color: white;
        background: #5a6a7ae3;
        z-index: 1;
        box-shadow: 3px 11px 20px 0px #0000005c;
    }
</style>
<{/block}>

<{block name="frame"}> 
    <div class="row page-content" style="margin: 20px;">
        <div id="control"><div>隐藏</div></div>
        <div class="col-md-4" id="aside">
            <div class="panel panel-default">
                <div class="panel-body">
                    <legend>面试签到</legend>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="input-group">
                                <span class="input-group-addon">编号或学号</span>
                                <input id="input_id" type="text" class="form-control" value="" required />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <button id="btn_sign" class="btn btn-primary btn-block">确认签到</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <legend style=>现场报名</legend>
                    <p>请扫描下方二维码，关注官方微信平台，通过右下方“其他功能”->“纳新报名”完成报名。</p>
                    <span id="hidden-link" class="hidden"><{$join_qr_link}></span>
                    <div id="join-qrcode" style="margin: auto; display: table;"></div>
                </div>
            </div>    
        </div>
        <div class="col-md-8" id="sign-info">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="tabbable">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">待面试队列</a></li>
                            <li class=""><a href="#tab2" data-toggle="tab">已面试队列</a></li>
                        </ul>
                        <div style="position: absolute; top: 20px; right: 35px;">
                            <input type="checkbox" name="refresh-switch" data-handle-width="50" data-label-text="刷新" data-on-text="开" data-off-text="关"  checked>
                        </div>
                        <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="table-responsive">
                                <table class="table table-striped m-b-none" data-ride="datatables" data-tag="signed">
                                    <thead><tr>
                                        <th>编号</th>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>专业班级</th>
                                        <th>签到时间</th>
                                        <th>面试安排</th>
                                        <th style="width:120px;">操作</th>
                                    </tr></thead>
                                    <tbody>
                                        <{section name=n loop=$called_list}>
                                            <tr class="info">
                                                <td><{$called_list[n]["uid"]}></td>
                                                <td><{$called_list[n]["sno"]}></td>
                                                <td><{$called_list[n]["name"]}></td>
                                                <td><{$called_list[n]["class"]}></td>
                                                <td><{$called_list[n]["time"]}></td>
                                                <td>已被 <strong><{$called_list[n]["interviewer"]}></strong> 叫号</td>
                                                <td>
                                                    <a data-action="interview" data-qid="<{$called_list[n]['qid']}>" class="btn btn-xs btn-success">面试</a>
                                                    <a data-action="delsign" data-qid="<{$called_list[n]['qid']}>" class="btn btn-xs btn-danger">删除</a>
                                                </td>
                                            </tr>
                                        <{/section}>
                                        <{section name=n loop=$signed_list}>
                                            <tr>
                                                <td><{$signed_list[n]["uid"]}></td>
                                                <td><{$signed_list[n]["sno"]}></td>
                                                <td><{$signed_list[n]["name"]}></td>
                                                <td><{$signed_list[n]["class"]}></td>
                                                <td><{$signed_list[n]["time"]}></td>
                                                <td>待安排面试</td>
                                                <td>
                                                    <a data-action="delsign" data-qid="<{$signed_list[n]['qid']}>" class="btn btn-xs btn-danger">删除</a>
                                                </td>
                                            </tr>
                                        <{/section}>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="table-responsive">
                                <table class="table table-striped m-b-none" data-ride="datatables" data-tag="interviewed">
                                    <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>学号</th>
                                            <th>姓名</th>
                                            <th>专业班级</th>
                                            <th>签到时间</th>
                                            <th>面试安排</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <{section name=n loop=$interviewed_list}>
                                            <tr>
                                                <td><{$interviewed_list[n]["uid"]}></td>
                                                <td><{$interviewed_list[n]["sno"]}></td>
                                                <td><{$interviewed_list[n]["name"]}></td>
                                                <td><{$interviewed_list[n]["class"]}></td>
                                                <td><{$interviewed_list[n]["time"]}></td>
                                                <td>已被 <strong><{$interviewed_list[n]["interviewer"]}></strong> 面试</td>
                                                <td>
                                                    <a data-action="reset" data-qid="<{$interviewed_list[n]['qid']}>" class="btn btn-xs btn-warning">撤销</a>
                                                </td>
                                            </tr>
                                        <{/section}>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>        
        </div>
    </div>
<{/block}>

<{block name="scripts" append}>
<script type="text/javascript" src="<{$site_domain}>/js/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/bootstrap-switch/3.0.1/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="js/init.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<script type="text/javascript">

var qr_link = $("#hidden-link").text();
$('#join-qrcode').qrcode({width: 200, height: 200,text: qr_link});

$('#control').click(function(){
  if ($("#control").text() === '隐藏') {
      $("#control").text('显示');
      $("#aside").addClass("hidden");
      $("#sign-info").removeClass();
      $("#sign-info").addClass("col-md-12");
      $("#DataTables_Table_1").css("font-size", "larger");
  } else {
      $("#control").text('隐藏');
      $("#aside").removeClass('hidden');
      $("#sign-info").removeClass();
      $("#sign-info").addClass("col-md-8");
      $("#DataTables_Table_1").css("font-size", "unset");
  }
})

$(document).ready(function() {
    reg_signed_events();
    reg_interviewed_events();
    
    var t = setInterval(function() {
        update_signed_data();
    }, 2000);
    $("[name='refresh-switch']").bootstrapSwitch().on('switchChange.bootstrapSwitch', function(event, state) {
        if (state == true) {
            t = setInterval(function() {
                update_signed_data();
                update_interviewed_data()
            }, 4000);    
        } else {
            clearInterval(t);
        }
    });
    $('[href="#tab1"]').click(function() {
        clearInterval(t);
        update_signed_data();
        t = setInterval(function() {
            update_signed_data();
        }, 4000);    
    });
    $('[href="#tab2"]').click(function() {
        update_interviewed_data();
        clearInterval(t);
        t = setInterval(function() {
            update_interviewed_data();
        }, 4000);
    });

    $("#btn_sign").click(function() {
        var param = {
            action: "sign",
            id: $("#input_id").val()
        }

        if (param.id == "") {
            alert("请输入学号或者编号！");
            return false;
        }

        $.post("./async.php", param, function (data) {
            if (data == "1") {
                update_signed_data();
                alert("签到成功！");
            }

            if (data == "0") {
                alert("签到失败，请重试！");
                return false;
            }
            if (data == "-1") {
                alert("不存在此学号或者编号，请扫码报名！");
                return false;
            }
            if (data == "-2") {
                alert("该用户未进入本轮面试！");
                return false;
            }
        });
    });

    $(document).keyup(function(e) {
        if (e.which == 13) {
            $("#btn_sign").trigger("click");
        }
    });

    function reg_signed_events() {
        $('[data-action="delsign"]').click(function() {
            var btn = $(this);
            var param = {
                action: "delsign",
                qid: $(this).data("qid")
            }

            $.post("./async.php", param, function (data) {
                if (data == "1") {
                    btn.parents("tr").remove();
                }
            });
        });

        $('[data-action="interview"]').click(function() {
            var btn = $(this);
            var param = {
                action: "intsign",
                qid: $(this).data("qid")
            }

            $.post("./async.php", param, function (data) {
                if (data == "1") {
                    btn.parents("tr").remove();
                }
            });
        });
    }

    function reg_interviewed_events() {
        $('[data-action="reset"]').click(function() {
            var btn = $(this);
            var param = {
                action: "resetsign",
                qid: $(this).data("qid")
            }
            $.post("./async.php", param, function (data) {
                if (data == "1") {
                    btn.parents("tr").remove();
                }
            });
        });
    }

    function update_signed_data() {
        $.get("./async.php?action=getdata&tag=signed", function(data){
            var inner_html = "";
            if (data) {
                var data = JSON.parse(data);
                if (data && data.length) {
                    for (var i=0, len=data.length; i<len; i++) {
                        inner_html += "<tr><td>" + data[i].uid + "</td>";
                        inner_html += "<td>" + data[i].sno + "</td>";
                        inner_html += "<td>" + data[i].name + "</td>";
                        inner_html += "<td>" + data[i].class + "</td>";
                        inner_html += "<td>" + data[i].time + "</td>";
                        if (data[i].interviewer != undefined && data[i].interviewer != "") {
                            inner_html += "<td>已被 <strong>" + data[i].interviewer + "</strong> 叫号</td>";
                            inner_html += '<td><a data-action=\"interview\" data-qid=\"' + data[i].qid + '\" class=\"btn btn-xs btn-success\">面试</a> ';
                            inner_html += '<a data-action=\"delsign\" data-qid=\"' + data[i].qid + '\" class=\"btn btn-xs btn-danger\">删除</a></td>';
                        } else {
                            inner_html +="<td>待安排面试</td>";
                            inner_html += '<td><a data-action=\"delsign\" data-qid=\"' + data[i].qid + '\" class=\"btn btn-xs btn-danger\">删除</a></td>';
                        }
                        inner_html += "</tr>";
                    }
                } else {
                    inner_html = '<tr class="odd"><td valign="top" colspan="7" class="dataTables_empty">没有查询到任何记录！</td></tr>';
                }
            }
            $('[data-ride="datatables"][data-tag="signed"]').find("tbody").html(inner_html);
            reg_signed_events();
        });
    }
    function update_interviewed_data() {
        $.get("./async.php?action=getdata&tag=interviewed", function(data){
            var inner_html = "";
            if (data) {
                var data = JSON.parse(data);
                if (data && data.length) {
                    for (var i=0, len=data.length; i<len; i++) {
                        inner_html += "<tr><td>" + data[i].uid + "</td>";
                        inner_html += "<td>" + data[i].sno + "</td>";
                        inner_html += "<td>" + data[i].name + "</td>";
                        inner_html += "<td>" + data[i].class + "</td>";
                        inner_html += "<td>" + data[i].time + "</td>";
                        inner_html += "<td>已被 <strong>" + data[i].interviewer + "</strong> 面试</td>";
                        inner_html += '<td><a data-action=\"reset\" data-qid=\"' + data[i].qid + '\" class=\"btn btn-xs btn-warning\">撤销</a></td>';
                        inner_html += "</tr>";
                    }
                } else {
                    inner_html = '<tr class="odd"><td valign="top" colspan="7" class="dataTables_empty">没有查询到任何记录！</td></tr>';
                }
            }
            $('[data-ride="datatables"][data-tag="interviewed"]').find("tbody").html(inner_html);
            reg_interviewed_events();
        });
    }
});
</script>

<{/block}>

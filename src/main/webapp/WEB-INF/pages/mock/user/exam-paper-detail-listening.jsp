<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    java.util.Date currentTime = new java.util.Date();//得到当前系统时间
    String str_date1 = formatter.format(currentTime); //将日期时间格式化
    String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式
    request.setAttribute("starttime ", str_date1);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>在线考试系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link rel="stylesheet" href="${ctx}/css/base.css"/>
    <link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/css/time.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/css/exam/ReadingQuestion.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${ctx}/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/js/modernizr.custom.js"></script>
    <script type="text/javascript" src="${ctx}/js/move-top.js"></script>
    <script type="text/javascript" src="${ctx}/js/easing.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.paginationone.js"></script>
    <%--<script type="text/javascript" src="${ctx}/js/audiojs/audio.min.js"></script>
    <script>
        audiojs.events.ready(function () {
            console.log('初始化');
            var as = audiojs.createAll();
        });
    </script>--%>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });

        function exitSystem() {
            window.location.href = "${ctx}/user/exitSys.action";
        }

        var beginTime = "";
        var startFalg = true;
        var intDiff = parseInt(60 * 30);//倒计时总秒数量
        function timer(intDiff) {
            window.setInterval(function () {
                var day = 0,
                    hour = 1,
                    minute = 30,
                    second = 0;//时间默认值
                if (intDiff > 0) {
                    startFalg = false;
                    day = Math.floor(intDiff / (60 * 60 * 24));
                    hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                    minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                } else {
                    startFalg = true;
                }
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                $('#day_show').html(day + "天");
                $('#hour_show').html('<s id="h"></s>' + hour + '时');
                $('#minute_show').html('<s></s>' + minute + '分');
                $('#second_show').html('<s></s>' + second + '秒');
                intDiff--;
            }, 1000);
        }

        function openModal() {
            $("#alertModal").modal({
                backdrop: "static"
            });
        }
       /* $("#btn_continue").click(function () {
            $("#container").css("display", "inline");
            beginTime = CurentTime();
            $("#sp_start").html("考试中.....");
            if (startFalg)
                timer(intDiff);
        })*/
        function doStartExam() {

            $("#alertModal").modal("hide");
            $("#container").css("display", "inline");
            beginTime = CurentTime();
            $("#sp_start").html("考试中.....");
            if (startFalg)
                timer(intDiff);
        }


        function doSubmitPassage() {
            $("#alertModalSubmit").modal("hide");
            var userId = "${userId}"
            savaOptionAnswer(${paperId},userId);
            var sub = Number(localStorage.getItem("subject"));
            alert(sub + "--");
            if(sub == 1||sub==2){//第一篇或第二篇的时候，获取下一篇内容
                var order = Number(sub) +1;//下一篇 序号
                alert("order"+order);
                getSecondReading(order);
                <%--alert("试卷id"+${paperId});--%>

                $("#question-div").css("display","none");
                $("#passage-div").css("display","inline");
                $("#navigation").css("display","none");


                // alert(localStorage.getItem("subject")+"   before");
                console.log("<<<<<<--" + localStorage.getItem("subject"));

                var subjectIdBefore = localStorage.getItem("subject");
                localStorage.setItem("subject",(Number(subjectIdBefore)+1));
                console.log("---->" + localStorage.getItem("subject"));
            }
            else {
                $("#alertModalNext").modal({
                    backdrop: "static"
                });
            }

        }

        function doSubmitNext() {

            $("#alertModalNext").modal("hide");
            localStorage.removeItem("subject");

            window.location.href="${ctx}/mock/queryWritingExamPaperDetail.action?paperId=${paperId}&userId=${userId}&timeStr=${timeStr}"
        }

        function CurentTime() {
            var now = new Date();
            var year = now.getFullYear();       //年
            var month = now.getMonth() + 1;     //月
            var day = now.getDate();            //日
            var hh = now.getHours();            //时
            var mm = now.getMinutes();          //分
            var ss = now.getSeconds();           //秒

            var clock = year + "-";
            if (month < 10)
                clock += "0";
            clock += month + "-";
            if (day < 10)
                clock += "0";
            clock += day + " ";
            if (hh < 10)
                clock += "0";
            clock += hh + ":";
            if (mm < 10) clock += '0';
            clock += mm + ":";
            if (ss < 10) clock += '0';
            clock += ss;
            return (clock);
        }

        function getNowFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var seperator2 = ":";
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                + " " + date.getHours() + seperator2 + date.getMinutes()
                + seperator2 + date.getSeconds();
            return currentdate;
        }

        function submitPaper() {
            var paperName = $("#paperName").val();
            var paperId = $("#paperId").val();
            var score = $('#myForm').serialize();
            $.post("${ctx}/dealPaper.action",
                {
                    "beginTime": beginTime,
                    "paperName": paperName,
                    "paperId": paperId,
                    "score": score,
                },
                function (data) {
                    alert(data.errorInfo);
                    document.myForm.attributes["action"].value = "${ctx}/toScoreQry.action?userId=${user.userId}";
                    $("form").submit();
                }, "json");
        }
    </script>

</head>
<body>
<%--确认提交模态框--%>
<div class="modal fade" id="alertModalNext" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">提示：将跳转到写作部分</h4>
            </div>
           <%-- <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group" style="padding: 10px;">
                        <span style="text-indent:25px;font-size: 14px">提交后将不可更改</span>
                    </div>

                </form>
            </div>--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_next" onclick="doSubmitNext()">确认</button>
            </div>
        </div>
    </div>
</div>
<%--确认提交模态框--%>
<div class="modal fade" id="alertModalSubmit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">确定提交本篇章？</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group" style="padding: 10px;">
                        <span style="text-indent:25px;font-size: 14px">提交后将不可更改</span>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_submit" onclick="doSubmitPassage()">确认提交</button>
            </div>
        </div>
    </div>
</div>
<!-- 开始考试的模态框 -->
<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">${description.title}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group" style="padding: 10px;">
                        <span style="text-indent:25px;font-size: 18px">${description.content}</span>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                <button type="button" class="btn btn-primary" id="btn_continue" onclick="doStartExam()">continue</button>
            </div>
        </div>
    </div>
</div>
<div class="header">
    <div class="container">
        <div class="header-nav">
            <nav class="navbar navbar-default">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h3><span>欢迎您，<font color="blue">${userName }</font> 同学</span></h3>
                </div>

                <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/user/toIndex.action">首页</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/toUserInfo.action">个人中心</a></li>
                        <!-- <li><a class="hvr-overline-from-center button2" href="onlinecheck.html">在线考试</a></li> -->
                        <li><a class="hvr-overline-from-center button2"
                               href="${ctx}/toScoreQry.action?userId=${user.userId}">成绩查询</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/toMyBooksPage.action">我的错题本</a>
                        </li>
                        <li><a class="hvr-overline-from-center button2  active"
                               href="${ctx}/mock/toMyExamPaperPage.action">我的试卷</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/toAbout.action">关于</a></li>
                    </ul>
                    <div class="search-box">
                        <div id="sb-search" class="sb-search">
                            <span class="sb-icon-search" onclick="exitSystem()"></span>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>

<div class="time-item">
    <table class="table">
        <thead>
        <tr>
            <th>
                <!-- <span id="day_show">0天</span> -->
                <strong id="hour_show">0时</strong>
                <strong id="minute_show">0分</strong>
                <strong id="second_show">0秒</strong>
            </th>
            <th>
                <a href="javascript:void(0);" onclick="openModal()"><span class="label label-primary"
                                                                          id="sp_start">开始考试</span></a>
            </th>
        </tr>
        </thead>
    </table>
</div>
<form action="${ctx}/dealPaper.action" method="post" id="myForm" name="myForm">
    <!-- <div class="typrography"> -->
    <div style="display: none" id="container">
        <div class="row">
            <div class="col-md-10" style="padding-left: 50px;" >
                <div id="navigation" style="display: none">
                    <div class="pagination ue-clear" ></div>
                </div>
            </div>
            <div class="col-md-2">
                <a type="button" class="btn btn-primary" id="submitGroup" >提交本题</a>
            </div>

        </div>
        <%--<span id="localCount">当前第${dataList[0].questionNum}/${dataList[0].questionCount}</span>--%>
        <div class="content" id="myDiv">
            <div id="passage-div">
                <img src="${dataList[0].imageURL}" width="460px" height="232px" style="clear: both;display: block; margin:auto;padding-bottom: 5px">
                <img src="../images/start-passage.png" width="50px" height="50px" style="clear: both;display: block; margin:auto;padding-bottom: 5px" id="audio-play">
                <audio src="${dataList[0].questionURL}" controls="true" id="audio" style="display:none;"></audio>
            </div>
            <div id="question-div" style="display: none">
                <div style="margin-left: 35px" id="questionContent"><span id="questionNum">${dataList[0].questionNum}</span>.${dataList[0].question}
                    <img src="../images/start-audio.png" style="cursor:pointer;margin-left: 5px; margin-top: -2px;" id="img${dataList[0].questionNum}"></div>
                <audio id="audio${dataList[0].questionNum}" style="display:none;" src=" ${dataList[0].questionURL}" controls="controls"></audio>

                <div id="questionOption">
                    <c:forEach items="${dataList[0].optionListeningVos}" var="item">
                        <div style="margin-left: 35px"><input id="answer${item.itemCode}" type="radio" name="answer" value="${item.itemCode}" style="z-index:-2">
                            <label class="label-radio" for="answer${item.itemCode}">
                                <span>${item.itemCode}.${item.itemName}</span> </label></div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</form>
<!-- </div> -->
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $().UItoTop({easingType: 'easeOutQuart'});
        var a = ${subjectId};
        console.log('>>>a', a, a!=null, a!==null);
        if(a!=null)
        {
            localStorage.setItem("subject",${subjectId});
        }
    });
</script>
<script type="text/javascript">
    $(function (){
        $("#sp_start").trigger("click");
    })
    $("#btn_next").click(function () {
        var a = $("input[name='answer']:checked").val();

    });


    $('.pagination').pagination(${pageInfo.total}, {
        callback: function (page) {
            $.ajax({
                url: "/mock/queryListeningExamPaperDetailData.action",
                method: "post",
                // dataType: "json",
                data: {page: page + 1, paperId: ${paperId}},
                success: function (data) {
                    var  a =${subjectId};
                    if(a!=null){
                        localStorage.setItem("subject",${subjectId});
                    }
                    var html = "";
                    console.log("===>>"+data.extend.dataList);

                    var i = 0;
                    var id = new Array();
                    var code = new Array();
                    var name = new Array();
                    $.each(data.extend.dataList, function () {
                        html += "<div id='question-div' >";

                        html += "<div style='margin-left: 35px' id='questionContent'><span id='questionNum'>"+this.questionNum+"</span>."+this.question;
                        html += "<img src='../images/start-audio.png' style='cursor:pointer;margin-left: 5px; margin-top: -2px;' id='img"+this.questionNum+"'></div>";
                        html += "<audio id='audio"+this.questionNum+"' style='display:none;' src='"+this.questionURL+"' controls='controls'></audio>";
                        var anwserValue = localStorage.getItem(this.questionNum);
                        for (i = 0; i < this.optionListeningVos.length; i++) {
                            id[i] = this.optionListeningVos[i].id;
                            code[i] = this.optionListeningVos[i].itemCode;
                            name[i] = this.optionListeningVos[i].itemName;
                            html += "<div style='margin-left: 35px'>"
                            if (code[i] == anwserValue) {
                                html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2' checked>"
                            } else {
                                html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2'>"
                            }
                            html += "<label class='label-radio' for='answer" + code[i] + "'>"
                            html += "<span>" + code[i] + "." + name[i] + "</span>"
                            html += "</label>"
                            html += "</div>"
                        }
                        html += "</div>"

                    })
                    html += "</tbody>";
                    html += "</table>";
                    html += "</div>";
                    $("#question-div").html("");
                    $("#question-div").append(html);
                    $('input[name=answer]').on('click', selectAnswer)

                    $("#audio-play").click(function () {
                        $("#audio")[0].play();
                        $("#audio-play").css("display","none");
                    });
                    //点击图标播放音频，写在外边获取不到id
                    $('#img1').click(function () {
                        $("#audio1")[0].play();
                        $("#img1").css("display", "none");
                    });
                    $('#img2').click(function () {
                        $("#audio2")[0].play();
                        $("#img2").css("display", "none");
                    });
                    $('#img2').on("click",function () {
                        $("#audio2")[0].play();
                        $("#img2").css("display", "none");
                    });
                    $('#img3').click(function () {
                        $("#audio3")[0].play();
                        $("#img3").css("display", "none");
                    });
                    $('#img4').click(function () {
                        $("#audio4")[0].play();
                        $("#img4").css("display", "none");
                    });
                    $('#img5').click(function () {
                        $("#audio5")[0].play();
                        $("#img5").css("display", "none");
                    });
                },
                error: function (data) {
                    alert("error");
                }
            });

        },
        display_msg: true,
        setPageNo: false
    });
    $('input[name=answer]').on('click', selectAnswer);

    function selectAnswer() {
        localStorage.setItem($('#questionNum').text(), $(this).val());
        console.log($('#questionNum').text())
        console.log($(this).val())
    }

    $("#submitGroup").click(function () {
            $("#alertModalSubmit").modal({
                backdrop: "static"
            });

    })
    function getSecondReading(order) {

        $.ajax({//切换到第二题后加载第一题
            url: "/mock/queryListeningExamPaperDetailFirstData.action",
            method: "post",
            // dataType: "json",
            data: { paperId: ${paperId},subjectOrder:order},
            success: function (data) {
                console.log(data);
                // localStorage.removeItem("subject");
             /*   var  a =${subjectId};
                if(a!=null){
                    localStorage.setItem("subject",${subjectId});
                }*/
                var html = "";
                var html2="";
                console.log("===>>"+data.extend.dataList);

                var i = 0;
                var id = new Array();
                var code = new Array();
                var name = new Array();
                $.each(data.extend.dataList, function () {

                    html2 +="<div id='passage-div'>"
                    html2 +="<img src='"+this.imageURL+"' width='460px' height='232px' style='clear: both;display: block; margin:auto;padding-bottom: 5px'>"
                    html2 +="<img src='../images/start-passage.png' width='50px' height='50px' style='clear: both;display: block; margin:auto;padding-bottom: 5px' id='audio-play'>"
                    html2 +="<audio src='"+this.questionURL+"' style='display:none;' controls='true' id='audio' ></audio></div>"

                    html += "<div id='question-div' >";

                    html += "<div style='margin-left: 35px' id='questionContent'><span id='questionNum'>"+this.questionNum+"</span>."+this.question;
                    html += "<img src='../images/start-audio.png' style='cursor:pointer;margin-left: 5px; margin-top: -2px;' id='img"+this.questionNum+"'></div>";
                    html += "<audio id='audio"+this.questionNum+"' style='display:none;' src='"+this.questionURL+"' controls='controls'></audio>";
                    var anwserValue = localStorage.getItem(this.questionNum);
                    for (i = 0; i < this.optionListeningVos.length; i++) {
                        id[i] = this.optionListeningVos[i].id;
                        code[i] = this.optionListeningVos[i].itemCode;
                        name[i] = this.optionListeningVos[i].itemName;
                        html += "<div style='margin-left: 35px'>"
                        if (code[i] == anwserValue) {
                            html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2' checked>"
                        } else {
                            html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2'>"
                        }
                        html += "<label class='label-radio' for='answer" + code[i] + "'>"
                        html += "<span>" + code[i] + "." + name[i] + "</span>"
                        html += "</label>"
                        html += "</div>"
                    }
                    html += "</div>"

                })
                html += "</tbody>";
                html += "</table>";
                html += "</div>";
                $("#question-div").html("");
                $("#question-div").append(html);
                 $("#passage-div").html("");
                $("#passage-div").append(html2);
                $('input[name=answer]').on('click', selectAnswer)

                //监听音频播放完成后的事件  passage ==>> question1
                var audioT = document.getElementById("audio");
                $('#audio').on('play',function () {
                    console.log('123123');
                })
                audioT.onended = function() {
                    setTimeout(function () {
                        $("#passage-div").css("display", "none");
                        $("#question-div").css("display", "inline");
                        $("#navigation").css("display","inline");

                    }, 700);

                    console.log('播放完成');
                };
                $("#audio-play").click(function () {
                    $("#audio")[0].play();
                    $("#audio-play").css("display","none");
                });
                //点击图标播放音频，写在外边获取不到id
                $('#img1').click(function () {
                    $("#audio1")[0].play();
                    $("#img1").css("display", "none");
                });
                $('#img2').click(function () {
                    $("#audio2")[0].play();
                    $("#img2").css("display", "none");
                });
                $('#img2').on("click",function () {
                    $("#audio2")[0].play();
                    $("#img2").css("display", "none");
                });
                $('#img3').click(function () {
                    $("#audio3")[0].play();
                    $("#img3").css("display", "none");
                });
                $('#img4').click(function () {
                    $("#audio4")[0].play();
                    $("#img4").css("display", "none");
                });
                $('#img5').click(function () {
                    $("#audio5")[0].play();
                    $("#img5").css("display", "none");
                });
            },
            error: function (data) {
                alert("error");
            }
        });
        $('.pagination').pagination(${pageInfo.total}, {//加载分页插件，第一条加载不到
            callback: function (page) {
                $.ajax({
                    url: "/mock/queryListeningExamPaperDetailData.action",
                    method: "post",
                    // dataType: "json",
                    data: {page: page + 1, paperId: ${paperId},subjectOrder:order},
                    success: function (data) {
                      /*  var  a =${subjectId};
                        if(a!=null){
                            localStorage.setItem("subject",${subjectId});
                        }*/
                        var html = "";
                        console.log("===>>"+data.extend.dataList);

                        var i = 0;
                        var id = new Array();
                        var code = new Array();
                        var name = new Array();
                        $.each(data.extend.dataList, function () {
                            html += "<div id='question-div' >";

                            html += "<div style='margin-left: 35px' id='questionContent'><span id='questionNum'>"+this.questionNum+"</span>."+this.question;
                            html += "<img src='../images/start-audio.png' style='cursor:pointer;margin-left: 5px; margin-top: -2px;' id='img"+this.questionNum+"'></div>";
                            html += "<audio id='audio"+this.questionNum+"' style='display:none;' src='"+this.questionURL+"' controls='controls'></audio>";
                            var anwserValue = localStorage.getItem(this.questionNum);
                            for (i = 0; i < this.optionListeningVos.length; i++) {
                                id[i] = this.optionListeningVos[i].id;
                                code[i] = this.optionListeningVos[i].itemCode;
                                name[i] = this.optionListeningVos[i].itemName;
                                html += "<div style='margin-left: 35px'>"
                                if (code[i] == anwserValue) {
                                    html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2' checked>"
                                } else {
                                    html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2'>"
                                }
                                html += "<label class='label-radio' for='answer" + code[i] + "'>"
                                html += "<span>" + code[i] + "." + name[i] + "</span>"
                                html += "</label>"
                                html += "</div>"
                            }
                            html += "</div>"

                        })
                        html += "</tbody>";
                        html += "</table>";
                        html += "</div>";
                        $("#question-div").html("");
                        $("#question-div").append(html);
                        $('input[name=answer]').on('click', selectAnswer)
                        $("#audio-play").click(function () {
                            $("#audio")[0].play();
                            $("#audio-play").css("display","none");
                        });
                        //点击图标播放音频，写在外边获取不到id
                        $('#img1').click(function () {
                            $("#audio1")[0].play();
                            $("#img1").css("display", "none");
                        });
                        $('#img2').click(function () {
                            $("#audio2")[0].play();
                            $("#img2").css("display", "none");
                        });
                        $('#img2').on("click",function () {
                            $("#audio2")[0].play();
                            $("#img2").css("display", "none");
                        });
                        $('#img3').click(function () {
                            $("#audio3")[0].play();
                            $("#img3").css("display", "none");
                        });
                        $('#img4').click(function () {
                            $("#audio4")[0].play();
                            $("#img4").css("display", "none");
                        });
                        $('#img5').click(function () {
                            $("#audio5")[0].play();
                            $("#img5").css("display", "none");
                        });
                    },
                    error: function (data) {
                        alert("error");
                    }
                });
            },
            display_msg: true,
            setPageNo: false
        });

    }
    function savaOptionAnswer(paperId,userId) {
        var answer = "";
        answer +=  localStorage.getItem("1")+",";
        answer +=  localStorage.getItem("2")+",";
        answer +=  localStorage.getItem("3")+",";
        answer +=  localStorage.getItem("4")+",";
        answer +=  localStorage.getItem("5")+",";
        // answer +=  localStorage.getItem("6")+",";
        // answer +=  localStorage.getItem("7")+",";
        // answer +=  localStorage.getItem("8")+",";
        // answer +=  localStorage.getItem("9")+",";
        // answer +=  localStorage.getItem("10");
        alert(answer);
        // alert( localStorage.getItem("subject")+"  提交前");
        var subjectId =   localStorage.getItem("subject");
        $.ajax({
            url: "/mock/saveListeningRecord.action",
            method: "post",
            async:false,
            // dataType: "json",
            data: {answer: answer, subjectId: subjectId,paperId:paperId,userId:userId,timeStr:"${timeStr}"},
            success:function (data) {
            },
            error:function () {

            }
        });
        localStorage.removeItem("1");
        localStorage.removeItem("2");
        localStorage.removeItem("3");
        localStorage.removeItem("4");
        localStorage.removeItem("5");
        // localStorage.removeItem("6");
        // localStorage.removeItem("7");
        // localStorage.removeItem("8");
        // localStorage.removeItem("9");
        // localStorage.removeItem("10");

    }



</script>
<script>
    //监听音频播放完成后的事件  passage ==>> question1
    var audioT = document.getElementById("audio");
    $('#audio').on('play',function () {
        console.log('123123');
    })
    audioT.onended = function() {
        setTimeout(function () {
            $("#passage-div").css("display", "none");
            $("#question-div").css("display", "inline");
            $("#navigation").css("display","inline");

        }, 700);

        console.log('播放完成');
    };
    $("#audio-play").click(function () {
        $("#audio")[0].play();
        $("#audio-play").css("display","none");
    });

    $('#img1').click(function () {
        $("#audio1")[0].play();
        $("#img1").css("display", "none");
    });
    $('#img2').click(function () {
        $("#audio2")[0].play();
        $("#img2").css("display", "none");
    });
    $('#img2').on("click",function () {
        $("#audio2")[0].play();
        $("#img2").css("display", "none");
    });
    $('#img3').click(function () {
        $("#audio3")[0].play();
        $("#img3").css("display", "none");
    });
    $('#img4').click(function () {
        $("#audio4")[0].play();
        $("#img4").css("display", "none");
    });
    $('#img5').click(function () {
        $("#audio5")[0].play();
        $("#img5").css("display", "none");
    });


</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>

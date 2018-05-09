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
    <script type="text/javascript" src="${ctx}/js/record/recorder.js"></script>
    <script type="text/javascript" src="${ctx}/js/record/qiniu.min.js"></script>
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
                    hour = 0,
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
            savaOptionAnswer();
            var sub = Number(localStorage.getItem("subject"));
            if(sub == 1||sub==2){//第一篇或第二篇的时候，获取下一篇内容
                var order = Number(sub) +1;//下一篇 序号
                getSecondReading(order);
                <%--alert("试卷id"+${paperId});--%>

                $("#question-div").css("display","none");
                $("#passage-div").css("display","inline");
                $("#navigation").css("display","none");


                // alert(localStorage.getItem("subject")+"   before");
                var subjectIdBefore = localStorage.getItem("subject");
                localStorage.setItem("subject",(Number(subjectIdBefore)+1));
            }
            else {
                $("#alertModalNext").modal({
                    backdrop: "static"
                });
            }

        }

        function doSubmitNext() {

            $("#alertModalNext").modal("hide");
            window.location.href="${ctx}/mock/toMyExamPaperPage.action?&userId=${userId}"

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
                    document.myForm.attributes["action"].value = "${ctx}/mock/toScoreQry.action?userId=${user.userId}";
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
                <h4 class="modal-title">完成考试</h4>
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
                               href="${ctx}/mock/toScoreQry.action?userId=${user.userId}">成绩查询</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/mock/toMyBooksPage.action">我的答题记录</a>
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
                <a type="button" class="btn btn-primary" id="submitGroup" >下一题</a>
            </div>

        </div>
        <%--<span id="localCount">当前第${dataList[0].questionNum}/${dataList[0].questionCount}</span>--%>
        <div class="content" id="myDiv">
            <div id="passage-div">
                <%--<img src="" width="460px" height="232px" style="clear: both;display: block; margin:auto;padding-bottom: 5px">--%>
                <h3><span style="clear: both;display: block; margin:auto;padding-bottom: 5px;width: 800px" id="question">${dataInfo.question}</span></h3>
                <img src="../images/start-passage.png" width="50px" height="50px" style="clear: both;display: block; margin:auto;padding-bottom: 5px" id="audio-play">
                <audio src="${dataInfo.questionURL}" controls="true" id="audio" style="display:none;"></audio>
            </div>
            <div style="position: absolute; width: 800px; left: 50%; margin-left: -400px;">
                <%--<div id="record-div"style="clear: both;display: none; margin:auto;padding-bottom: 5px;width: 800px">
                    <button onclick="startRecording(this);"class="btn btn-default">录音</button>
                    <button class="btn btn-default" onclick="stopRecording(this);" disabled>停止</button>
                    <button class="btn btn-default" onclick="playRecording(this);" disabled>停止</button>
                    <button class="btn btn-default" onclick="uploadRecording(this);" disabled>停止</button>
                    <h2>Recordings</h2>
                    <ul id="recordingslist"></ul>
                    <h2>Log</h2>
                    <pre id="log"></pre>
                </div>--%>
                <div>
                    <span> <p> 为了保证用户的相关权益，本部分将不对进行录音操作</p></span>
                    <span><p>同时，您可以根据题目进行自由练习</p></span>
                    <span><p>感谢您使用本系统</p></span>
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
        // alert($("#localCount"));

    });



    $('input[name=answer]').on('click', selectAnswer);

    function selectAnswer() {
        localStorage.setItem($('#questionNum').text(), $(this).val());
        console.log($('#questionNum').text())
        console.log($(this).val())
    }

    $("#submitGroup").click(function () {
        var sub = Number(localStorage.getItem("subject"));
        if(sub == 1) {//第一篇的时候，获取下一篇内容
            var order = Number(sub) + 1;//下一篇 序号
            getSecondReading(order)
            $("#submitGroup").html("完成考试");
            var subjectIdBefore = localStorage.getItem("subject");
            localStorage.setItem("subject",(Number(subjectIdBefore)+1));
        }
        else {
            $("#alertModalNext").modal({
                backdrop: "static"
            });
        }
    })
    function getSecondReading(order) {

        $.ajax({//切换到第二题后加载第一题
            url: "/mock/querySpeakingExamPaperDetailData.action",
            method: "post",
            // dataType: "json",
            data: { paperId: ${paperId},subjectOrder:order,userId:"${userId}"},
            success: function (data) {
                console.log(data);
                // localStorage.removeItem("subject");
             $("#question").html(data.extend.dataInfo.question)
                $('input[name=answer]').on('click', selectAnswer)
                $("#audio-play").css("display","block");
                $("#audio").attr("src",data.extend.dataInfo.questionURL)

                $("#audio-play").click(function () {
                    $("#audio")[0].play();
                    $("#audio-play").css("display","none");
                });

            },
            error: function (data) {
                alert("error");
            }
        });


    }
    function savaOptionAnswer() {
        var answer = "";
        var subjectId =   localStorage.getItem("subject");
        $.ajax({
            url: "/mock/saveListeningRecord.action",
            method: "post",
            async:false,
            // dataType: "json",
            data: {answer: answer, subjectId: subjectId},
            success:function (data) {
            },
            error:function () {

            }
        });

    }



</script>
<script>
    $("#audio-play").click(function () {
        $("#audio")[0].play();
        $("#audio-play").css("display","none");
    });
    //监听音频播放完成后的事件  passage ==>> question1
    var audioT = document.getElementById("audio");
    $('#audio').on('play',function () {
        console.log('123123');
    })
    audioT.onended = function() {
        setTimeout(function () {
            $("#record-div").css("display","inline");

        }, 700);

        console.log('播放完成');
    };


   /* function __log(e, data) {
        log.innerHTML += "\n" + e + " " + (data || '');
    }

    var audio_context;
    var recorder;

    function startUserMedia(stream) {
        var input = audio_context.createMediaStreamSource(stream);
        __log('Media stream created.');

        // Uncomment if you want the audio to feedback directly
        //input.connect(audio_context.destination);
        //__log('Input connected to audio context destination.');

        recorder = new Recorder(input);
        __log('Recorder initialised.');
    }

    function startRecording(button) {
        recorder && recorder.record();
        button.disabled = true;
        button.nextElementSibling.disabled = false;
        __log('Recording...');
    }
     function playRecording(button) {
            recorder && recorder.record();
            button.disabled = true;
            button.nextElementSibling.disabled = false;
            __log('Recording...');
        }
     function uploadRecording(button) {
            recorder && recorder.record();
            button.disabled = true;
            button.nextElementSibling.disabled = false;
            __log('Recording...');
        }

    function stopRecording(button) {
        recorder && recorder.stop();
        button.disabled = true;
        button.previousElementSibling.disabled = false;
        __log('Stopped recording.');

        // create WAV download link using audio data blob
        createDownloadLink();

        recorder.clear();
    }
    function createDownloadLink() {
        recorder && recorder.exportWAV(function(blob) {
            var url = URL.createObjectURL(blob);
            var li = document.createElement('li');
            var au = document.createElement('audio');
            var hf = document.createElement('a');

            au.controls = true;
            au.src = url;
            hf.href = url;
            hf.download = new Date().toISOString() + '.wav';
            hf.innerHTML = hf.download;
            li.appendChild(au);
            li.appendChild(hf);
            console.log(hf);
            recordingslist.appendChild(li);
        });
    }

    window.onload = function init() {
        try {
            // webkit shim
            window.AudioContext = window.AudioContext || window.webkitAudioContext;
            navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;
            window.URL = window.URL || window.webkitURL;

            audio_context = new AudioContext;
            __log('Audio context set up.');
            __log('navigator.getUserMedia ' + (navigator.getUserMedia ? 'available.' : 'not present!'));
        } catch (e) {
            alert('No web audio support in this browser!');
        }

        navigator.getUserMedia({audio: true}, startUserMedia, function(e) {
            __log('No live audio input: ' + e);
        });
    };
*/
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>

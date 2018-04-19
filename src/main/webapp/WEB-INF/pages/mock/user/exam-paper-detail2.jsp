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
    <link rel="stylesheet" href="${ctx}/css/base.css" />
    <link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/css/time.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/css/exam/ReadingQuestion.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${ctx}/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/js/modernizr.custom.js"></script>
    <script type="text/javascript" src="${ctx}/js/move-top.js"></script>
    <script type="text/javascript" src="${ctx}/js/easing.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.paginationone.js"></script>
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
        var intDiff = parseInt(60 * 60 * 2);//倒计时总秒数量
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

        function doStartExam() {
            $("#container").css("display", "inline");
            beginTime = CurentTime();
            $("#sp_start").html("考试中.....");
            if (startFalg)
                timer(intDiff);
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
                <a href="javascript:void(0);" onclick="doStartExam()"><span class="label label-primary" id="sp_start">开始考试</span></a>
            </th>
        </tr>
        </thead>
    </table>
</div>
<form action="${ctx}/dealPaper.action" method="post" id="myForm" name="myForm">
    <!-- <div class="typrography"> -->
    <div style="display: none" id="container">
        <div class="row">
            <div class="col-md-10" style="padding-left: 50px">
                <div class="pagination ue-clear"></div>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-primary">提交本题</button>
            </div>

        </div>
        <%--<span id="localCount">当前第${dataList[0].questionNum}/${dataList[0].questionCount}</span>--%>
        <div class="content" id="myDiv">
            <div class="content-text-l">
                <%-- <div style="padding-bottom: 5px;">
                     <input type="button" class="btn-primary" value="上一题" id="btn_previous" disabled="disabled">
                     <input type="button" class="btn-primary" value="下一题" id="btn_next" onclick="nextQueation()">
                 </div>--%>

                <div style="margin-left: 35px"
                     id="questionContent"><span id="questionNum">${dataList[0].questionNum}</span>.${dataList[0].queation}</div>
                <div id="questionOption">
                    <c:forEach items="${dataList[0].optionReadingVos}" var="item">
                        <div style="margin-left: 35px"> <input id="answer${item.itemCode}" type="radio" name="answer" value="${item.itemCode}" style="z-index:-2">
                            <label class="label-radio" for="answer${item.itemCode}"> <span>${item.itemCode}.${item.itemName}</span> </label> </div>
                    </c:forEach>
                </div>
            </div>
            <div class="content-text-r">
                <div class="passage-title"><h3>${dataList[0].passageTitle}</h3></div>
                ${dataList[0].passage}
            </div>
        </div>
        <%--
     <h3 class="t-button">
       <a href="javascript:;" onclick="submitPaper()"><span class="label label-success">提交试卷</span></a>&nbsp;&nbsp;
       <a href="${ctx}/toMyExamPaperPage.action?userId=${user.userId}"><span class="label label-info">返回上一页</span></a>
     </h3>
 </div>--%>
    </div>
</form>
<!-- </div> -->
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $().UItoTop({easingType: 'easeOutQuart'});
    });
</script>
<script type="text/javascript">
    $("#btn_next").click(function () {
        var a = $("input[name='answer']:checked").val();
        alert("选中的radio的值是：" + a);
        alert($("#localCount"));
        <%--alert(${examPaper.reading.subjectReadingVos[0].questionReadingVos[0].id});--%>

    });


    $('.pagination').pagination(${pageInfo.total}, {
        callback: function (page) {
            /* 		document.myform.attributes["action"].value = "
            ${ctx}/toQuestionPage.action?page="+(page+1);
		$("form").submit(); */
            $.ajax({
                url: "/mock/queryReadingExamPaperDetailData.action",
                method: "post",
                // dataType: "json",
                data: {page: page + 1,paperId:1},
                success: function (data) {
                    var html = "";
                    html += "<div class='content' id='myDiv'>";
                    html += " <div class='content-text-l'>";

                    var i = 0;
                    var id = new Array();
                    var code = new Array();
                    var name = new Array();
                    $.each(data.extend.dataList, function () {
                        html += " <div style='margin-left: 35px' id='questionContent'><span id=questionNum>" + this.questionNum + "</span>." + this.queation + "</div>";
                        html += "<div id='questionOption'>";
                        var anwserValue = localStorage.getItem(this.questionNum);
                        for(i=0;i<this.optionReadingVos.length;i++) {
                            id[i] = this.optionReadingVos[i].id;
                            code[i] = this.optionReadingVos[i].itemCode;
                            name[i] = this.optionReadingVos[i].itemName;
                            html += "<div style='margin-left: 35px'>"
                            if(code[i] == anwserValue) {
                                html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2' checked>"
                            } else {
                                html += "<input id='answer" + code[i] + "' type='radio' name='answer' value='" + code[i] + "' style='z-index:-2'>"
                            }
                            html += "<label class='label-radio' for='answer" + code[i] + "'>"
                            html += "<span>" + code[i] + "." + name[i] + "</span>"
                            html += "</label>"
                            html += "</div>"
                        }
                        html += "</div></div><div class='content-text-r'>"
                        html += "<div class='passage-title'><h3>"+this.passageTitle+"</h3></div>"
                        html += ""+this.passage+"</div></div>"
                        html += "<td class='operate'><a href='${ctx}/deleteQuestion.action?id=" + this.id + "' class='del'>删除</a>&nbsp;";
                        html += "<a href='${ctx}/toUpdQuestion.action?id=" + this.id + "' class='del'>编辑</a>&nbsp;";
                        html += "<a href='${ctx}/mock/toQueryRepositorReading.action?sectionId=" + this.id + "' class='del'>查看</a></td>";
                        html += "</tr>";

                    })
                    html += "</tbody>";
                    html += "</table>";
                    html += "</div>";
                    $("#myDiv").html("");
                    $("#myDiv").append(html);
                    $('input[name=answer]').on('click', selectAnswer)
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
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>

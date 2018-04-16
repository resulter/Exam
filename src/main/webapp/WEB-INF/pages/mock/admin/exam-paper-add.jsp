<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${ctx}/css/base.css"/>
    <link rel="stylesheet" href="${ctx}/css/info-reg.css"/>
    <link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css"/>
    <link rel="stylesheet" href="${ctx}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>新增试卷</h2></div>
<form action="${ctx}/addQuesInfo.action" method="post" name="myform" id="myform">
    <div class="main">
        <div class="col-md-offset-1" style="padding-top: 10px;padding-bottom: 20px">
            <h4 >
            请分别选择一个阅读部分、一个听力部分、一个口语部分和一个写作部分来组成一整套试卷
            </h4>
        </div>
        <div class="row">
            <div class="form-group col-md-offset-1 col-xs-2">
                <label for="ExamTitle">请输入试卷名称</label>
                <input type="text" class="form-control" id="ExamTitle" name="name" placeholder="Exam">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <label for="readingSelect">选择一个阅读</label>
                <select class="form-control" id="readingSelect" name="readingSectionId">
                    <c:forEach items="${dataList.readingSelect}" var="sel">
                        <option value="${sel.key}" class="opt">
                            <div style="margin-left: 15px" title=""> ${sel.value}</div>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <label for="listeningSelect">选择一个听力</label>
                <select class="form-control" id="listeningSelect" name="listeningSectionId">
                    <c:forEach items="${dataList.listeningSelect}" var="sel">
                        <option value="${sel.key}" class="opt">
                            <div style="margin-left: 15px" title=""> ${sel.value}</div>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <label for="speakingSelect">选择一个口语</label>
                <select class="form-control" id="speakingSelect" name="speakingSectionId">
                    <c:forEach items="${dataList.speakingSelect}" var="sel">
                        <option value="${sel.key}" class="opt">
                            <div style="margin-left: 15px" title=""> ${sel.value}</div>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <label for="writingSelect">选择一个写作</label>
                <select class="form-control" id="writingSelect" name="writingSectionId">
                    <c:forEach items="${dataList.writingSelect}" var="sel">
                        <option value="${sel.key}" class="opt">
                            <div style="margin-left: 15px" title=""> ${sel.value}</div>
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row" style="margin-top: 5px">
            <div class="form-group col-md-offset-1 col-xs-2">
                <label for="ExamRemark">请输入备注</label>
                <input type="text" class="form-control" id="ExamRemark" name="reamrk" placeholder="Remark">
            </div>
        </div>
    </div>
</form>
<div class="row" style="padding-top: 15px">
    <div class="col-md-offset-1">
    <div class="btn ue-clear">
        <a href="${ctx}/toPaperPage.action" class="clear">返回</a>
    </div>
    <div class="btn ue-clear">
        <a href="javascript:;" class="confirm" onclick="addExamPaper()">确定</a>
    </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#grade").searchableSelect();
    });
    $(".select-title").on("click", function () {
        $(".select-list").toggle();
        return false;
    });
    $(".select-list").on("click", "li", function () {
        var txt = $(this).text();
        $(".select-title").find("span").text(txt);
    });

    function checkUserId() {
        var questionId = $("#questionId").val();
        if (questionId == "") {
            $("#tipInfo").html("请输入题目名称");
            $("#questionId").focus();
            return;
        } else {
            $("#tipInfo").html("");
        }
    }

    //注册
    function addExamPaper() {
        document.myform.attributes["action"].value = "${ctx}/mock/addExamPaper.action";
        $("form").submit();
    }

    function typeOnclick() {
        var typeId = $("input[name='typeId']:checked").val();
        if (typeId == "1" || typeId == "2") {//选择题就显示
            showOp();
        } else {
            hideOp();
        }
    }

    //隐藏选择题选项
    function hideOp() {
        $("#pa").hide();
        $("#pb").hide();
        $("#pc").hide();
        $("#pd").hide();
    }

    //显示选择题选项
    function showOp() {
        $("#pa").show();
        $("#pb").show();
        $("#pc").show();
        $("#pd").show();
    }

    //情况所有
    function clearAll() {
    }

    showRemind('input[type=text], textarea', 'placeholder');
</script>
</html>
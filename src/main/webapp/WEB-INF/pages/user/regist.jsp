<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>在线考试系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${ctx}/css/reset.css">
<link rel="stylesheet" href="${ctx}/css/supersized.css">
<link rel="stylesheet" href="${ctx}/css/userlogin.css">
<script src="${ctx}/js/jquery-1.8.2.min.js"></script>
<script src="${ctx}/js/supersized.3.2.7.min.js"></script>
<script src="${ctx}/js/supersized-init.js"></script>
<script src="${ctx}/js/scripts.js"></script>
<script type="text/javascript">
	function regist(){
		var Pwd = $("#Pwd").val();
		var userPwd =$("#userPwd").val();
		if(Pwd ==""){
			alert("登录密码不能为空");
			return;
		}
		if(userPwd ==""){
			alert("确认密码不能为空");
			return;
		}
		if(Pwd!=userPwd){
			alert("两次密码不一致，请重新输入！");
			return;
		}
		document.myform.attributes["action"].value = "${ctx}/addUserInfo.action"; 
		$("form").submit();
	}
	
	function checkUserId(){
		var userId = $("#userId").val();
		var tipInfo = $("#tipInfo").val();
		if(userId == ""){
			$("#tipInfo").html("请输入账号");
			$("#userId").focus();
			return;
		}
	 	$.ajax({
	        type: "post",
	        url: "${ctx}/admin/userRegist.action",
	        data: {userId:userId},
	        dataType: "json",
	        success: function(data){
	        	$("#tipInfo").html(data.errorInfo);
	        }
	    });
	}
	
	function checkPwd(){
		var Pwd = $("#Pwd").val();
		var userPwd =$("#userPwd").val();
		if(Pwd ==""){
			alert("登录密码不能为空");
			return;
		}
		if(userPwd ==""){
			alert("确认密码不能为空");
			return;
		}
		if(Pwd!=userPwd){
			alert("两次密码不一致，请重新输入！");
			return;
		}
		
	}

    function checkMyPhone(){
        var email = $("#telphone").val();
        if(email == ""){
            $("#phoneInfo").html("<span style='color: red' >请输入手机号</span>");
            return;
        }
        var req =  /^1\d{10}$/;
        if(!req.test(email)){
            $("#phoneInfo").html("<span style='color: red' >手机号格式不正确</span>");
            $("#telphone").focus();
            return;
        }
        $("#phoneInfo").html("<span style='color: green' >验证通过</span>");
    }
    function checkMyEmail() {
        var email = $("#email").val();
        if(email == ""){
            $("#emailInfo").html("<span style='color: red' >请输入邮箱</span>");
            return;
        }
        var req = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        if(!req.test(email)){
            $("#emailInfo").html("<span style='color: red' >邮箱格式不正确</span>");
            $("#email").focus();
            return;
        }
        $("#emailInfo").html("<span style='color: green' >验证通过</span>");
    }
	
</script>
</head>
<body>
    <div class="page-container">
        <h1>用户注册</h1>
        <form action="${ctx}/user/toIndex.action" method="post" name="myform" id="myform">
            <input type="text" name="userId" id="userId" class="username" placeholder="用户账号" onblur="checkUserId()"><br>
            <div style="padding-top: 7px">
            <span style="color: red" id="tipInfo">${message }</span>
            </div>
            <input type="text" name="userName" id="userName" placeholder="用户昵称">
            <input type="password" name="Pwd" id="Pwd" class="password" placeholder="登录密码">
            <input type="password" name="userPwd" id="userPwd" class="password" placeholder="确认密码" onblur="checkPwd()"><br/>
           <%-- <c:forEach items="${grade}" var="grade">
				<input type="radio" checked="checked" name="grade" value="${grade.gradeId }" 
					class="radio" />${grade.gradeName } &nbsp;
			</c:forEach>--%>
            <input type="text" name="email" id="email" class="username" placeholder="邮箱" onblur="checkMyEmail()">
            <div style="padding-top: 7px" id="emailInfo">
                <span style="color: red"></span>
            </div>
            <input type="text" name="telphone" id="telphone" placeholder="联系电话" onblur="checkMyPhone()">
            <div style="padding-top: 7px" id="phoneInfo">
                <span style="color: red" ></span>
            </div>
            <input type="text" name="address" id="address" placeholder="联系地址">
            <button type="button" onclick="regist()">注册</button>
            <div class="error"><span>${message }</span></div>
        </form>
        <div class="connect"></div>
    </div>
    <div align="center">我已经有一个账号，我要 <a href="${ctx}/toLogin.action" target="_self">登录</a></div>
</body>

</html>

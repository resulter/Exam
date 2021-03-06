<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线考试系统</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${ctx}/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	function exitSystem(){
		window.location.href = "${ctx}/user/exitSys.action"	;
	}
</script>

</head>
<body>
<div class="header">
		<div class="container">
			<div class="header-nav">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					   	<h3><span>欢迎您，<font color="blue">${userName }</font> 同学</span></h3>
					</div>
					
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a class="hvr-overline-from-center button2" href="${ctx}/user/toIndex.action?userId=${user.userId}">首页</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toUserInfo.action?userId=${user.userId}">个人中心</a></li>
							<!-- <li><a class="hvr-overline-from-center button2" href="onlinecheck.html">在线考试</a></li> -->
							<li><a class="hvr-overline-from-center button2  active" href="${ctx}/mock/toScoreQry.action?userId=${user.userId}">成绩查询</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/mock/toMyBooksPage.action?userId=${user.userId}">我的答题记录</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/mock/toMyExamPaperPage.action?userId=${user.userId}">我的试卷</a></li>
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
<div class="about">
	<div class="container">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>试卷名称</th>
                  <th>考试时间</th>
				  <th>阅读分数</th>
				  <th>听力分数</th>
                  <th>写作分数</th>
                  <th>总分</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${queryScoreByUserID}" var="paper">
              	  <tr>
	                 <%--<td><a href="${ctx}/qrypaper.action?paperId=${paper.paperId}&userId=${paper.userId}"><font color="blue">${paper.paperName}</font></a></td>--%>
	                 <td>${paper.examName}</td>
	                 <td>${paper.createTime}</td>
					 <td>${paper.readingScore}</td>
					 <td>${paper.listeningScore}</td>
					 <td>
                         <c:if test="${empty paper.writingScore}">待判</c:if>
                         <c:if test="${!empty paper.writingScore}">${paper.writingScore}</c:if>
                     </td>
					 <%--<td>${paper.speakingScore}</td>--%>
					 <td>${paper.sumScore}</td>
					 <%--<td><font color="blue">
					 	<c:if test="${paper.paperstate==0}">准备考试</c:if>
						<c:if test="${paper.paperstate==1}">尚未开始</c:if>
						<c:if test="${paper.paperstate==2}">考试结束</c:if>
					 </td>--%>
	              </tr>
				</c:forEach>
              </tbody>
            </table>
	</div>
</div>
<script src="../js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>

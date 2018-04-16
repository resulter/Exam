<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${ctx}/css/base.css" />
<link rel="stylesheet" href="${ctx}/css/info-reg.css" />
<link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css" />
<title>移动办公自动化系统</title>
	<style type="text/css">
		.main p span {
			/*background-color: red;*/
			color:initial;
			float: initial;
			margin-left: initial;
		}
		.tab {
			/*width: 400px;*/
			margin: 30px auto;
		}
		.tab-title {
			height: 30px;
			font-size: 0;
			background-color: #f5f5f5;
		}
		.tab-title .item {
			display: inline-block;
			width: 120px;
			height: 30px;
			line-height: 30px;
			text-align: center;
			color: #333;
			font-size: 16px;
		}
		.tab-title .item-cur {
			color: #fff;
			background-color: #80b600;
		}
		.tab-cont {
			/*position: relative;*/
			background-color: #fff;
			overflow: hidden;
		}
		.tab-cont__wrap {
			position: absolute;
		}
		.tab-cont .item {
			line-height: 200px;
			/*text-align: center;*/
			color: #000;
		}
		.ue-clear {
			float: right;
		}
		.show-title{
			padding-left: 30px;
			padding-right: 30px;
		;
		}
	</style>
</head>

<body>
<div class="title"><h2>题目详细</h2></div>
<div class="btn ue-clear">
	<a href="${ctx}/mock/toRepositorySpeaking.action" class="confirm" onclick="addQuestion()">返回</a>
</div>
<div class="main">
	<div class="tab" js-tab="1">
		<div class="tab-title">
			<a href="javascript:;" class="item item-cur">passsage 1</a>
			<a href="javascript:;" class="item">passsage 2</a>
		</div>
		<div class="tab-cont clear">
			<ul class="tab-cont__wrap">
				<li class="item">
					<div class="row" id="content-one">
						<c:choose>
							<c:when test="${speakingSubject[0].questionSpeakingVos!=null}">
							<div class="show-title">
								<p>${speakingSubject[0].questionSpeakingVos[0].questionDescription}</p>
							</div>
							<div style="padding-left: 60px">
								<audio src="http://mp3.cdn.kaolawu.com/${speakingSubject[0].questionSpeakingVos[0].questionURL}" preload="auto" ></audio>
							</div>
							<div class="col-md-6" id="content-one-left">
								<p>例文1：</p>
								<p>${speakingSubject[0].questionSpeakingVos[0].demo1}</p>
							</div>
							<div class="col-md-6" id="content-one-right">
								<p>例文2：</p>
								<p>${speakingSubject[0].questionSpeakingVos[0].demo2}</p>
							</div>
							</c:when>
							<c:otherwise>
								<span style="padding-left: 35px">暂无数据</span>
							</c:otherwise>
						</c:choose>
						<div style="clear:both;height:1px;width:100%;margin-top:-1px;"></div>
					</div>
				</li>
				<li class="item">
					<div class="row" id="content-two">
						<c:choose>
						<c:when test="${speakingSubject[1].questionSpeakingVos!=null}">
							<div class="show-title">
								<p>${speakingSubject[1].questionSpeakingVos[0].questionDescription}</p>
							</div>
							<div style="padding-left: 60px">
								<audio src="http://mp3.cdn.kaolawu.com/${speakingSubject[1].questionSpeakingVos[0].questionURL}" preload="auto" ></audio>
							</div>
							<div class="col-md-6" id="content-two-left">
								<p>例文1：</p>
								<p>${speakingSubject[1].questionSpeakingVos[0].demo1}</p>
							</div>
							<div class="col-md-6" id="content-two-right">
								<p>例文2：</p>
								<p>${speakingSubject[1].questionSpeakingVos[0].demo2}</p>
							</div>
						</c:when>
						<c:otherwise>
							<span style="padding-left: 35px">暂无数据</span>
						</c:otherwise>
						</c:choose>
						<div style="clear:both;height:1px;width:100%;margin-top:-1px;"></div>
					</div>
				</li>
			</ul>
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
<script type="text/javascript" src="${ctx}/js/tab.js"></script>
<script type="text/javascript" src="${ctx}/js/audiojs/audio.min.js"></script>
<link href="${ctx}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
<script>
    audiojs.events.ready(function () {
        var as = audiojs.createAll();
    });
</script>
<script type="text/javascript">
    $('[js-tab=1]').tab();//选项卡
$(function(){
	$("#grade").searchableSelect();
});
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});
$("#passage-one").on("click",function () {
	$("#passage-one").addClass("active");
	$("#passage-two").removeClass("active");
	$("#content-one").show();
	$("#content-two").hide();
	alert(1);
})
$("#passage-one").on("click",function () {
    $("#passage-one").removeClass("active");
    $("#passage-two").addClass("active");
    $("#content-one").hide();
    $("#content-two").show();
    alert(2);

})
showRemind('input[type=text], textarea','placeholder');
</script>
</html>
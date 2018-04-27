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
	<a href="${ctx}/mock/toRepositoryWriting.action" class="confirm" onclick="addQuestion()">返回</a>
</div>
<div class="main">
	<div class="tab" js-tab="1">

		<div class="tab-cont clear">
			<div class="row">
				<div class="col-md-6" style="padding: 20px">
					<div class="row">
						<div style="font-weight: bold;font-size: 25px" class="col-md-7">answer</div>
						<div class="col-md-4" style="padding-top: 7px">学生姓名：${dataInfo.userName}</div>
					</div>
					<div style="font-size: 18px;padding-left: 20px">
						<div>Do you agree or disagree with the following statement?</div>
						<div style="font-weight: bold">${dataInfo.question}</div>
						<div>Use specific reasons and examples to support your answer.</div>
					</div>

					<div style="padding-top: 35px;padding-left: 20px">
						<label for="ex6">请拖动打分：</label>
						<input id="ex6" type="text" data-slider-min="0" data-slider-max="15" data-slider-step="0.5" data-slider-value="0"/>
						<span id="ex6CurrentSliderValLabel" style="padding-left: 25px">分数: <span id="ex6SliderVal">0</span></span>
						<div style="padding-top: 7px">
							<label for="annotation">请输入批注：</label>
							<textarea class="form-control" rows="3" id="annotation"></textarea>

						</div>

						<!-- Standard button -->
						<button type="button" class="btn btn-default" onclick="saveWritingScore()">确认</button>
					</div>
				</div>
				<div class="col-md-6" style="padding: 20px">
					<div class="row">
						<div class="col-md-9" style="font-weight: bold;font-size: 25px;padding-bottom: 20px"> question:</div>
						<div class="col-md-3" style="margin-top: 7px;">word count：${dataInfo.wordCount}</div>
					</div>
					<p>
						${dataInfo.answer}
					</p>
				</div>

			</div>
		</div>
	</div>




</div>

</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/tab.js"></script>
<link href="${ctx}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/css/bootstrap-slider.min.css" rel="stylesheet"/>
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

    // With JQuery
    $("#ex6").slider();
    $("#ex6").on("slide", function(slideEvt) {
        $("#ex6SliderVal").text(slideEvt.value);
    });

    function  saveWritingScore() {
        var sco = $("#ex6CurrentSliderValLabel").text().substring(4,50);
        $.ajax({
            url:"${ctx}/mock/toWritingJudgmentSaveScore.action",
            method:"post",
            // dataType: "json",
            data:{id:${dataInfo.id},score:sco,anno:$("#annotation").val()},
            success: function(data){
               alert("保存成功")

            }
        });
    }
</script>
</html>
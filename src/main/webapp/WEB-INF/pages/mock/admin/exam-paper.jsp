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
<link rel="stylesheet" href="${ctx}/css/info-mgt.css" />
<link rel="stylesheet" href="${ctx}/css/WdatePicker.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>试卷管理</h2></div>
<form action="${ctx}/mock/deleteExamPaper.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addUser()">添加</a>
    <a href="javascript:;" class="del" onclick="deleteUser()">删除</a>
</div>
<div class="table-box"  id='myDiv'>
	<table border="1" cellspacing="1">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">试卷编号</th>
                <th class="section">试卷名称</th>
                <th class="section">阅读名称</th>
                <th class="section">听力名称</th>
                <th class="section">口语名称</th>
                <th class="section">写作名称</th>
                <th class="process">创建时间</th>
                <th class="process">备注</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody align="center">
        	<c:forEach items="${dataList}" var="o">
				<tr align="center">
					<td><input type="checkbox" name="paperId" value="${o.id}"/></td>
					<td>${o.id}</td>
					<td><font color="blue">${o.name}</font></td>
					<td><font color="blue">${o.readingName}</font></td>
					<td><font color="blue">${o.listeningName}</font></td>
					<td><font color="blue">${o.speakingName}</font></td>
					<td><font color="blue">${o.writingName}</font></td>
					<td><font color="blue">${o.createTime}</font></td>
					<td></td>
					<td class="operate">
						<a href="${ctx}/mock/toEditExamPaperPage.action?paperId=${o.id}" class="del">编辑</a>
						<a href="${ctx}/mock/deleteExamPaper.action?paperId=${o.id}" class="del">删除</a>
					</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination ue-clear"></div>
</form>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").hide();
	$(this).siblings($(".select-list")).show();
	return false;
})
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
})

$('.pagination').pagination(${pageInfo.total},{
	callback: function(page){
		$.ajax({
			url:"${ctx}/mock/toExamPaperDate.action",
			method:"post",
			// dataType: "json",
			data:{page:page+1},
			success: function(data){
				var html = "";
				html += "<div class='table-box' id='myDiv'>";
				html += "<table border='1' cellspacing='1'>";
				html += "<thead>";
				html += "<th class='num'></th>";
				html += "<th class='name'>试卷编号</th><th class='section'>试卷名称</th>";
				html += "<th class='section'>阅读名称</th><th class='section'>口语名称</th>";
				html += "<th class='section'>听力名称</th><th class='section'>写作名称</th>";
				html += "<th class='process'>创建时间</th><th class='process'>备注</th><th class='operate'>操作</th>";
				html += "</thead>";
				html += "<tbody align='center'>";
                $.each(data.extend.dataList,function(){
					html += "<tr align='center'>";
					html += "<td><input type='checkbox' name='paperId' value='"+this.id+"'/></td>";
					html += "<td>"+this.id+"</td>";
					html += "<td><font color='blue'>"+this.name+"</font></td>";
					html += "<td><font color='blue'>"+this.readingName+"</font></td>";
					html += "<td><font color='blue'>"+this.listeningName+"</font></td>";
					html += "<td><font color='blue'>"+this.speakingName+"</font></td>";
					html += "<td><font color='blue'>"+this.writingName+"</font></td>";
					html += "<td><font color='blue'>"+this.createTime+"</font></td>";
					html += "<td></td>";
					html += "<td class='operate'><a href='${ctx}/mock/toEditExamPaperPage.action?paperId="+this.id+"' class='del'>编辑</a>&nbsp;";
					html += "<a href='${ctx}/mock/deleteExamPaper.action?paperId="+this.id+"' class='del'>删除</a>&nbsp; </td>";
					html += "</tr>";
				})
				html += "</tbody>"; 
				html += "</table>";
				html += "</div>";
		        $("#myDiv").html("");
		        $("#myDiv").html(html);
		    }
		});		
	},
	display_msg: true,
	setPageNo: false
});

function deleteUser(){
	var ids = "";
	$("input:checkbox[name='paperId']:checked").each(function() {
		ids += $(this).val() + ",";
    });
	//判断最后一个字符是否为逗号，若是截取
	var id = ids.substring(ids.length -1, ids.length);
	if(id == ","){
		ids = ids.substring(0, ids.length-1);
	}
	if(ids == ""){
		alert("请选择要删除的记录！");
		return;
	}
	$("form").submit();
}

function addUser(){
	document.myform.attributes["action"].value = "${ctx}/mock/toAddExamPaperPage.action";
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>
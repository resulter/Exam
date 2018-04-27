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
<div class="title"><h2>写作判分</h2></div>
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
        		<th class="name">试卷名称</th>
                <th class="section">用户ID</th>
                <th class="section">用户名称</th>
				<th class="section">题目</th>
				<th class="section">提交时间</th>
				<th class="section">是否判分</th>
                <th class="section">备注</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody align="center">
        	<c:forEach items="${dataList}" var="o">
				<tr align="center">
					<td><input type="checkbox" name="paperId" value="${o.id}"/></td>
					<td><font color="blue">${o.examName}</font></td>
					<td><font color="blue">${o.userId}</font></td>
					<td><font color="blue">${o.userName}</font></td>
					<td><font color="blue">${o.question}</font></td>
					<td><font color="blue">${o.submitTime}</font></td>
					<td><font color="blue">${o.judgementStatus}</font></td>
					<td><font color="blue">${o.remark}</font></td>
					<td class="operate">
						<c:if test="${o.judgementStatus eq'否'}">
							<a href="${ctx}/mock/toEditExamPaperPage.action?paperId=${o.id}" class="del">判分</a>
						</c:if>
						<c:if test="${o.judgementStatus eq'是'}">
							<a href="${ctx}/mock/toEditExamPaperPage.action?paperId=${o.id}" class="del">修改</a>
						</c:if>
						<a href="${ctx}/mock/toWritingJudgmentDetailPage.action?id=${o.id}" class="del">查看</a>
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
			url:"${ctx}/mock/toWritingJudgmentPageData.action",
			method:"post",
			// dataType: "json",
			data:{page:page+1},
			success: function(data){
				var html = "";
				html += "<div class='table-box' id='myDiv'>";
				html += "<table border='1' cellspacing='1'>";
				html += "<thead>";
				html += "<th class='num'></th>";
				html += "<th class='name'>试卷名称</th><th class='section'>试卷ID</th>";
				html += "<th class='section'>试卷名称</th><th class='section'>题目</th>";
				html += "<th class='section'>提交时间</th><th class='section'>是否判分</th><th class='section'>备注</th>";
				html += "<th class='operate'>操作</th>";
				html += "</thead>";
				html += "<tbody align='center'>";
                $.each(data.extend.dataList,function(){
					html += "<tr align='center'>";
					html += "<td><input type='checkbox' name='paperId' value='"+this.id+"'/></td>";
					html += "<td>"+this.examName+"</td>";
					html += "<td><font color='blue'>"+this.userId+"</font></td>";
					html += "<td><font color='blue'>"+this.userName+"</font></td>";
					html += "<td><font color='blue'>"+this.question+"</font></td>";
					html += "<td><font color='blue'>"+this.submitTime+"</font></td>";
					html += "<td><font color='blue'>"+this.judgementStatus+"</font></td>";
					html += "<td><font color='blue'>"+this.remark+"</font></td>";
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
<
<style type="text/css">
	/*设定表格最大显示宽度，超出显示... 鼠标悬浮显示全部*/
	table td{
		max-width:300px;
		word-wrap:
				break-word;
		text-overflow:ellipsis;
		white-space:nowrap;
		overflow:hidden;
	}
	table td:hover{
		white-space:normal;
		overflow:auto;
		color: red;
	}
	table td > font:hover{
		white-space:normal;
		overflow:auto;
		color: red;
	}
</style>
</html>
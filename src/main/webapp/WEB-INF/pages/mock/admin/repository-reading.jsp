<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<div class="title"><h2>题目管理</h2></div>
<form action="${ctx}/deleteQuestion.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addUser()">添加</a>
    <a href="javascript:;" class="del" onclick="deleteUser()">删除</a>
</div>
<div class="table-box" id="myDiv">
	<table border="1" cellspacing="1">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">阅读ID</th>
                <th class="operate">阅读名称</th>
                <th class="process">阅读1</th>
                <th class="process">阅读2</th>
                <th class="node">阅读篇数</th>
                <th class="time">备注</th>
                <th class="operate">操作</th>
            </tr>
        </thead>
        <tbody align="center">
        	<c:forEach items="${dataList}" var="o">
				<tr align="center">
					<td><input type="checkbox" name="questionId" value="${o.id}"/></td>
					<td>${o.id}</td>
					<td>${o.name}</td>
					<td title="${o.subjectReadingVos[0].passageTitleCn}">${o.subjectReadingVos[0].passageTitle}</td>
					<td title="${o.subjectReadingVos[1].passageTitleCn}">${o.subjectReadingVos[1].passageTitle}</td>
					<%--<td>${o.subjectReadingVos}</td>--%>
					<td>${fn:length(o.subjectReadingVos)} </td>
					<td></td>
					<%--<td><font color="blue">${o.courseId}</font></td>--%>
					<%--<td><font color="blue">${o.typeId}</font></td>--%>
				<%--	<td><font color="blue">
						<c:if test="${o.difficulty==0}">简单</c:if>
						<c:if test="${o.difficulty==1}">中等</c:if>
						<c:if test="${o.difficulty==2}">较难</c:if></font>
					</td>--%>
					<%--<td>${o.remark}</td>--%>
					<td class="operate">
						<a href="${ctx}/deleteQuestion.action?id=${o.id}" class="del">删除</a>
						<a href="${ctx}/toUpdQuestion.action?id=${o.id}" class="del">编辑</a>
						<a href="${ctx}/mock/toQueryRepositorReading.action?sectionId=${o.subjectReadingVos[0].id}" class="del">查看</a>
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
	alert(txt);
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
})

$('.pagination').pagination(${pageInfo.total},{
	callback: function(page){
/* 		document.myform.attributes["action"].value = "${ctx}/toQuestionPage.action?page="+(page+1); 
		$("form").submit(); */
		$.ajax({
			url:"/mock/toRepositoryReadingDate.action",
			method:"post",
			// dataType: "json",
			data:{page:page+1},
			success: function(data){
				var html = "";
				html += "<div class='table-box' id='myDiv'>";
				html += "<table border='1' cellspacing='1'>";
				html += "<thead>";
				html += "<th class='num'></th>";
				html += "<th class='name'>阅读ID</th><th class='operate'>阅读名称</th>";
				html += "<th class='process'>阅读1</th><th class='process'>阅读2</th><th class='node'>阅读篇数</th>";
				html += "<th class='time'>备注</th><th class='operate'>操作</th>";
				html += "</thead>";
				html += "<tbody align='center'>";

				$.each(data.extend.dataList,function(){
					html += "<tr align='center'>";
					html += "<td><input type='checkbox' name='id' value='"+this.id+"'/></td>";
					html += "<td>"+this.id+"</td>";
					html += "<td>"+this.name+"</td>";
					if(this.subjectReadingVos.length!=0){
                        if(this.subjectReadingVos.length>0) {
                            html += "<td title="+ this.subjectReadingVos[0].passageTitleCn+">" + this.subjectReadingVos[0].passageTitle + "</td>";
                        }
                        if(this.subjectReadingVos.length>1) {
                            html += "<td title="+ this.subjectReadingVos[1].passageTitleCn+">" + this.subjectReadingVos[1].passageTitle + "</td>";
                        }
                    }else{
                        html += "<td></td>";
                        html += "<td></td>";
					}
					html += "<td>"+this.subjectReadingVos.length+"</td>";
					html += "<td></td>";
				/*	html += "<td><font color='blue'>"+data[dataList].courseId+"</font></td>";
					html += "<td><font color='blue'>"+data[dataList].typeId+"</font></td>";
					if(data[dataList].difficulty == 0){
						html += "<td>简单</td>";
					}else if(data[dataList].difficulty == 1){
						html += "<td>中等</td>";
					}else{
						html += "<td>较难</td>";
					}
					if(data[dataList].remark==null){
						html += "<td>&nbsp;无&nbsp;</td>";
					}else{
						html += "<td>"+data[dataList].remark+"</td>";
					}*/
					html += "<td class='operate'><a href='${ctx}/deleteQuestion.action?id="+this.id+"' class='del'>删除</a>&nbsp;";
					html += "<a href='${ctx}/toUpdQuestion.action?id="+this.id+"' class='del'>编辑</a>&nbsp;";
					html += "<a href='${ctx}/mock/toQueryRepositorReading.action?sectionId="+this.id+"' class='del'>查看</a></td>";
					html += "</tr>";
                })
				html += "</tbody>"; 
				html += "</table>";
				html += "</div>";
		        $("#myDiv").html("");
		        $("#myDiv").append(html);
		    },
            error: function (data) {
            alert("error");
            }
		});
	},
	display_msg: true,
	setPageNo: false
});

function callback(ddatalist){
	alert(datalist);
	//todo:根据返回的datalist数据创建html结构展现给用户。
}

function deleteUser(){
	var ids = "";
	$("input:checkbox[name='id']:checked").each(function() {
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
	//  以下三行，随便哪一行都行         
/*	$("#myform").action="${ctx}/admin/toAddUser.action";
 	document.myform.action=‘new_url’;*/
	document.myform.attributes["action"].value = "${ctx}/toAddQuestion.action"; 
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");
// $("tbody td").css("text-align","center");
// $("thead th").css("text-align","center");
showRemind('input[type=text], textarea','placeholder');
</script>
</html>
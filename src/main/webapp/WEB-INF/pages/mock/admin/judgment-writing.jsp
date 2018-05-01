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
<link rel="stylesheet" href="${ctx}/css/judgment-writing.css" />
<link rel="stylesheet" href="${ctx}/css/WdatePicker.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>写作判分</h2></div>
<form action="${ctx}/mock/deleteExamPaper.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">

    <div class="row">
        <div class="col-md-2">
            <label for="userName">用户名称</label>
            <input type="text" id="userName" name="userName" value="${userName}"
                   style="width: 160px">
        </div>

        <div class="col-md-2">
            <label for="examName">试卷名称</label>
            <input type="text" id="examName" name="examName" value="${examName}"
                   style="width: 160px">
        </div>
        <div class="col-md-2">
            <label for="startTime">开始时间</label>
            <input id="startTime" type="text" onclick="WdatePicker({el:$dp.$('start_time'),dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width: 160px" value="${startDate}"/>
            <img onclick="WdatePicker({el:$dp.$('start_time')})" src="../js/skin/datePicker.gif" width="16" height="22"
                 align="absmiddle">
        </div>
        <div class="col-md-2">

            <label for="endTime">结束时间</label>
            <input id="endTime" type="text" onclick="WdatePicker({el:$dp.$('end_time'),dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width: 160px" value="${endDate}"/>
            <img onclick="WdatePicker({el:$dp.$('end_time')})" src="../js/skin/datePicker.gif" width="16" height="22"
                 align="absmiddle">
        </div>
        <div class="col-md-2" style="padding-left: 10px">
                    <%--<label for="typeSelector" class="control-label">状态</label>--%>
            <div class="row">
                <div class="col-sm-3"> <span style="display: inline-block;max-width: 100%;margin-bottom: 5px;font-weight: 700;margin-right: ">状态</span></div>
                    <div class="col-sm-9">
                        <select class="form-control" id="typeSelector" style="width: 130px;padding-left:40px">
                            <c:choose>
                                <c:when test="${type eq '1'}">
                                    <option value="1" selected>全部</option>
                                    <option value="2">待判</option>
                                    <option value="3">已判</option>
                                </c:when>
                                <c:when test="${type eq '2'}">
                                    <option value="1" >全部</option>
                                    <option value="2" selected>待判</option>
                                    <option value="3">已判</option>
                                </c:when>
                                <c:when test="${type eq '3'}">
                                    <option value="1" >全部</option>
                                    <option value="2">待判</option>
                                    <option value="3" selected>已判</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="1">全部</option>
                                    <option value="2">待判</option>
                                    <option value="3">已判</option>
                                </c:otherwise>
                            </c:choose>

                        </select>
                    </div>
            </div>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-primary" id="search">查询</button>
            <button type="button" class="btn btn-primary"> 重置</button>
        </div>
    </div>


</div>
<div class="table-box"  id='myDiv'>
	<table border="1" cellspacing="1">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="write">试卷名称</th>
                <th class="write">用户ID</th>
                <th class="write">用户名称</th>
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
							<a href="${ctx}/mock/toWritingJudgmentDetailPage.action?id=${o.id}" class="del">判分</a>
						</c:if>
						<c:if test="${o.judgementStatus eq'是'}">
							<a href="${ctx}/mock/toWritingJudgmentDetailPage.action?id=${o.id}" class="del">修改</a>
						</c:if>
						<%--<a href="${ctx}/mock/toWritingJudgmentDetailPage.action?id=${o.id}" class="del">查看</a>--%>
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
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${ctx}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
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
			data:{page:page+1,userName:$("#userName").val(),examName:$("#examName").val(),startDate:$("#startTime").val(),endDate:$("#endTime").val(),type:$("#typeSelector").val()},
			success: function(data){
                $("#userName").val(data.extend.userName);
                $("#examName").val(data.extend.examName);
                $("#startTime").val(data.extend.startTime);
                $("#endTime").val(data.extend.endTime);
                $("#type").val(data.extend.type);
				var html = "";
				html += "<div class='table-box' id='myDiv'>";
				html += "<table border='1' cellspacing='1'>";
				html += "<thead>";
				html += "<th class='num'></th>";
				html += "<th class='write'>试卷名称</th><th class='write'>用户ID</th>";
				html += "<th class='write'>用户名称</th><th class='section'>题目</th>";
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
					if(this.judgementStatus == "否"){
                        html += "<td class='operate'><a href='${ctx}/mock/toWritingJudgmentDetailPage.action?id="+this.id+"' class='del'>判分</a>&nbsp; </td>";
                    }else {
                        html += "<td class='operate'><a href='${ctx}/mock/toWritingJudgmentDetailPage.action?id="+this.id+"' class='del'>修改</a>&nbsp; </td>";

                    }
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
<script>
   $("#search").on("click",function () {
      var userName =  $("#userName").val();
       var examName = $("#examName").val();
       var startTime = $("#startTime").val();
       var endTime = $("#endTime").val();
       var type = $("#typeSelector").val();
       window.location.href="${ctx}/mock/toWritingJudgmentPage.action?examName=" + examName+ "&userName=" +userName + "&startDate=" +startTime+ "&endDate=" +endTime + "&type=" +type;
   })
</script>
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
    thead table th{
        font-size: 20px;
    }
</style>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线考试系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> 
	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
	}, false);
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	} 
</script>
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${ctx}/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/js/easing.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/audiojs/audio.min.js"></script>

<%--二级选项卡插件--%>
<script type="text/javascript" src="${ctx}/js/doubleLevel/js/pignose.tab.min.js"></script>
<link href="${ctx}/js/doubleLevel/css/pignose.tab.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/exam/ReadingQuestion.css" rel="stylesheet" type="text/css" media="all"/>

    <script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);

		});
        $(function() {
            $('.tab').pignoseTab({
                animation: true,
                children: '.tab'
            });
        });
	});

	function exitSystem(){
		window.location.href = "${ctx}/user/exitSys.action"	;
	}

</script>
	<script>
        audiojs.events.ready(function() {
            var as = audiojs.createAll();
        });
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
							<li><a class="hvr-overline-from-center button2" href="${ctx}/user/toIndex.action">首页</a></li>
							<li><a class="hvr-overline-from-center button2" href="${ctx}/toUserInfo.action?userId=${user.userId}">个人中心</a></li>
<!-- 							<li><a class="hvr-overline-from-center button2" href="onlinecheck.html">在线考试</a></li> -->
							<li><a class="hvr-overline-from-center button2" href="${ctx}/mock/toScoreQry.action?userId=${user.userId}">成绩查询</a></li>
							<li><a class="hvr-overline-from-center button2  active" href="${ctx}/mock/toMyBooksPage.action?userId=${user.userId}">我的答题记录</a></li>
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
<div class="main">
	<div>
		<%--<div class="wrap" style="width: 300px;">
			<span style="font-size: 22px;font-weight: bold;padding: 3px">仅显示错题:</span>
			<span style="margin-top: 5px">
				<input type="checkbox" id="checkbox_d2" class="chk_4"  /><label for="checkbox_d2"></label>
			</span>
		</div>--%>
		<div class="article">
			<div class="tab">
				<ul>
					<li>
						<a href="#">阅读</a>
						<div>
							<div class="tab">
								<ul>
									<li>
										<a href="#">passage 1</a>
										<div class="content">
											<div class="content-text-l">
                                                <div style="padding-top: 25px">
                                                <c:forEach items="${recordExamVo.reading.subjectReadingVos[0].questionReadingVos}" var="question">
													<div id="question${question.orderNum}">
														<span>${question.orderNum}.${question.question}</span>
														<br>
														<c:forEach items="${question.optionReadingVos}" var="option">
															<c:choose>
																<c:when test="${option.itemCode eq question.rightAnswer}">
																	<span style="color: greenyellow">${option.itemCode}.${option.itemName}</span>
																</c:when>
																<c:otherwise>
																	<span>${option.itemCode}.${option.itemName}</span>
																</c:otherwise>
															</c:choose>
														<br>
														</c:forEach>
													</div>
													<c:forEach items="${recordExamVo.readingOne}" var="readingOpt" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:choose>
																	<c:when test="${'null' eq readingOpt}">
																		<span>我的答案是：未作答</span>
																	</c:when>
																	<c:otherwise>
																		<span>我的答案是：${readingOpt}</span>
																	</c:otherwise>
																</c:choose>
															</c:if>
													</c:forEach>
													<c:forEach items="${recordExamVo.readingOneRight}" var="readingRight" varStatus="st">
														<c:if test="${st.index+1 == question.orderNum}">
															<c:if test="${readingRight eq 1}"> <span><img src="../images/icon-yes.ico" alt="" width="17px" height="17px"></span></c:if>
															<c:if test="${readingRight eq 0}"><span><img src="../images/icon-no.ico" alt="" width="17px" height="17px"></span></c:if>
														</c:if>
													</c:forEach>
													<br>
													<br>
                                                </c:forEach>
                                                </div>
                                            </div>
											<div class="content-text-r">
                                            <div class="passage-title"><h3>${recordExamVo.reading.subjectReadingVos[0].passageTitle}</h3></div>
                                                <div >
                                                     ${recordExamVo.reading.subjectReadingVos[0].passage}
                                                </div>
                                            </div>
										</div>
									</li>
									<li>
										<a href="#">passage 2</a>
										<div class="content">
											<div class="content-text-l">
												<div style="padding-top: 25px">
													<c:forEach items="${recordExamVo.reading.subjectReadingVos[1].questionReadingVos}" var="question">
														<div id="question${question.orderNum}">
															<span>${question.orderNum}.${question.question}</span>
															<br>
															<c:forEach items="${question.optionReadingVos}" var="option">
																<c:choose>
																	<c:when test="${option.itemCode eq question.rightAnswer}">
																		<span style="color: greenyellow">${option.itemCode}.${option.itemName}</span>
																	</c:when>
																	<c:otherwise>
																		<span>${option.itemCode}.${option.itemName}</span>
																	</c:otherwise>
																</c:choose>
																<br>
															</c:forEach>
														</div>
														<c:forEach items="${recordExamVo.readingTwo}" var="readingOpt" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:choose>
																	<c:when test="${'null' eq readingOpt}">
																		<span>我的答案是：未作答</span>
																	</c:when>
																	<c:otherwise>
																		<span>我的答案是：${readingOpt}</span>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
														<c:forEach items="${recordExamVo.readingTwoRight}" var="readingRight" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:if test="${readingRight eq 1}"> <span><img src="../images/icon-yes.ico" alt="" width="17px" height="17px"></span></c:if>
																<c:if test="${readingRight eq 0}"><span><img src="../images/icon-no.ico" alt="" width="17px" height="17px"></span></c:if>
															</c:if>
														</c:forEach>
														<br>
														<br>
													</c:forEach>
												</div>
											</div>
											<div class="content-text-r">
												<div class="passage-title"><h3>${recordExamVo.reading.subjectReadingVos[1].passageTitle}</h3></div>
												<div >
													${recordExamVo.reading.subjectReadingVos[1].passage}
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<a href="#">听力</a>
						<div>
							<div class="tab">
								<ul>
									<li>
										<a href="#">passage 1</a>
										<div class="content">
											<div class="content-text-l">
												<div style="padding-top: 25px">
													<c:forEach items="${recordExamVo.listening.subjectListeningVos[0].questionListeningVos}" var="question">
														<div id="question${question.orderNum}">
															<span>${question.orderNum}.${question.question}</span>
															<br>
															<c:forEach items="${question.optionListeningVos}" var="option">
																<c:choose>
																	<c:when test="${option.itemCode eq question.rightAnswer}">
																		<span style="color: greenyellow">${option.itemCode}.${option.itemName}</span>
																	</c:when>
																	<c:otherwise>
																		<span>${option.itemCode}.${option.itemName}</span>
																	</c:otherwise>
																</c:choose>
																<br>
															</c:forEach>
														</div>
														<c:forEach items="${recordExamVo.listeningOne}" var="listeningOpt" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:choose>
																	<c:when test="${'null' eq listeningOpt}">
																		<span>我的答案是：未作答</span>
																	</c:when>
																	<c:otherwise>
																		<span>我的答案是：${listeningOpt}</span>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
														<c:forEach items="${recordExamVo.listeningOneRight}" var="listeningRight" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:if test="${listeningRight eq 1}"> <span><img src="../images/icon-yes.ico" alt="" width="17px" height="17px"></span></c:if>
																<c:if test="${listeningRight eq 0}"><span><img src="../images/icon-no.ico" alt="" width="17px" height="17px"></span></c:if>
															</c:if>
														</c:forEach>
														<br>
														<br>
													</c:forEach>
												</div>
											</div>
											<div class="content-text-r">
												<div class="passage-title"><h3>${recordExamVo.listening.subjectListeningVos[0].title}</h3></div>
												<div >
													<img src="${recordExamVo.listening.subjectListeningVos[0].imageURL}" width="460px" height="232px" style="clear: both;display: block; margin:auto;padding-bottom: 5px">
													<div style="padding-left: 83px">
													<audio src="${recordExamVo.listening.subjectListeningVos[0].audioURL}" preload="auto" />
													</div>
												</div>
											</div>
										</div>
									</li>
									<li>
										<a href="#">passage 2</a>
										<div class="content">
											<div class="content-text-l">
												<div style="padding-top: 25px">
													<c:forEach items="${recordExamVo.listening.subjectListeningVos[1].questionListeningVos}" var="question">
														<div id="question${question.orderNum}">
															<span>${question.orderNum}.${question.question}</span>
															<br>
															<c:forEach items="${question.optionListeningVos}" var="option">
																<c:choose>
																	<c:when test="${option.itemCode eq question.rightAnswer}">
																		<span style="color: greenyellow">${option.itemCode}.${option.itemName}</span>
																	</c:when>
																	<c:otherwise>
																		<span>${option.itemCode}.${option.itemName}</span>
																	</c:otherwise>
																</c:choose>
																<br>
															</c:forEach>
														</div>
														<c:forEach items="${recordExamVo.listeningTwo}" var="listeningOpt" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:choose>
																	<c:when test="${'null' eq listeningOpt}">
																		<span>我的答案是：未作答</span>
																	</c:when>
																	<c:otherwise>
																		<span>我的答案是：${listeningOpt}</span>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
														<c:forEach items="${recordExamVo.listeningTwoRight}" var="listeningRight" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:if test="${listeningRight eq 1}"> <span><img src="../images/icon-yes.ico" alt="" width="17px" height="17px"></span></c:if>
																<c:if test="${listeningRight eq 0}"><span><img src="../images/icon-no.ico" alt="" width="17px" height="17px"></span></c:if>
															</c:if>
														</c:forEach>
														<br>
														<br>
													</c:forEach>
												</div>
											</div>
											<div class="content-text-r">
												<div class="passage-title"><h3>${recordExamVo.listening.subjectListeningVos[1].title}</h3></div>
												<div >
													<img src="${recordExamVo.listening.subjectListeningVos[1].imageURL}" width="460px" height="232px" style="clear: both;display: block; margin:auto;padding-bottom: 5px">
													<div style="padding-left: 83px">
														<audio src="${recordExamVo.listening.subjectListeningVos[1].audioURL}" preload="auto" />
													</div>
												</div>
											</div>
										</div>
									</li>
									<li>
										<a href="#">passage 3</a>
										<div class="content">
											<div class="content-text-l">
												<div style="padding-top: 25px">
													<c:forEach items="${recordExamVo.listening.subjectListeningVos[2].questionListeningVos}" var="question">
														<div id="question${question.orderNum}">
															<span>${question.orderNum}.${question.question}</span>
															<br>
															<c:forEach items="${question.optionListeningVos}" var="option">
																<c:choose>
																	<c:when test="${option.itemCode eq question.rightAnswer}">
																		<span style="color: greenyellow">${option.itemCode}.${option.itemName}</span>
																	</c:when>
																	<c:otherwise>
																		<span>${option.itemCode}.${option.itemName}</span>
																	</c:otherwise>
																</c:choose>
																<br>
															</c:forEach>
														</div>
														<c:forEach items="${recordExamVo.listeningThree}" var="listeningOpt" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:choose>
																	<c:when test="${'null' eq listeningOpt}">
																		<span>我的答案是：未作答</span>
																	</c:when>
																	<c:otherwise>
																		<span>我的答案是：${listeningOpt}</span>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
														<c:forEach items="${recordExamVo.listeningThreeRight}" var="listeningRight" varStatus="st">
															<c:if test="${st.index+1 == question.orderNum}">
																<c:if test="${listeningRight eq 1}"> <span><img src="../images/icon-yes.ico" alt="" width="17px" height="17px"></span></c:if>
																<c:if test="${listeningRight eq 0}"><span><img src="../images/icon-no.ico" alt="" width="17px" height="17px"></span></c:if>
															</c:if>
														</c:forEach>
														<br>
														<br>
													</c:forEach>
												</div>
											</div>
											<div class="content-text-r">
												<div class="passage-title"><h3>${recordExamVo.listening.subjectListeningVos[2].title}</h3></div>
												<div >
													<img src="${recordExamVo.listening.subjectListeningVos[2].imageURL}" width="460px" height="232px" style="clear: both;display: block; margin:auto;padding-bottom: 5px">
													<div style="padding-left: 83px">
														<audio src="${recordExamVo.listening.subjectListeningVos[2].audioURL}" preload="auto" />
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<a href="#">写作</a>
						<div>
							<div class="tab">
								<ul>
									<li>
										<a href="#">passage 1</a>
										<div>
											<div>
												<div style="padding: 8px">
												<div style="padding-bottom: 5px;font-weight: bold">问题：</div>
												<p>${recordExamVo.writing.subjectWritingVos[0].questionWritingVos[0].remark1}</p>
												<p style="font-weight: bold">${recordExamVo.writing.subjectWritingVos[0].questionWritingVos[0].question}</p>
												<p>${recordExamVo.writing.subjectWritingVos[0].questionWritingVos[0].remark2}</p>
												</div>
												<div style="padding: 8px">
													<div>
														<div style="padding-top: 5px;font-weight: bold">我的答案</div>
														<div style="width: auto; border:1px solid black;padding: 2px;">
															<span style="width: 100%;resize:none" disabled="disabled">
															${recordExamVo.myWritingAnswers[0]}
															</span>
														</div>

														<div style="padding-top: 5px;font-weight: bold">分数：</div>
														${recordExamVo.myWritingScore[0]}
														<div style="padding-top: 5px;font-weight: bold">批改意见</div>
														<textarea style="width: 100%;resize:none" disabled="disabled">
														${recordExamVo.myWritingAnnotation[0]}
														</textarea>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li>
										<a href="#">passage 2</a>
										<div>
											<div>
												<div style="padding: 8px">
													<div style="padding-bottom: 5px;font-weight: bold">问题：</div>
													<p>${recordExamVo.writing.subjectWritingVos[1].questionWritingVos[0].remark1}</p>
													<p style="font-weight: bold">${recordExamVo.writing.subjectWritingVos[1].questionWritingVos[0].question}</p>
													<p>${recordExamVo.writing.subjectWritingVos[1].questionWritingVos[0].remark2}</p>
												</div>
												<div style="padding: 8px">
													<div>
														<div style="padding-top: 5px;font-weight: bold">我的答案</div>
														<textarea style="width: 100%;resize:none" disabled="disabled">
															${recordExamVo.myWritingAnswers[1]}
														</textarea>
														<div style="padding-top: 5px;font-weight: bold">分数：</div>
														${recordExamVo.myWritingScore[1]}
														<div style="padding-top: 5px;font-weight: bold">批改意见</div>
														<textarea style="width: 100%;resize:none" disabled="disabled">
															${recordExamVo.myWritingAnnotation[1]}
														</textarea>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

	</div>
</div>
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});
</script>
<style>

/*二级*/
	#wrapper {
		padding-bottom: 40px;
	}
	.article {
		max-width: 1400px;
		width: 90%;
		margin: 0 auto;
		/*padding-top: 40px;
		border-top: 1px solid #efefef;*/
		font-family: 'Raleway', 'helvetica', 'sans-serif';
		text-align: center;
	}

	.article h3 {
		margin-bottom: 40px;
	}

	.article table {
		font-size: 115%;
		text-align: left;
	}
	.article pre {
		font-size: 115%;
	}

	.tab { width: 100%; width: auto; margin: 20px auto; border: 1px solid #e7e7e7; padding: 5px; }
	.nav.tab { width: auto; max-width: 100%; margin: 0; border: 0; padding: 0; border-bottom: 1px solid #ddd; }
	.pignose-sub-tab { border: 0; margin: 0; padding: 0;}
	.table { width: 100%; table-layout: fixed; }
	.table .subject { text-align: left; padding-left: 5%; }
	.table .date { text-align: right; padding-right: 5%; }
/*******STYLE 4*******/
.chk_4 + label {
	background-color: #FFF;
	padding: 11px 9px;
	border-radius: 7px;
	display: inline-block;
	position: relative;
	margin-right: 30px;
	background: #F7836D;
	width: 77px;
	height: 35px;
	box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.1), 0 0 10px rgba(245, 146, 146, 0.4);
}

.chk_4 + label:before {
	content: ' ';
	position: absolute;
	background: #FFF;
	top: 1px;
	z-index: 99999;
	left: 0px;
	width: 24px;
	color: #FFF;
	height: 32px;
	border-radius: 7px;
	box-shadow: 0 0 1px rgba(0,0,0,0.6);
}

.chk_4 + label:after {
	content: '关闭';
	position: absolute;
	top: 7px;
	left: 37px;
	font-size: 1.2em;
	color: white;
	font-weight: bold;
	left: 8px;
	/*padding: 5px;*/
	top: 4px;
	border-radius: 100px;
}

.chk_4:checked + label {
	background: #67A5DF;
	box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.1), 0 0 10px rgba(146, 196, 245, 0.4);
}

.chk_4:checked + label:after {
	content: '开启';
	left: 10px;
}

.chk_4:checked + label:before {
	content: ' ';
	position: absolute;
	z-index: 99999;
	left: 52px;
}


.chk_4 + label:after {
	left: 35px;
}
.demo{width:560px; margin:60px auto 10px auto}
.wrap{margin:30px 0}
.wrap p{padding:10px 0}
#checkbox_d2 + label:after, #checkbox_d2 + label:before, #checkbox label {
	-webkit-transition: all 0.1s ease-in;
	transition: all 0.1s ease-in;
}
.chk_1,.chk_2,.chk_3,.chk_4 {
	display: none;
}
</style>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>

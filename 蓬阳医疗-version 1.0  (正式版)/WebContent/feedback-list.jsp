<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/font/font-awesome.min.css"/>
<!--[if lt IE 7]>
<link href="${pageContext.request.contextPath}/font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/PIE_IE678.js"></script>
<![endif]-->
<title>病例信息管理</title>
<style type="text/css">
	DIV.digg { 
PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px;
 MARGIN: 3px; PADDING-TOP: 3px; TEXT-ALIGN: center 
} 
DIV.digg A { 
BORDER-RIGHT: #aaaadd 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #aaaadd 1px solid;
 PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px; 
BORDER-LEFT: #aaaadd 1px solid; COLOR: #000099; PADDING-TOP: 2px;
 BORDER-BOTTOM: #aaaadd 1px solid; TEXT-DECORATION: none 
} 
DIV.digg A:hover { 
BORDER-RIGHT: #000099 1px solid; BORDER-TOP: #000099 1px solid;
 BORDER-LEFT: #000099 1px solid; COLOR: #000; BORDER-BOTTOM: #000099 1px solid 
} 
DIV.digg A:active { 
BORDER-RIGHT: #000099 1px solid; BORDER-TOP: #000099 1px solid;
 BORDER-LEFT: #000099 1px solid; COLOR: #000; BORDER-BOTTOM: #000099 1px solid 
} 
DIV.digg SPAN.current { 
BORDER-RIGHT: #000099 1px solid; PADDING-RIGHT: 5px;
 BORDER-TOP: #000099 1px solid; PADDING-LEFT: 5px; FONT-WEIGHT: bold;
 PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #000099 1px solid;
 COLOR: #fff; PADDING-TOP: 2px; BORDER-BOTTOM: #000099 1px solid; BACKGROUND-COLOR: #000099 
} 
DIV.digg SPAN.disabled { 
BORDER-RIGHT: #eee 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #eee 1px solid;
 PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px;
 BORDER-LEFT: #eee 1px solid; COLOR: #ddd; PADDING-TOP: 2px;
 BORDER-BOTTOM: #eee 1px solid 
} 
</style>
<title>意见反馈列表</title>

<script type="text/javascript">
window.onload=function(){
	var a = $("#nowpage").val();
	var b = $("#pageallnum").val();
	var c = $("#search").val();
	var mess = $("#returnMess1").val();
	var nextpage = parseInt(a)+1; 
	var previouspage = a-1;

	
	if(b==1){
		
		
		$("#nextpage").hide();
		$("#nextpage").removeAttr("href");
		$("#previouspage").hide();
		$("#previouspage").removeAttr("href");
	};
	
	if(a==b){
		$("#nextpage").hide();
		$("#nextpage").removeAttr("href");
	};
	
	if(a==1){
		$("#previouspage").hide();
		$("#previouspage").removeAttr("href");
	};
	
	
};
	</script>
</head>
<body>
<nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 评论管理 <span class="c-gray en">&gt;</span> 意见反馈 </nav>

  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="r">共有数据：<strong>${requestScope.fbCount}</strong> 条</span>
  </div>
  <table class="table table-border table-bordered table-bg">
    <thead>
      <tr>
        <th scope="col" colspan="7">列表</th>
      </tr>
      <tr class="text-c">
        <th width="40">ID</th>
        <th width="200">用户名</th>
        <th>反馈信息</th>
        <th width="70">操作</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${fbList}" var="patient">
    <c:if test="${empty patient}"><tr class="text-c" align="center"><p>还没有一条记录</p></tr></c:if>
    <c:if test="${ not empty patient}">
      <tr class="text-c">
        <td>${patient.id}</td>
        <td>${patient.user.userName}</td>
        <td>${patient.feed}</td>
        <td class="f-14"><a title="删除" href="/test/feed/del.do?id=${patient.id}" onClick="return confirm('确定删除?');" class="ml-5" style="text-decoration:none"><i class="icon-trash"></i></a></td>
      </tr>
      </c:if>
      </c:forEach>
    </tbody>
  </table>
</div>

	<div id="pagenum" class="digg" align="center" style="position: absolute;width: 95%;margin: 0;top: 600px;"> 
		<a id="previouspage" href="/test/feed/show.do?page=${requestScope.nowPage-1}"><span>&lt;</span></a>
		<c:forEach var="i" begin="1" end="${requestScope.pagenum}">
		<a class="page" href="/test/feed/show.do?page=${i}">${i}</a>
		</c:forEach>
		<a id="nextpage" href="/test/feed/show.do?page=${requestScope.nowPage+1}"><span> 
		&gt; </span></a>
		<div align="left" style="float: right;border: 10px;border-color: black;">
		<span><font size="2px">当前页:&nbsp;&nbsp;${requestScope.nowPage}&nbsp;&nbsp;/&nbsp;&nbsp;${requestScope.pagenum}
		</font>
		</span>
		</div>
		</div> 
 
	<input id="pageallnum" type="hidden" value="${requestScope.pagenum}"/> 
	<input id="nowpage" type="hidden" value="${requestScope.nowPage}"/> 
	<input id="search" type="hidden" value="${requestScope.search}"/> 
	<input id="returnMess1" type="hidden" value="${requestScope.mess}"/>
	
	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagenav.cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/PIE_IE678.js"></script>
<![endif]-->
<!--[if lt IE 8 ]
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<!--[if lt IE 7]>
<link href="${pageContext.request.contextPath}/font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if lt IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script>
</body>
</html>
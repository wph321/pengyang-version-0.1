<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

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
<script type="text/javascript">
window.onload=function(){
	var a = $("#nowpage").val();
	var b = $("#pageallnum").val();
	var c = $("#search").val();
	var mess = $("#returnMess1").val();
	var nextpage = parseInt(a)+1; 
	var previouspage = a-1;
	
	
	
	if(c=="search"){
		for(var i =0;i<=parseInt(b);i++){
			var p = i+1;
			$(".page").eq(i).attr("href","/test/patient/findByNameOrNum.do?mess="+mess+"&page="+p)
		};
		$("#nextpage").attr("href","/test/patient/findByNameOrNum.do?mess="+mess+"&page="+nextpage);
		$("#previouspage").attr("href","/test/patient/findByNameOrNum.do?mess="+mess+"&page="+previouspage);
		
	};
	
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

function changebutton(){
	var m = $("#mess").val();
	if(m==null || m==""){
		$("#nullMess").html("");
		$("#nullMess").html("条件不能为空");
	};
};

function onfousMessChange(){
	$("#nullMess").html("");
};
</script>
</head>


<body>
<nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span>病例信息管理 <span class="c-gray en">&gt;</span> <a href="/test/patient/show.do?page=1">病例管理 </a><a id="refresh" href="${requestScope.refresh}" class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" title="刷新" ><i class="icon-refresh"></i></a></nav>
<div class="pd-20">
  <div class="text-c"> 
    <form action="/test/patient/findByNameOrNum.do?page=1" method="post">
    <input type="text" class="input-text" onfocus="onfousMessChange()" style="width:250px;" placeholder="输入姓名或医疗号" id="mess" name="mess" oninput="$('#search-button').attr('disabled',false)" ><button disabled="disabled" type="submit" class="btn btn-success" id="search-button" name="" ><i class="icon-search"></i> 搜索</button>
	<span id="nullMess" style="font-color: red; position: fixed; float: left;"></span>
	</form>      
  </div>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
  <!--  
    <span class="l"><a href="javascript:;" onClick="datadel()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
    <a href="javascript:;" onClick="user_add('550','','添加用户','user-add.html')" class="btn btn-primary radius"><i class="icon-plus"></i> 添加用户</a></span>
    -->
    <span id="returnMess" align="center"><font color="red" size="5px"align="center">${requestScope.returnMess}</font></span>
    <span class="r">共有数据：<strong>${requestScope.patientCount}</strong>条</span>
  </div>
  <div style="overflow: scroll; width: 100%;" align="center">
  <table style="width: 1680px;" align="center" class="table table-border table-bordered table-hover table-bg table-sort" width="815px">
    <thead>
      <tr class="text-c">
        <!--  <th width="25px"><input type="checkbox" name="" value=""></th> -->
        <th width="30px">ID</th>
        <th width="50px">姓名</th>
        <th width="40px">性别</th>
        <th width="90px">年龄</th>
        <th width="150px">电话</th>
        <th width="100px">主治医师</th>
        <th width="130px">病例</th>
        <th width="100px">诊断医师</th>
        <!-- <th width="100px">操作</th> -->
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${paList}" var="patient">
    <c:if test="${empty patient}"><tr class="text-c" align="center"><p>还没有一条记录</p></tr></c:if>
    <c:if test="${ not empty patient}">
      <tr class="text-c">
       <!--  <td width="25px"><input type="checkbox" value="1" name=""></td> -->
        <td width="30px">${patient.pat_id}</td>
        <input type="hidden" value="${patient.result}"/>
        <td width="50px"><u style="cursor:pointer" class="text-primary" title="结论" onclick="user_show('10001','360','','结论','${pageContext.request.contextPath}/user-show.jsp?result=${patient.result}&name=${patient.name}')">${patient.name}</u></td>
        <td width="40px">${patient.sex}</td>
        <td width="90px">${patient.age}</td> 
        <td width="150px">${patient.telphone}</td>
        <td width="100px">${patient.doc_name}</td>
        <td width="130px">
 <!--        <form id="_form" method="post" action="baogao.do">
  <input type="hidden" name="fileAddress" value="${patient.pdf_path}" /> 
  <a onclick="document.getElementById('_form').submit();"> ${patient.pdf_path}</a>
</form>
   	-->
        <a href="baogao.do?fileAddress=${patient.id}">
        ${patient.pdf_path}</a>
     
        </td>
        
        <td width="100px">${patient.diag_Doctor}</td>
       <!--  <td width="100px" class="f-14 user-manage"> <a title="编辑" href="javascript:;" onClick="user_edit('4','550','','编辑','user-add.html')" class="ml-5" style="text-decoration:none"><i class="icon-edit"></i></a> 
         <a title="删除" href="javascript:;" onClick="user_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="icon-trash"></i></a></td>
     	-->
      </tr>
      </c:if>
      </c:forEach>
    </tbody>
  </table>
  </div>
 	<div id="pagenum" class="digg" align="center" style="position: absolute;width: 95%;margin: 0;top: 600px"> 
		<a id="previouspage" href="/test/patient/show.do?page=${requestScope.nowPage-1}"><span>&lt;</span></a>
		
		
		<c:forEach var="i" begin="1" end="${requestScope.pagenum}">
		
		<a class="page" href="/test/patient/show.do?page=${i}">${i}</a>
		</c:forEach>
		
		
		<a id="nextpage" href="/test/patient/show.do?page=${requestScope.nowPage+1}"><span> 
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagenav.cn.js"></script>
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
	
</body>
</html>
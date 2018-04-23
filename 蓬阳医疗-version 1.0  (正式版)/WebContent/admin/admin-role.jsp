<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/font/font-awesome.min.css"/>
<!--[if lt IE 7]>
<link href="${pageContext.request.contextPath}/font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/PIE_IE678.js"></script>
<![endif]-->
<title>Insert title here</title>
</head>
<body>

<nav class="Hui-breadcrumb"><a href="${pageContext.request.contextPath}/welcome.jsp"><i class="icon-home"></i> 首页 <span class="c-gray en"></a>&gt;</span>病例信息管理 <span class="c-gray en">&gt;</span> <a href="/test/patient/show.do?page=1">病例管理 </a><a id="refresh" href="${requestScope.refresh}" class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" title="刷新" ><i class="icon-refresh"></i></a></nav>
<div class="pd-20">
  <div class="text-c"> 
    <form action="/test/patient/findByNameOrNum.do?page=1" method="post">
    <input type="text" class="input-text" onfocus="onfousMessChange()" style="width:250px;" placeholder="请输入患者姓名" id="mess" name="mess" oninput="$('#search-button').attr('disabled',false)" ><button disabled="disabled" type="submit" class="btn btn-success" id="search-button" name="" ><i class="icon-search"></i> 搜索</button>
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
  <table id="list-table" style="width: 1680px;" align="center" class="table table-border table-bordered table-hover table-bg table-sort">
    <thead>
      <tr class="text-c">
        <!--  <th width="25px"><input type="checkbox" name="" value=""></th> -->
        <th width="1%">ID</th>
        <th width="40xp">姓名</th>
        <th class="mess-hidden" width="40px">性别</th>
        <th class="mess-hidden" width="40px">年龄</th>
        <th class="mess-hidden" width="50px">主治医师</th>
        <th class="mess-hidden" width="30px">电话</th>
        <th class="mess-hidden" width="60px">诊断医师</th>
        <!-- <th width="100px">操作</th> -->
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${paList}" var="patient">
    <c:if test="${empty patient}"><tr class="text-c" align="center"><p>还没有一条记录</p></tr></c:if>
    <c:if test="${ not empty patient}">
      <tr class="text-c">
       <!--  <td width="25px"><input type="checkbox" value="1" name=""></td> -->
        <td width="10px">${patient.pat_id}</td>
        <td width="50px"><a href="baogao.do?id=${patient.id}">${patient.name}</a></td>
       
        <td class="mess-hidden" width="40px">${patient.sex}</td>
        <td class="mess-hidden" width="40px">${patient.age}</td> 
        <td class="mess-hidden" width="50px">${patient.doc_name}</td>
        <td class="mess-hidden" width="30px">${patient.telphone}</td>
        
        <td class="mess-hidden" width="60px">${patient.diag_Doctor}</td>
       <!--  <td width="100px" class="f-14 user-manage"> <a title="编辑" href="javascript:;" onClick="user_edit('4','550','','编辑','user-add.html')" class="ml-5" style="text-decoration:none"><i class="icon-edit"></i></a> 
         <a title="删除" href="javascript:;" onClick="user_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="icon-trash"></i></a></td>
     	-->
      </tr>
      </c:if>
      </c:forEach>
    </tbody>
  </table>
  </div>

<div>

	<h1 align="center">权限</h1></br></br></br></br>

<!--user power -->
<div id="user-power" align="center">
<form action="" method="post">
<table width="100%" align="center" style="margin-left: 5%;">
<thead align="center"></thead>
<tr>
<td><input name="1" type="checkbox" value="" />本地病例浏览</td>
<td><input name="1" type="checkbox" value="" />本地页面修改</td>
<td><input name="1" type="checkbox" value="" />本地公告发布</td>
<td><input name="1" type="checkbox" value="" />本地设备查询</td>
<td><input name="1" type="checkbox" value="" />本地设备状态</td>
</tr>
<tr height="20px"></tr>
<tr>
<td><input name="1" type="checkbox" value="" />本地设备查询</td>
<td><input name="1" type="checkbox" value="" />本地设备状态</td>
<td><input name="1" type="checkbox" value="" />设备保修</td>
<td><input name="1" type="checkbox" value="" />本地设备查询</td>
<td><input name="1" type="checkbox" value="" />本地设备状态</td>
</tr>
<tr height="20px"></tr>
<tr>
<td><input name="1" type="checkbox" value="" />本地医院医生查询</td>
<td><input name="1" type="checkbox" value="" />本地医院在用设备查询</td>
<td><input name="1" type="checkbox" value="" />设备库存查询</td>
<td><input name="1" type="checkbox" value="" />本地设备查询</td>
<td><input name="1" type="checkbox" value="" />本地设备状态</td>
</tr>


</table>

</br></br></br></br>

<div align="center">
<input type="submit" value="赋予上述权限" width="30%" />
</div>

</div>

</body>
</html>
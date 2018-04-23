<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta content="always" name="referrer">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/font/font-awesome.min.css"/>
<!--[if lt IE 7]>
<link href="${pageContext.request.contextPath}/font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/PIE_IE678.js"></script>
<![endif]-->
<title>病例展示</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jqprint-0.3.js"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script> 
<script type="text/javascript">



$(document).ready(function(){ 
	var bodyWidth=screen.width;
	$("#pdf").attr("src","报告.pdf");
	if($("#change-src")!=null || !$("#change-src").equals("")){
		$("#pdf").attr("src","报告.pdf");
	}
	if(bodyWidth<1300){
		 
		$("#phone-result-button").attr("display","");
		$(".hideOption").show();
		$("#fudong-window").hide();
		$("#pdf-show").css("width",bodyWidth);
		$("#pdf-show").css("margin",0);
	}else{
		$("#close-result").hide();
		$("#phone-result-button").hide();
	}
	if($("#result-test").val()!=null){
		var ArrayMenu = $('.pdf');
	    
		for(var i = 0;i < ArrayMenu.length; i++){
		var a = $(ArrayMenu[i]).attr("src");
		a = encodeURI(a);
		$(ArrayMenu[i]).css("src",a);
		}
	}
})
	
function showResultHidePdf(){
	var bodyWidth=screen.width;
	$("#fudong-window").show();
	$("#fudong-window").css("width",bodyWidth);
	$("#fudong-window").css("margin",0);
	$("#fudong-window").css("align","center");
	$("#fudong-window").css("right",0);
	$("#pdf-show").hide();
}
	
function showpdfHideResult(){
	$("#fudong-window").hide();
	$("#pdf-show").show();
	
}
	

	
	
function printJPG(){
		$("#pdf").attr("src","报告.pdf");	
		$("#pdf").removeAttr("style");

		$("#pdf").jqprint({
		 debug: false,            
         importCSS: true,          
         printContainer: true,    
         operaSupport: true 
	})  
	$("#pdf").css("margin-top",60);
}
	
function changePdfWidth(){
		var pdfwidth = 	$("#scaleSelect").val();
		var bodyWidth=screen.width;
		if(bodyWidth<1300){
		$("#pdf-show").css("width",pdfwidth);
		}
		$(".pdf").css("width",pdfwidth);
}
</script>

</head>
<body style="background-color: #555;">
<div id="do-pdf" style="width: 100%;height: 40px;background-color: #333;position: fixed;float: left;">
			<!-- <div id="" align= "middle" style="float: left; margin-left: 45%">
                     <select id="scaleSelect" onchange="changePdfWidth()" style="margin-top: 10px;" align="center">
                      <option title="" value="10%">10%</option>
                      <option title="" value="20%">20%</option>
                      <option title="" value="30%">30%</option>
                      <option title ="" value="40%">40%</option>
                      <option title="" value="50%">50%</option>
                      <option title="" value="70%">70%</option>
                      <option title="" value="75%">75%</option>
                      <option title="" value="80%">80%</option>
                      <option title="" value="90%">90%</option>
                      <option title="" value="100%" selected="selected">100%</option>
                      <option title="" class="hideOption" value="150%" style="display: none;">150%</option>
                      <option title="" class="hideOption" value="200%" style="display: none;">200%</option>
                      <option title="" class="hideOption" value="250%" style="display: none;">250%</option>
                      <option title="" class="hideOption" value="300%" style="display: none;">300%</option>
                    
                    </select>
                    
                    -->
                   
            <div id="phone-result-button" align="right" style="margin-right: 5px;">
            	<button id="result-button" style="margin-top: 10px;" onclick="showResultHidePdf()">结论</button>
            </div>
            </div>
            
</div>
<input id="change-src" value="${src}" type="hidden" />
<div id="pdf-show" style="margin-top: 3%;margin-left: 20px; float: left;background-color: #444;width: 70%; height: 95%;" align="center">
<!-- 
<img width="100%" class="pdf" style="margin-top: 60px;" src="showbaogao.do?path=${address}" align="middle">
<object classid="clsid:CA8A9780-280D-11CF-A24D-444553540000" width="100%" border="0" name="pdf"> 
<param name="toolbar" value="false">
<param name="_Version" value="65539">
<param name="_ExtentX" value="20108">
<param name="_ExtentY" value="10866">
<param name="_StockProps" value="0">
<param name="SRC" value="showbaogao.do?path=${file}">
</object>

		<button onclick="printJPG()">打印</button>
		<object class="pdf" width="100%" height="100%">
  			 <param name="autoplay" value="true" />
			 <embed id="pdf" width="100%" height="100%" class="pdf" name="show-pdf" 
				src="showbaogao.do?id=${id}" type="application/pdf"
				internalinstanceid="46" title="病例报告.pdf"/>
		</object>	
		<iframe name="show_pdf_frame" width="100%" height="100%" src="${pageContext.request.contextPath}/web/viewer.jsp"> 
　　		</iframe>
-->

<iframe src="<c:url value="../web/viewer.jsp" />?file=/test/patient/showbaogao.do?id=${pdf_id}" width="100%" height="800"></iframe>

	</div>
<div id="fudong-window" align="center" style="position: fixed;top: 40px;float: left;right: 50px;margin-top: 20px;width: 20%;background-color: white;">
<div class="cl pd-20" style=" background-color:#5bacb6">

  <!--<img class="avatar avatar-XL l" src="images/user.png">
  $("#scaleSelect").append("<option value='"+150%+"'>"+150%+"</option>");
		$("#scaleSelect").append("<option value='"+200%+"'>"+200%+"</option>");
		$("#scaleSelect").append("<option value='"+250%+"'>"+250%+"</option>");
		$("#scaleSelect").append("<option value='"+300%+"'>"+300%+"</option>");
  	--> 
  	
  <dl style="margin-left:20px; color:#fff">
  <div id="close-result" align="right" style="float: right;margin-right: 0;width: 20%;">
		
		<a
			class="btn btn-danger radius ml-10" onclick="showpdfHideResult()" title="返回病例"><i
				class="icon-off"></i></a></span>
</div>
    <dt style="margin-left: 0;float: left;"><span class="f-18">编号:&nbsp;&nbsp;${patient.pat_id}</span></dt></br></br>
    <dt style="margin-left: 0;float: left;"><span class="f-18">姓名:&nbsp;&nbsp;${patient.name}</span></dt></br></br>
    <dt style="margin-left: 0;float: left;"><span class="f-18">诊断医师:&nbsp;&nbsp;${patient.diag_Doctor}</span></dt></br></br>
  </dl>
</div>
<div class="pd-20" style="min-height: 800px">
<!-- 
  <table class="table">
    <tbody>
      <tr>
        <th class="text-r" width="80">性别：</th>
        <td>男</td>
      </tr>
      <tr>
        <th class="text-r">手机：</th>
        <td>13000000000</td>
      </tr>
      <tr>
        <th class="text-r">邮箱：</th>
        <td>admin@mail.com</td>
      </tr>
      <tr>
        <th class="text-r">地址：</th>
        <td>北京市 海淀区</td>
      </tr>
      <tr>
        <th class="text-r">注册时间：</th>
        <td>2014.12.20</td>
      </tr>
      <tr>
        <th class="text-r">积分：</th>
        <td>330</td>
      </tr>
    </tbody>
  </table>
  -->
  
  <p id="result-test">&nbsp;&nbsp;&nbsp;&nbsp;${patient.result}</p>
</div>

</div>
<!--[if lt IE 8 ]
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if lt IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<!--[if IE 7]>    <html class="no-js ie7 ie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 ie" lang="en"> <![endif]-->
<!--[if IE 9]>    <html class="no-js ie9 ie" lang="en"> <![endif]-->
<!--[if gt IE 9]> <html class="no-js" lang="en">       <![endif]-->

</body>
</html>
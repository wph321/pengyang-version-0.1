<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta content="always" name="referrer">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>蓬阳医疗登录界面</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">

<style type="text/css">
#doc-ipt-username-1 {
						width: 25%;
						text-align: center;
					}
#doc-ipt-pwd-1      {
						width: 25%;
						text-align: center;
					}		
#login_btn			{
						width: 25%;
						text-align: center;
					}

</style>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">

window.onload=function(){
	if($("#doc-ipt-pwd-1").val()!=null && $("#doc-ipt-username-1").val()!=null){
		$("#login_btn").attr("disabled",false);
	}else{
	$("#login_btn").attr("disabled",true);
	}
}

function showWrongMess(){
	
	if($("#doc-ipt-username-1").val()==null || $("#doc-ipt-username-1").val()==""){
		$("#usermess").html("");
		$("#usermess").attr("color","red");
		$("#usermess").html("用户名不能为空");
		$("#login_btn").attr("disabled",true);
		return;
	}else{
		$.ajax({
            "type" : 'post',  
           	"url": "login/testusername.do",
            "sync" : true,  
            "dataType" : 'json',  
            "data" : {
            	'username':$("#doc-ipt-username-1").val()
            	},  
            "success" : function(resp) { 
                info=resp.info;
     	        if(info=="0"){  
                	$("#usermess").html("");
                	$("#usermess").attr("color","red");
                	$("#usermess").html("用户名不存在或用户名错误");
                	$("#login_btn").attr("disabled",true);
                } 
                if(info=="1"){  
                	$("#usermess").html("");
                	$("#usermess").attr("color","green");
                	$("#usermess").html("用户名正确");
                	if($("#doc-ipt-pwd-1").val!=null || !$("#doc-ipt-pwd-1").val()==""){
                		$("#login_btn").attr("disabled",false);
                	}else{
                    return;
                	}
               }  
            }  
        });
	<!--	$("#usermess").html(""); 
			$("#doc-ipt-pwd-1").change = $("#login_btn").attr("disabled",false);
			-->
	}
}

function namechang(){
	if($("#doc-ipt-pwd-1").val()==null || $("#doc-ipt-pwd-1").val()==""){
		$("#login_btn").attr("disabled",true);
	}else{
		$("#login_btn").attr("disabled",false);
		
	}
}

function changemess(){
	
	
	if($("#doc-ipt-username-1").val()==null 
			|| $("#doc-ipt-username-1").val()==""
			|| $("#usermess").text()=="用户名不存在或用户名错误"){
			$("#login_btn").attr("disabled",true);
		}else{
			$("#login_btn").attr("disabled",false);
		}
}

function passblur(){

	if($("#doc-ipt-pwd-1").val()==null || $("#doc-ipt-pwd-1").val()==""){
			$("#usermess").html("");
			$("#usermess").attr("color","red");
			$("#usermess").html("密码不能为空");
			$("#login_btn").attr("disabled",true);
		}else{
			if($("#doc-ipt-username-1").val()==null 
					|| $("#doc-ipt-username-1").val()==""){
				$("#usermess").html("");
				$("#usermess").attr("color","red");
				$("#usermess").html("用户名不能为空");
			}
			}
		}


			

</script>
</head>
<body>
	<div class="am-g myapp-login">
		<div class="myapp-login-logo-block">
			<div class="myapp-login-logo">
				<br/><br/><br/><br/><br/><br/>
			</div>
			<div class="">
				<div class="" align="center">
					<img src="${pageContext.request.contextPath}/images/pengyanglogo.png" />
					<div class="info"></div>
				</div>
			</div>

			<div class="login-font" align="center">
				<i>蓬阳 &nbsp;&nbsp;</i>&nbsp;&nbsp; and &nbsp;&nbsp;<span>&nbsp;&nbsp;
					精准心电</span>
					<span>
			</div>
			<div class="am-u-sm-10 login-am-center" align="center" style="width: 400px;">
				<form class="am-form" action="login/doctor.do" method="post">
					<fieldset>
						<div class="am-form-group" align="center">
							<span><font id="usermess" color="red"></font></span>
						
							<input type="text" class="" name="username" style="width: 300px;background-color: white;"
								id="doc-ipt-username-1" placeholder="输入工号  / 姓名"" onblur="showWrongMess()" onfocus="namechang()"/>
						</div>
						</br>
						<div class="am-form-group" align="center">
							<input type="password" class="" name="password" style="width: 300px;background-color: white;"
								id="doc-ipt-pwd-1" placeholder="输入6-9位密码" onblur="passblur()" onfocus="changemess()" />
							<span><font id="passmess" color="red"></font></span>
						</div>
						<p align="center">
							<button type="submit" style="width: 300px;" id="login_btn" class="am-btn am-btn-default" >Log
								In</button>
						</p>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

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
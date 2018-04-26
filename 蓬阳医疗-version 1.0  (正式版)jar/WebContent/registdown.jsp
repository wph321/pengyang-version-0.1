<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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

<!-- meta data -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Modern Register Form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- //meta data -->
<link
	href="//fonts.googleapis.com/css?family=Yanone+Kaffeesatz:200,300,400,700&amp;subset=cyrillic,latin-ext,vietnamese"
	rel="stylesheet">
<!-- css files -->
<link href="${pageContext.request.contextPath}/css/regist-style.css"
	type="text/css" rel="stylesheet" media="all">
<!-- //css files -->
<script type="text/javascript">
	$(document).ready(
			function() {

				$("#shselect").change(function() {
					$("#sh").val($(this).find("option:selected").text());
				});

				$.ajax({
					type : 'POST',
					url : "login/findprovince.do",
					data : null,
					success : function(data) {
						if (data.length > 0) {
							$("#provinceselect").empty();
							$("#provinceselect").append(
									"<option>--请选择省份--</option>");
							var job = jQuery.parseJSON(data);
							;
							for (var i = 0; i < job.length; i++) {
								$("#provinceselect").append(
										"<option value='"+job[i].id
							 +"'>"
												+ job[i].name + "</option>");
							}
						}
					},
					dataType : "html"
				});

				$("#provinceselect").change(
						function() {
							var id = $("#provinceselect ").val();
							$.post('login/findsh.do', {
								id : id
							}, function(sh) {
								if (sh != null && "" != sh) {
									$("#shselect").empty();
									$("#shselect").append(
											"<option>--请选择医院--</option>");
									var job1 = jQuery.parseJSON(sh);
									for (var i = 0; i < job1.length; i++) {
										$("#shselect").append(
												"<option value='"+job1[i].id
					 +"'>"
														+ job1[i].name
														+ "</option>");
									}
								} else {
									$("#shselect").empty();
									$("#shselect").append(
											"<option>--请选择医院--</option>");
									alert("此省份暂时没有登记的医院，请重新选择，或者联系工作人员！");
								}
							}, 'html')
						});

				if ($("#name") != null && $("#username") != null
						&& $("#pass1") != null && $("#pass2") != null
						&& $("#sh") != null && $("h") != null) {
					$("#rb").attr("disabled", false);
				}

			});
	
	
function check(){
		
		var b = $("#username").val();
		if(b!=null && ""!=b){
		$.ajax({
            type : 'post',  
           	url: "login/testusername.do", 
            dataType : 'json',  
            data : {
            	username : b
            	},  
            success : function(resp) { 
                info=resp.info;
                if(info=="1"){  
                	$("#rb").attr("disabled", true);
                	alert("用户名已存在，请重新输入用户名");
                	}else{
                		$("#rb").attr("disabled", false);
                	}
               }  
            
        });
		}else{
			return;
		}
	}
	
function checkpass(){
	var password = $("#pass1").val();
	var repsword = $("#pass2").val();
	if(password!=null && ""!=password && repsword!=null && ""!=repsword){
	if(password!=repsword){
		$("#pass1").val("");
		$("#pass2").val("");
		alert("两次输入的密码不同，请重新输入");
	}else{
		return
	}
	}else{
		return;
	}
	
}
	
</script>


</head>
<body>
	<!-- section -->
	<section class="register">
	<div class="register-full">
		<!-- <div class="register-left">
			<div class="register-in">
				<h1>Modern Register Form</h1>
				<p>Donec ipsum lorem, sodales a sagittis ut, convallis non nibh. Integer vitae cursus nunc, et vestibulum augue. Donec lacinia tristique purus. Aenean in est pretium lectus euismod facilisis.</p>
				<p>Donec ipsum lorem, sodales a sagittis ut, convallis non nibh. Integer vitae cursus nunc, et vestibulum augue. Donec lacinia tristique purus. Aenean in est pretium lectus euismod facilisis.</p>
				<br/>
				<br/>
				<div class="link">
				<br/>
					<a href="login.jsp">已有账号，点击此处登陆</a>
				</div>
			</div>
		</div>
		-->
		<div align="center" style="float: left; width: 50%;">
			<img style="top: 50%"
				src="${pageContext.request.contextPath}/images/pengyanglogo.png" />

			<br /> <br /> <br />
			<p align="center">公司简介</p>
			<br /> <br /> <br />
			<p style="color: white; margin-right: 5%;">
				&nbsp;&nbsp;
				北京蓬阳丰业医疗设备有限公司成立于2004年，是一家数字化医疗设备的生产商，以及医疗信息化的服务商；在医疗监测智能硬件产品及信息化产品领域的研发水平处于国内领先地位。在中国心电学会的大力支持与指导下，历经十余年潜心研究，拥有多项专利技术的“18导联全信息动态心电分析系统”于2016年8月27日在国家会议中心“中国心电学论坛”上正式发布，得到业内专家的一致肯定与好评，开启了动态心电“更全面、更精准、更便捷“的诊断时代！
				<br />蓬阳医疗连续三年获得“北京诚信企业”称号、是唯一获得中国心电学会“18导联动态心电技术研发基地“的企业，并与中国心电学会共同设立了”中国心电学会蓬阳心电基金“助力中国心电事业的发展与腾飞！
				蓬阳医疗已经与“GE医疗、超思电子、星脉医疗、泰医网、壹贰壹健康、育阳医疗“达成战略合作协议，共同开展相关产品的研发及商业模式的推广工作！
				蓬阳医疗将进一步整合资本和技术资源，开展“精准医疗、智慧医疗、物联医疗、数字医疗”相关产品的研发及推广工作，为推动中国医疗技术的创新及诊疗水平的提升而努力奋斗！
			</p>
		</div>

		<div id="register-right" class="register-right">
			<div class="register-in">
				<h2>注 册</h2>
				<div class="register-form">
					<form action="login/regist.do" method="post">
						<div class="fields-grid">
							<div class="styled-input agile-styled-input-top">
								<input id="name" type="text" name="name" required=""> <label>真实姓名<span
									id="namel" style="color: red"> *</span></label> <span></span>
							</div>
							<div class="styled-input">
								<input id="username" type="text" name="username" required="" onblur="check()"/>
								<label>用户名<span id="usernamel" style="color: red">
										*</span></label> <span></span>
							</div>
							<div class="styled-input">
								<input id="pass1" type="password" name="password" required="">
								<label>密码<span id="pass1l" style="color: red"> *</span></label>
								<span></span>
							</div>
							<div class="styled-input">
								<input id="pass2" type="password" name="password" required="" onblur="checkpass()">
								<label> 再次输入密码<span id="pass2l" style="color: red">
										*</span></label> <span></span>
							</div>
							<div class="styled-input">
								<input id="h" type="text" name="hospital" required=""> <label>本医院名<span
									style="color: red"> *</span></label> <span></span>
							</div>
							<div class="styled-input" style="display: none;">
								<span style="color: red"> *</span> <input type="radio"
									name="hospital_sign" onchange="showsh()" required="" value="0" />上级医院
								<input type="radio" name="hospital_sign" onchange="hidesh()"
									required="" value="1" checked="checked" />下级医院 <span></span>
							</div>
							<div class="styled-input" id="superhospital">
								<input id="sh" type="hidden" name="superiorhospital" required="" />

								<div align="center">
									<br /> <br /> <span style="float: left;"> <select
										id="provinceselect">
											<option selected="selected">--请选择省份--</option>
									</select> <select id="shselect">
											<option selected="selected">--请选择医院名--</option>
									</select>
									</span>
								</div>
								<label>上级医院名<span style="color: red"> *</scan></label>
							</div>

							<div class="clear"></div>
							<br />
							<p style="color: red;">*&nbsp;&nbsp;为必填字段</p>
							<br /> <label class="checkbox"><input type="checkbox"
								name="checkbox" checked><i></i>我已仔细阅读并接受本<a href="#">系统服务条款</a></label>
						</div>
						<input id="rb" disabled="disabled" type="submit" value="注册">
						<!-- &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<a href="login.jsp">已有账号，点击此处登陆</a>-->
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>

	</section>
	<!-- //section -->
</body>
</html>
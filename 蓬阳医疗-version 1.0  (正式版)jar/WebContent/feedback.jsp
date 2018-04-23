<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div align="center" style="position:absolute;left: 20%;" >
 <form style="text-align:center" action="/test/feed/add.do" method="post" onSubmit="editor.post();">
 <textarea id="Qing_input" name="content"></textarea>
 <input type="submit" onclick="editor.post();" value="提交" width="40%" /> &nbsp;&nbsp;
 </form>
 * 注: &nbsp;请输入200字以内的意见。
</div>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/qing-style.css" /> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/qing-editor-all.js"></script>




</body>
</html>
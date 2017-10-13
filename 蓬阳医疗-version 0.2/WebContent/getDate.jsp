<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*" %>

<%@ page info="系统当前时间是：" %>
<html>
<head><title>系统时间</title>
</head>
<body>
<%=getServletInfo()%><%=(new Date()).toLocaleString()%>


</body>
</html>
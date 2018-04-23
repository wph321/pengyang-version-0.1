<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>病例</title>
</head>
<body>

<embed width="100%" height="100%" name="show-pdf" 
id="show-pdf-page" src="${requestScope.file}" 
type="application/pdf" internalinstanceid="46" title="病例报告.pdf">

<button id="back">${requestScope.file}</button>
</body>
</html>
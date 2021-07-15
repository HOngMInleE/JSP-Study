<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attribute Test01</title>
</head>
<body>
<%
	pageContext.setAttribute("pageScope","pageValue");
	request.setAttribute("requestScope", "requestValue");
%>
pageScope = <%= pageContext.getAttribute("pageScope")%><!-- pageValue -->
<br>
requestScope = <%= request.getAttribute("requestScope")%><!-- requestValue -->
	
</body>
</html>
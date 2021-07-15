<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application JSP</title>
</head>
<body>
<%
	String appPath = application.getContextPath();
	String filePath = application.getRealPath("03_Application.jsp");
%>
웹 애플리케이션의 컨텍스트 패스명<br>
<b><%=appPath%></b><hr> <!--  /0715_WebStudy05  -->
웹 애플리케이션의 파일 경로명<br>
<b><%=filePath %></b> 
D:\HongMin's\JSP\.metadata\.plugins\org.eclipse.wst.server.core\
tmp0\wtpwebapps\0715_WebStudy05\03_Application.jsp<!--   -->
</body>
</html>
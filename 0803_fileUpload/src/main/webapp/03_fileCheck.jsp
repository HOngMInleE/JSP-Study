<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String fileName1 = request.getParameter("fileName1");
	String fileName2 = request.getParameter("fileName2");
	String originFileName1 = request.getParameter("originFileName1");
	String originFileName2 = request.getParameter("originFileName2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileCheckJSP</title>
</head>
<body>
	올린 사람 : <%= name%> <br>
	제 &nbsp; 목 : <%= subject %> <br>
	원래 파일명1 : <a href="03_file_down.jsp?file_name=<%=fileName1%>"><%= originFileName1 %></a>
	<br>
	원래 파일명2 : <a href="03_file_down.jsp?file_name=<%=fileName2%>"><%= originFileName2 %></a>
	<br>
	업로드된 파일명1 : <%= fileName1 %><br>
	업로드된 파일명2 : <%= fileName2 %><br>
</body>
</html>
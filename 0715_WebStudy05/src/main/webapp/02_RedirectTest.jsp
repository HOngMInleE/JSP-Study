<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect Test</title>
<% 
	int age = Integer.parseInt(request.getParameter("age"));
	if (age <= 19) {
%>
<script>
	alert("만 19세 미만 입장 불가");
</script>
<%
	} else {
	request.setAttribute("name", "홍길동"); 
	response.sendRedirect("02_RedirectResult.jsp");
	}
 %>
</head>
<body>
</body>
</html>
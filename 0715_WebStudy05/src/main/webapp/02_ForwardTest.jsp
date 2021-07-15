<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward Test</title>
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
	
// forward 방식으로 변경
	RequestDispatcher dispatcher =
			request.getRequestDispatcher("02_ForwardResult.jsp");
	dispatcher.forward(request,response);
	}
 %>
</head>
<body>
</body>
</html>
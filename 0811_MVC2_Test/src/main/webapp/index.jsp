<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Index.HomePage</title>
</head>
<body>
	<%
		response.sendRedirect("EmpServlet?command=emp_list");
	%>
</body>
</html>
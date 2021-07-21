<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	자바 코드 <hr>
<% 
	if(request.getParameter("id") != null) { 
%>
		== 연산자 사용 결과 : <%= request.getParameter("id")=="pinksung" %><br>
		equals() 사용 결과 : <%= request.getParameter("id").equals("pinksung") %><br>
		<br>
<%
	} else {
		out.print("id를 전달해 주세요.");
	}
%>
	<br>
	<br>
	EL식 <hr>
	== 연산자 사용 결과 : ${param.id =="pinksung" }<br>
</body>
</html>
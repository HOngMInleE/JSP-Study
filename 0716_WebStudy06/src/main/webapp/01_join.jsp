<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	if (id != null) {
		out.print(id + "님 로그인 하셨습니다.");
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="Login" method="get">
		회원명 : <input type="text" name="name">
		주소 : <input type="text" name="address">
		전화번호 : <input type="tel" name="tel">
		취미 : <input type="text" name="hobby">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>
<%
	}
%>
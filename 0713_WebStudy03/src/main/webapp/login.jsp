<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = (String)session.getAttribute("id");
%>
<body>
<%
	if (id == null) {
%>
	로그인이 되어 있지 않습니다.<br><br>
<%
	} else {
%>
	<%= id%>님 환영합니다.<br><br>
<%
	}
%>	

	<form action="login" method="post">
		아이디 : <input name="id"><br>
		비밀번호 : <input type="password" name="password"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>
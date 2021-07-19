<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
	<form method="post" action="Mission_testLogin.jsp">
		<label for="userId"> 아이디 : </label>
		<input type="text" name="id" id="userId"><br>
		
		<label for="userPwd"> 암 &nbsp; 호 : </label>
		<input type="password" name="pwd" id="userPwd" ><br>
		
		<input type="submit" value="로그인">
	</form>
</body>
</html>
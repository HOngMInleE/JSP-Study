<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Test loginForm</title>
</head>
<body>
	<form method="post" action="testLogin.jsp" > 
		<fieldset style="width:400px">
			<legend> 로그인 </legend>
			<label for="userId"> 아이디 : </label>
			<input type="text" name="id" id="userId"><br>
			
			<label for="userPwd"> 암 &nbsp; 호 : </label>
			<input type="password" name="pwd" id="userPwd" ><br>
			
			<input type="checkbox" name="remember" value="true"> 아이디 저장<br>
			<input type="submit" value="로그인"><br>
		</fieldset>
	</form>
</body>
</html>
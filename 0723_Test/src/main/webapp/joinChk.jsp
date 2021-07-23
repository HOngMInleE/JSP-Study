<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="join" class="Test.JavaBean"></jsp:useBean>
<jsp:setProperty name="join" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 클릭시 화면</title>
</head>
<style>
	table {
		text-align: center;
	}
</style>
<body>
	<table>
		<tr>
			<td><b> 아이디 : </b></td>
			<td> <jsp:getProperty property="id" name="join"/> </td>
		</tr>
		<tr>
			<td><b> 비밀번호 : </b></td>
			<td> <jsp:getProperty property="password" name="join"/> </td>
		</tr>
		<tr>
			<td><b> 이름 : </b></td>
			<td> <jsp:getProperty property="name" name="join"/> </td>
		</tr>
		<tr>
			<td><b> 성별 : </b></td>
			<td> 
				<jsp:getProperty property="gender" name="join"/>
			</td>
		</tr>
		<tr>
			<td><b> 나이 : </b></td>
			<td> <jsp:getProperty property="age" name="join"/> </td>
		</tr>
		<tr>
			<td><b> 이메일주소 : </b></td>
			<td> 
				<jsp:getProperty property="email" name="join"/>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>
</head>
<style>
	form {
		text-align: center;
	}
</style>
<body>
	<fieldset style='width: 500px; margin:0 100px;'>
	<h1>회원 정보 입력</h1>
		<form method="post" action="joinChk.jsp">
			<table>
				<tr>
					<td> 아이디 : </td>
					<td> <input type="text" name="id"> </td>
				</tr>
				<tr>
					<td> 비밀번호 : </td>
					<td> <input type="password" name="password"> </td>
				</tr>
				<tr>
					<td> 이름 : </td>
					<td> <input type="text" name="name"> </td>
				</tr>
				<tr>
					<td> 성별 : </td>
					<td> 
						<input type="radio" name="gender" checked="checked" value="1">남
						<input type="radio" name="gender" value="2">여
					</td>
				</tr>
				<tr>
					<td> 나이 : </td>
					<td> <input type="number" name="age"> </td>
				</tr>
				<tr>
					<td> 이메일주소 : </td>
					<td> 
						<input type="email" name="email">
						<input type="email" name="email">
					</td>
				</tr>
			</table>
			<input type="submit" value="가입"> 
			<input type="reset" value="다시 작성">
		</form>
	</fieldset>
</body>
</html>
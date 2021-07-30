<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join_Form</title>
<style>
</style>
<script type="text/javascript" src="member.js">
</script>
</head>
<body>
	<form name="frm" >
		<table border="1" align="center" width="400px">
			<tr>
				<td colspan="2" align="center"><h2> 회원가입 페이지 </h2></td>
			</tr>
			<tr>
				<td>아이디 :	</td>
				<td> <input type="text" name="id"> </td>
			</tr>
			<tr>
				<td>비밀번호 :		</td>
				<td> <input type="password" name="password"> </td>
			</tr>
			<tr>
				<td>이름 :	</td>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<td>나이 :	</td>
				<td> <input type="text" name="age"> </td>
			</tr>
			<tr>
				<td>성별:	</td>
				<td> 
					<input type="radio" name="gender" value="남" checked="checked">남자
					<input type="radio" name="gender" value="여">여자
				</td>
			</tr>
			<tr>
				<td>이메일 주소 :	</td>
				<td> <input type="email" name="email"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a onclick="return joinCheck()" href="joinProcess.jsp" >회원가입</a>
					<a href="joinForm.jsp" >다시작성</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
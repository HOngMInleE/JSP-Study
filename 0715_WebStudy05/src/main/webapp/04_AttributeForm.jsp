<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AttrTest Form</title>
</head>
<body>
	<form action="04_AttributeTest01.jsp" method="post">
		<table>
			<tr>
				<td colspan="2"><b>Application영역에 저장</b></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>
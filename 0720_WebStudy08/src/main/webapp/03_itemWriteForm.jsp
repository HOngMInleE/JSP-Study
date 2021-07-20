<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보를 입력 받는 JSP페이지</title>
</head>
<style type="text/css">
#rowstyle {
	font-weight: bold;
	background-color: #e5e5e5;
	text-align: center;
}
</style>
<body>
	<h2>정보 입력 폼</h2>
	<form method="post" action="03_itemWrite.jsp">
		<table>
			<tr>
				<td id="rowstyle">상품명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="price"></td>
			</tr>
			<tr>
				<td>설명</td>
				<td>
					<textarea rows="10" cols="80" name="description"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="전송"> 
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
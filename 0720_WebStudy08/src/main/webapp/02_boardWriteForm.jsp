<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 정보를 입력 받는 JSP페이지</title>
<style>
		td { 
			border:0; 
		}
		
		#rowstyle {
			font-weight: bold;
			background-color: #e5e5e5;
			text-align: center;
		}
</style>
</head>
<body>
	<h2 style="text-align: center;"> 게시판 글쓰기 </h2>
	<form method="post" action="02_boardWrite.jsp">
		<table border="1">
			<tr>
				<td id="rowstyle"> 작성자 </td>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<td id="rowstyle"> 비밀번호 </td>
				<td> <input type="password" name="pass"> (게시물 수정 삭제시 필요합니다.) </td> 
			</tr>
			<tr>
				<td id="rowstyle"> 이메일 </td>
				<td> <input type="email" name="email" size="50"> </td>
			</tr>
			<tr>
				<td id="rowstyle"> 글 제목 </td>
				<td> <input type="text" name="title" size="80"> </td>
			</tr>
			<tr>
				<td id="rowstyle" geight="100px"> 글 내용 </td>
				<td> <textarea rows="20" cols="80" name="content"></textarea> </td>
			</tr>
		</table>
		<input type="submit" value="등록" >
		<input type="reset" value="다시 작성" >
	</form>
</body>
</html>
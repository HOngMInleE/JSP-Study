<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	h1 {
		text-align: center;
	}
</style>
</head>
<body>
	<h1> MVC 게시판 </h1>
	<table>
		<tr>
			<td> 글쓴이 </td> 
			<td> <input type="text" name="name"> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pass"> </td>
		</tr>
		<tr>
			<td> 제목 </td> 
			<td> <input type="text" name="subject"> </td>
		</tr>
		<tr>
		 	<td> 내 용 </td>
		 	<td>
		 		<textarea rows="15" cols="50" name="content"></textarea> 
			</td>
		</tr>
		<tr>
			<td> 파일 첨부 </td>
			<td> <input type="file" name="file" value="파일 선택"></td>
		</tr>
	</table>
	[<a href="BoardAddAction.bo">등록</a>]
	[<a href="BoardList.bo">뒤로</a>]
</body>
</html>
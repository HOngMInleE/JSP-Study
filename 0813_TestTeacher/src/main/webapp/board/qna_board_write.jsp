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
<script type="text/javascript">
	function submit() {
		document.frm.submit();		
	}
</script>
</head>
<body>
	<h1> MVC 게시판 </h1>
	<form action="BoardAddAction.bo" method="post" enctype="multipart/form-data" name="frm">
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
				<td> <input type="file" name="file" ></td>
			</tr>
			<tr>
				<td colspan="2">
					[<a href="#" onclick="return submit()">등록</a>]
					[<a href="#" onclick="history.back()">뒤로</a>]
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
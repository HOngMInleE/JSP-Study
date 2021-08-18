<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addboard(){
		boardform.submit();
	}
</script>
</head>
<body>
	<form action="./BoardAddAction.bo" method="post" enctype="multipart/form-data" name="boardform">
		<table>
			<tr align ="center" valign = "middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td height="16">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<input name="board_name" type="text" size="10">
				</td>
			</tr>
			<tr>
				<td height="16">
					<div align="center">비밀번호</div>
				</td>
				<td>
					<input name="board_pass" type="password" size="10">
				</td>
			</tr>
			<tr>
				<td height="16">
					<div align="center">제 목</div>
				</td>
				<td>
					<input name="board_subject" type="text" size="50">
				</td>
			</tr>
			<tr>
				<td height="16">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="borad_content" cols="65" rows="15"></textarea>
				</td>
			</tr>
			<tr>
				<td height="16">
					<div align="center">파일첨부</div>
				</td>
				<td>
					<input name="board_file" type="file">
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr>
				<td colspan="2"> &nbsp;</td>
			</tr>
			<tr align ="center" valign="middle">
				<td colspan="5">
					<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
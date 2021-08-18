<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.BoardBean"%>
<%
	BoardBean board = (BoardBean)request.getAttribute("boardData");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr, td, div {
		text-align: center;
	}
</style>
</head>
<body>
	<table width="90%" cellpadding="0" cellspacing="0">
		<tr valign = "middle">
			<td colspan="5">MVC 게시판</td>
		</tr>
		<tr>
			<td height="16">
				<div>제 목 &nbsp;&nbsp;&nbsp;</div>
			</td>
			<td height="16">
				<div><%= board.getSubject()%></div>
			</td>
		</tr>
		<tr bgcolor="cccccc">
			<td colspan="2" style="height:1px;">
			</td>
		</tr>
		<tr>
			<td height="250">
				<div>내 용</div>
			</td>
			<td height="250">
				<div><%=board.getContent() %></div>
		</tr>
		<tr>
			<td height="16">
				<div> 첨부 파일 </div>
			</td>
			<td height="16">
				<%= board.getFile() %>
			</td>
		</tr>
		<tr bgcolor="cccccc">
			<td colspan="2" style="height:1px;">
			</td>
		</tr>
		<tr>
			<td colspan="2"> &nbsp;</td>
		</tr>
		<tr valign="middle">
			<td colspan="5">
				<a href="./BoardList.bo">[등록]</a>
			</td>
		</tr>
	</table>
</body>
</html>
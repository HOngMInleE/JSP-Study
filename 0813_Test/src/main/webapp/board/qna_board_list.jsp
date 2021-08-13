<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="net.board.db.BoardBean" %>
        <%@ page import="java.util.List" %>
           <%@ page import="java.util.ArrayList" %>
<%
	ArrayList<BoardBean> boardList = (ArrayList<BoardBean>) request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style type="text/css">
	th {
		
	}
</style>
</head>
<body>
	<h1> MVC 게시판 </h1>
	<% 
	if (boardList == null) {
	%>
		<p>등록된 글이 없습니다.</p>
		<br>
		<a href="BoardWrite.bo">[글쓰기]</a>
	<% 
	} else {
	%>
	<table>
		<tr>
			<th>글 개수 : </th>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>	
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>	
	<%
	}
	%>
	
</body>
</html>
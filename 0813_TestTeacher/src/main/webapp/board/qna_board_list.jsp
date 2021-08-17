<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.BoardBean" %>
<%@ page import="java.util.*" %>
<%
	List<BoardBean> boardList = (List<BoardBean>)request.getAttribute("boardList");
	int boardCount = ((Integer)request.getAttribute("boardCount")).intValue();
							// intValue : 문자열을 정수로 반환
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style type="text/css">
	td, th {
		text-align: center;
	}
</style>
</head>
<body>
	<table width=60% cellpadding="0" cellspacing="0">
	<%
		if (boardCount > 0) {
		// true
	%>
			<tr align="center" valign="middle">
				<td colspan="4"><h2> MVC 게시판 </h2></td>
				<td align="right">
					글의 개수 : <%= boardCount %>
				</td>
			<tr>
				<th width="8%" height="26">번호</th>
				<th width="50%" height="26">제목</th>
				<th width="14%" height="26">작성자</th>
				<th width="17%" height="26">날짜</th>
				<th width="11%" height="26">조회수</th>
			</tr>
	<%
			for (int i=0; i<boardList.size();i++) {
				BoardBean bVo = boardList.get(i);
	%>
				<tr>
					<td width="8%" height="26"><%=bVo.getNum()%></td>
					<td width="50%" height="26"><%=bVo.getSubject() %></td>
					<td width="14%" height="26"><%=bVo.getName()%></td>
					<td width="17%" height="26"><%=bVo.getDate()%></td>
					<td width="11%" height="26"><%=bVo.getReadcount()%></td>
				</tr>
	<%
			}//for
	%>
	<%
		}else {
		// false
	%>
			<tr align="center" valign="middle">
				<td colspan="4"><h2> MVC 게시판 </h2></td>
				<td>
					등록된 글이 없습니다.
				</td>
			</tr>
	<%
		}//else
	%>				
		<tr align="right">
			<td colspan="5">
				<a href="./BoardWrite.bo">글쓰기</a>
			</td>
		</tr>
	</table>	
</body>
</html>
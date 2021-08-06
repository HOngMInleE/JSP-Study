<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1> Homie's 영화 리스트 </h1>
		<table>
			<tr>
				<td colspan="6" style="border:white; text-align: right">
					<a href="movieWrite">영화 기록</a>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<th>감독</th>
				<th>배우</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr>
				<c:forEach var="movie" items="movieList">
					<c:choose>
						
					</c:choose>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>
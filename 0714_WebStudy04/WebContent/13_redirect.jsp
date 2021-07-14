<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로드북 홈페이지로 이동
<%
	response.sendRedirect("http://www.roadbook.co.kr");
	// 출력내용은 보일 사이도 없이 이동.  출력은 의미가 없어짐.
%> 
</body>
</html>
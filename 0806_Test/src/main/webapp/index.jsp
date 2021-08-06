<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<c:if test="${empty loginUser}">
		<a href="loginForm.html">로그인</a>
	</c:if>
	<c:if test="${!empty loginUser }">
		${loginUser.id }님 로그인 하셨습니다.
		<br>
		<a href="logout">로그아웃</a>
	</c:if>
</body>
</html>
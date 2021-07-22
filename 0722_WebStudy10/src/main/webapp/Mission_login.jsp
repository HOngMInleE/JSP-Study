<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.userId } 님
	<c:choose>
		<c:when test="${param.admin == 1 }">사용자</c:when>
		<c:otherwise>관리자</c:otherwise>
	</c:choose>로 로그인 하셨습니다.
</body>
</html>
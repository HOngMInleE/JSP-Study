<%@page import="mission.MemberBean"%>
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

	<h2>JSTL을 적용한 페이지</h2>
	
	<c:set var="member" value="<%=new mission.MemberBean() %>"></c:set>
	
	<c:set target="${member }" property="name" value="${param.name }"></c:set>
	<c:set target="${member }" property="userId" value="${param.userId }"></c:set>
	<c:set target="${member }" property="userPwd" value="${param.userPwd }"></c:set>
	<c:set target="${member }" property="email" value="${param.email }"></c:set>
	<c:set target="${member }" property="phone" value="${param.phone }"></c:set>
	<c:set target="${member }" property="admin" value="${param.admin }"></c:set>
	
	
	name = ${member.getName() } <br>
	 
	userId = ${member.userId } <br>
	userPwd = ${member.userPwd } <br>
	email = ${member.email } <br>
	phone = ${member.phone } <br>
	admin = 
	<c:choose>
		<c:when test="${member.admin == 0 }"> 일반회원</c:when>
		<c:otherwise> 관리자</c:otherwise>
	</c:choose>

</body>
</html>
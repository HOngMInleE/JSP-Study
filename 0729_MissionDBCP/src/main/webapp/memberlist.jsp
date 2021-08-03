<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
</head>
<body>
	<table align="center">
		<tr>
			<td colspan="6">
				<h3>사원 정보</h3>
				<div style="color:red">${message }</div>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>권한</td>
			<td>성별</td>
			<td>전화번호</td>
		</tr>
		<c:forEach var="emp" items="${memberlist }"> <!--  request에 저장된 memberlist를 변수에 저장. -->
			<tr>
				<td>${emp.id }</td>
				<td>${emp.pass }</td>
				<td>${emp.name }</td>
				<td>
					<c:choose>
							<c:when test="${emp.lev=='A'}">운영자</c:when>
							<c:otherwise>일반회원</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
							<c:when test="${emp.gender=='1'}">남자</c:when>
							<c:when test="${emp.gender=='2'}">여자</c:when>
					</c:choose>
				</td>
				<td>${emp.phone }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="center">
				<input type="button" value="메인 페이지로 이동" onclick="location.href='main.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>
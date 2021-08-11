<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees_View</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1> 사원 상세 정보 </h1>
		<table>
			<tr>
				<th>아이디</th>	<td> ${empEach.id } </td>
			</tr>
			<tr>
				<th>비밀번호</th>	<td> ${empEach.pass} </td>
			</tr>
			<tr>
				<th>이름</th>	<td> ${empEach.name} </td>
			</tr>
			<tr>
				<th>권한</th>
				<td>
					<c:choose>
						<c:when test="${empEach.lev == 'A'}">
							운영자
						</c:when>
						<c:when test="${empEach.lev == 'B'}">
							일반회원
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<c:choose>
						<c:when test="${empEach.gender == '1'}">
							남자
						</c:when>
						<c:when test="${empEach.gender == '2'}">
							여자
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="3"> <pre> ${empEach.phone} </pre> </td>
			</tr>
			<tr>
				<th>가입일</th>	<td> <fmt:formatDate value="${empEach.enter}"/> </td>
			</tr>
		</table>
		<br><br>
		<input type="button" value="수정" 
		onclick="location.href='EmpServlet?command=emp_update_form&id=${empEach.id}'">
		<input type="button" value="삭제" 
		onclick="location.href='EmpServlet?command=emp_delete&id=${empEach.id}'">
		<input type="button" value="목록" onclick="location.href='EmpServlet?command=emp_list'">
		<input type="button" value="등록" onclick="location.href='EmpServlet?command=emp_register_form'">
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees_List</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css"> 
</head>
<body>
	<div id="wrap" align="center">
		<h1> 사원 리스트 </h1>
		<table class="list" >
			<tr>
				<td colspan="6" style="border: white; text-align: right">
					<a href="EmpServlet?command=emp_register_form">사원 등록</a>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>권한</th>
				<th>성별</th>
				<th>등록일</th>
				<th>전화번호</th>
			</tr>
			<c:forEach var="empList" items="${empList}">
				<tr class="record">
					<td>${empList.id}</td>
					<td>
						<a href="EmpServlet?command=emp_view_form&id=${empList.id}">
							${empList.name}
						</a>
					</td>
					<td>
						<c:choose>
							<c:when test="${empList.lev == 'A'}">
								운영자
							</c:when>
							<c:when test="${empList.lev == 'B'}">
								일반회원
							</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${empList.gender == '1'}">
								남자
							</c:when>
							<c:when test="${empList.gender == '2'}">
								여자
							</c:when>
						</c:choose>
					</td>
					<td>
						<fmt:formatDate value="${empList.enter}"></fmt:formatDate>
					</td>
					<td>${empList.phone}</td>
				</tr>
			</c:forEach>
		</table>	
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees_Update</title>
<link rel="stylesheet" href="css/shopping.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1> 사원 정보 수정 </h1>
		<form action="EmpServlet" method="post" name="frm">
			<input type="hidden" name="command" value="emp_update">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" value="${empEach.id}">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pass" value="${empEach.pass}">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" value="${empEach.name}">
					</td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<c:choose>
							<c:when test="${empEach.lev == 'A'}">
								<select name="lev">
									<option value="A" selected="selected"> 운영자 </option>
									<option value="B"> 일반회원 </option>
								</select>
							</c:when>
							<c:when test="${empEach.lev == 'B'}">
								<select name="lev">
									<option value="A"> 운영자 </option>
									<option value="B" selected="selected"> 일반회원 </option>
								</select>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<c:choose>
							<c:when test="${empEach.gender == '1'}">
								<select name="gender">
									<option value="1" selected="selected"> 남자 </option>
									<option value="2"> 여자 </option>
								</select>		
							</c:when>
							<c:when test="${empEach.gender == '2'}">
								<select name="gender">
									<option value="1"> 남자 </option>
									<option value="2" selected="selected"> 여자 </option>
								</select>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="tel" name="phone" value="${empEach.phone}">
					</td>
				</tr>
			</table>
			<br><br>
			<input type="submit" value="등록">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록" onclick="location.href='EmpServlet?command=emp_list'">
		</form>
	</div>
	
</body>
</html>
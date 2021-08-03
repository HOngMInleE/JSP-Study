<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">
	a {
		text-decoration: none;
	}
	
	td {
		border: 1px solid black;
		width: 200px;
		text-align: center;
	}
	
	#lev {
		width: 300px;
	}
	
	.login:hover {
		background-color: pink;
	}
	
	.red {
		color: red;
	}
</style>
</head>
<body>
	<table align="center">
		<tr>
			<!-- 처음 실행하는 로그인 화면 / login.do-->
			<c:if test="${empty loginUser }">
				<td></td>
				<td></td>
				<td class="login">
					<a name="login" href="login.do">로그인</a>
				</td>
				<td id="lev">
					사원 등록<br>
					<span class="red">(관리자로 로그인 후 사용 가능)</span></td>
				<td id="lev">
					회원 목록<br>
					<span class="red">(관리자로 로그인 후 사용 가능)</span></td>
				<td>
					마이페이지<br>
					<span class="red">(로그인 후 사용 가능)</span>
				</td>
			</c:if>
			
			<!-- 관리자 / 일반 회원의 로그인 화면  -->
			<c:if test="${!empty loginUser }">
				<td>${loginUser.name}님 반갑습니다.</td>
				<td>레벨 : ${loginUser.lev}</td>
				<td class="login"><a href="logout.do">로그아웃</a></td>
				<c:choose>
					<c:when test="${result == 2}">		<!-- 2: lev=A(관리자) -->
						<td class="login">
							<a href="custom.do">사원 등록</a>
						</td>
					</c:when>
					<c:when test="${result == 3}">		<!-- 3: lev=B(일반회원) -->
						<td  id="lev">
							사원 등록<br>
							<span class="red" >(관리자로 로그인 후 사용 가능)</span>
						</td>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result == 2}">		
						<td class="login">
							<a href="member.do">회원 목록</a>
						</td>
					</c:when>
					<c:when test="${result == 3}">		
						<td  id="lev">
							회원 목록<br>
							<span class="red" >(관리자로 로그인 후 사용 가능)</span>
						</td>
					</c:when>
				</c:choose>
				<td class="login">
					<a href="mypage.do">마이페이지</a>
				</td>
			</c:if>
		</tr>
	</table>
</body>
</html>
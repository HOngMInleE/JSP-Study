<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<% // 해당 유저의 쿠키 삭제
	Cookie cookie = new Cookie("userName","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<script type="text/javascript">
	alert("로그 아웃 되었습니다.");	
	location.href="Mission_loginForm.jsp";
</script>
</body>
</html>
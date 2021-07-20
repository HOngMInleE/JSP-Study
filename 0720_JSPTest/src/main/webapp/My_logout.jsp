<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Test logout</title>
</head>
<body>
<% 
	String remember = request.getParameter("remember");
	String id = request.getParameter("id");
	
	//if (remember.equals("true")) {  // checkbox.true
		//Cookie r = new Cookie("userId",id);
		//r.setMaxAge(60*60);
		//response.addCookie(r);
	//} else 	
		if (remember == null) {
		Cookie cookie = new Cookie("userName","");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}	
%>
<script type="text/javascript">
	alert("로그 아웃 되었습니다.");	
	location.href="loginForm.jsp";
</script>
</body>
</html>
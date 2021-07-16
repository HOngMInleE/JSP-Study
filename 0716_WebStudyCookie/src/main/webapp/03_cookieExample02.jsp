<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String language = request.getParameter("language");

	Cookie cookie = new Cookie("language", language);
	cookie.setMaxAge(60*60);
	response.addCookie(cookie);
%>
<script>
	location.href="03_cookieMain.jsp";
</script>
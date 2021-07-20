<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
String id = "pinksung";
String pwd = "1234";
String name = "성윤정";
String remember = request.getParameter("remember");

if (id.equals(request.getParameter("id")) && 
		pwd.equals(request.getParameter("pwd")) ) {
	Cookie c = new Cookie("userName", URLEncoder.encode(name,"UTF-8"));
	
	c.setMaxAge(60*60);
	
	response.addCookie(c);


%>

	<h2> 성공적으로 로그인하셨습니다. </h2>
	<p> <a href="main.jsp"> 메인페이지로 가기 </a>
<%
} else {
%>
	<h2> 로그인에 실패했습니다. </h2>
	<p> <a href="loginForm.jsp"> 로그인페이지로 가기 </a>	
<%
}
%>	
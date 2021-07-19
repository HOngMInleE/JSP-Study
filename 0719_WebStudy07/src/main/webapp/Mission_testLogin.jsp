<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
// 실제로는 DB에서 가져와야하는 값
String id = "pinksung";
String pwd = "1234";
String name = "성윤정";

if (id.equals(request.getParameter("id")) && 
		pwd.equals(request.getParameter("pwd")) ) {
// id, pwd가 같을 때만 쿠키 생성하고 client에 추가
	// 1. Cookie 객체 생성 (userName에 성윤정을 맵핑)
	Cookie c = new Cookie("userName", URLEncoder.encode(name,"UTF-8"));
	// 2. 속성 부여 
	c.setMaxAge(60*60);
	// 3. 클라이언트에 전송
	response.addCookie(c);
%>

	<h2> 성공적으로 로그인하셨습니다. </h2>
	<p> <a href="Mission_main.jsp"> 들어가기 </a>
<%
} else {
%>
	<h2> 로그인에 실패했습니다. </h2>
	<p> <a href="Mission_loginForm.jsp"> 되돌아가기 </a>	
<%
}
%>	
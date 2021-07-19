<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "pinksung";
	String pwd = "1234";
	String name = "성윤정";
	
	if (id.equals(request.getParameter("id")) && 
			pwd.equals(request.getParameter("pwd")) ) {
		session.setAttribute("loginUser", name);
		response.sendRedirect("03_main.jsp");
	} else {
		out.println("<script>");
		out.println("alert('회원 정보가 일치하지 않습니다.')");
		out.println("location.href='03_loginForm.jsp'");
		out.println("</script>");
	}
			
%>
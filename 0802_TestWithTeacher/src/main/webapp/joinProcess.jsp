<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinProcess</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:/comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/oracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		
		int result = pstmt.executeUpdate(); // return 1 : 성공 // 0 : 실패
		
		if (result != 0) { // 성공
			out.println("<script>");
			out.println("location.href='member_list.jsp'");
			out.println("</script>");
		}else{ // 실패시
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		}
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}//finally end
%>
</body>
</html>
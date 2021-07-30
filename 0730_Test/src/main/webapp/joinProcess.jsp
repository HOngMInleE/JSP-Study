<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import = "java.lang.NumberFormatException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Context initContext = new InitialContext();
	Context envContext = (Context) initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource) envContext.lookup("jdbc/oracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = null;
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String email = request.getParameter("idemail");
	
	String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
	
	try{
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setInt(4, Integer.parseInt(age));
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		
		pstmt.executeUpdate();
		out.print("성공");
	}catch (NumberFormatException e){
		e.printStackTrace();
		out.print("실패");
	}finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}//finally end
	
%>

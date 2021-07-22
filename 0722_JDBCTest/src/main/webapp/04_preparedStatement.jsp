<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	String sql = "insert into student (num,name) values (?,'makima')";
	PreparedStatement pstmt = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/oracleDB");
		conn = ds.getConnection();
	
		pstmt = conn.prepareStatement(sql);
		
		for (int i = 8; i <= 11; i++) {
			pstmt.setInt(1, i);
			int result = pstmt.executeUpdate();
			
			if (result != 0) {
				out.print("<h3>" + i + "레코드 삽입 성공</h3>");
			}
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			
		}catch(Exception e) {
			
		} // catch end
	} //finally end
%>
</body>
</html>
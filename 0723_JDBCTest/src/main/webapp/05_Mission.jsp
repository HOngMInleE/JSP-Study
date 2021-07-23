<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSetMetaData rsmd = null;
	
	String sql = "select * from emp select * from dept select * from salgrade"; 

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/oracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();

			
			
			
	}catch (Exception e) {
		out.println("<h3>데이터 조회에 실패하였습니다. </h3>");
		e.printStackTrace();
	}finally {
		try {
			rs.close();
			pstmt.close();
			conn.close(); 
		}catch(Exception e) {
			e.printStackTrace();
		} // catch end
	} //finally end
%>
</body>
</html>
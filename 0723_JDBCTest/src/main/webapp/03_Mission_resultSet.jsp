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
	String sql = "select * from student";
	ResultSetMetaData rsmd = null;

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/oracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		
		out.println("<table border=1 style='width:300px'>");
			out.println("<tr>");
			
			for (int i=1; i<=rsmd.getColumnCount(); i++) {
				out.println("<td>" + rsmd.getColumnName(i) + "</td>");
			}
			
			out.println("</tr>");
			
			while (rs.next()) { 
				out.println("<tr><td>" + rs.getInt(1) + "</td><td> " + rs.getString(2) + "</td></tr>");
			}
		out.println("</table>");
		
	}catch (Exception e) {
		out.println("<h3>데이터 가져오기 실패</h3>");
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
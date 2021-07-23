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
		
		// getColumnCount(): 전체 컬럼의 개수, getColumnName(): 각각이름, getColumnTypeName(): 컬럼의 타입
		
		out.println("컬럼 수" + rsmd.getColumnCount() + "<br>");
		
		for (int i=1; i<=rsmd.getColumnCount(); i++) {
			out.println(i + "번째 컬럼명 : " + rsmd.getColumnName(i)); // getColumnName(i) : i번째 컬럼보여줌.
			out.println(i + "번째 컬럼타입 : " + rsmd.getColumnTypeName(i) + "<br>");
		}
		
		out.println("<h3>num &nbsp; name</h3>");
		
		while (rs.next()) { 
			out.println("<h3>" + rs.getInt(1) + ", " + rs.getString(2) + "</h3>");
			
		}
		
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
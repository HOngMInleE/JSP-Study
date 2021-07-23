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
	String sql = "insert into student (num,name) values (13,'홍길동')"; 
	String sql2 = "select * from student where num = 12";

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/oracleDB");
		conn = ds.getConnection();
		
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery();
		
		if (!rs.next()) {
			conn.rollback(); // 12 data가 없기때문에 실행이되면 안됨.
			out.println("<h3>번호가 일치하지 않아서 롤백처리했습니다.</h3>");
		} else {
			conn.commit(); // 12번에 data가 있다면 실행,커밋
			out.println("<h3>데이터 삽입 완료 커밋처리했습니다.</h3>");
		}
		
		conn.setAutoCommit(true); // Connection 객체가 commit 단위.

	}catch (Exception e) {
		out.println("<h3>데이터 삽입에 실패하였습니다. </h3>");
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
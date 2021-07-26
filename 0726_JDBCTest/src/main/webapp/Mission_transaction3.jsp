<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
// DB 연결시 필요한 객체정보들
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSetMetaData rsmd = null;
	
	String sql = request.getParameter("sql");
	
	try {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
	// insert into 넣기
		if (sql.startsWith("select")) {
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			
			out.println("<table border = '1'>");
				out.println("<tr>");
					 for (int i=1; i<=rsmd.getColumnCount();i++) {
						 out.println("<td>");
						 out.println(rsmd.getColumnName(i));
						 out.println("</td>");
					 }
				out.println("</tr>");
				
				while (rs.next()) {
					out.println("<tr>");
					
					for (int i=1; i<=rsmd.getColumnCount();i++) {
						out.println("<td>");
						
							if (rsmd.getColumnTypeName(i) == "NUMBER") {
								out.println(rs.getInt(i));
							}else if (rsmd.getColumnTypeName(i) == "VARCHAR2") {
								out.println(rs.getString(i));
							}else { // 날짜정보 // DB주된 타입 날짜 숫자 문자.
								out.println(rs.getDate(i));
							} //if 			
							
						out.println("</td>");						
					} //for 
					
					out.println("</tr>");
				} //while  
					
			out.println("</table>");
		} // select if 
		else if (sql.startsWith("insert")) {
			
			int result = pstmt.executeUpdate();
			if (result != 0) {
				out.println("데이터 삽입 성공");
			}
			
		} // insert if 
		else if(sql.startsWith("update")){
			int result = pstmt.executeUpdate();
			if(result != 0){
				out.println("데이터 수정 성공");
			}
		}//update if
		else if(sql.startsWith("delete")){
			int result = pstmt.executeUpdate();
			if(result != 0){
				out.println("데이터 삭제 성공");
			}
		}//delete if
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) {
				rs.close();
			}
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();			
		}
		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SQL문 실행 </title>
</head>
<body>

</body>
</html>
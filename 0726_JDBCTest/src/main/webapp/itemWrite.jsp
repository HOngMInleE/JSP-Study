<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="item.itemMember" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
	String sql = "select * from item";
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String uid = "scott";
		String pass = "TIGER";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, pass);
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		out.println("<table border=1>");
		
		while (rs.next()) {
			out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getInt(2) + "</td>");
				out.println("<td>" + rs.getString(3) + "</td>");
			out.println("</tr>");
		}
		
		out.println("</table>");		
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}//finally end
%>
<a href="itemWrite.jsp">결과보기</a>
</body>
</html>
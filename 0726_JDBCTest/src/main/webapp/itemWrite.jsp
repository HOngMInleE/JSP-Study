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
	
	itemMember ib = new itemMember();
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String uid = "scott";
		String pass = "TIGER";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, pass);
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();

		
// bean 활용 방식

		out.println("<table border=1>");
		while(rs.next()) {
			ib.setName(rs.getString(1));
			ib.setPrice(String.valueOf(rs.getInt(2))); // 숫자를 문자로 바꿔서 사용
			ib.setDescription(rs.getString(3));
			out.println("<tr>");
				out.println("<td>" + ib.getName() + "</td>");
				out.println("<td>" + ib.getPrice() + "</td>");
				out.println("<td>" + ib.getDescription() + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");	
		
//		out.println("<table border=1>");
//		while (rs.next()) {
//			out.println("<tr>");
//				out.println("<td>" + rs.getString(1) + "</td>");
//				out.println("<td>" + rs.getInt(2) + "</td>");
//				out.println("<td>" + rs.getString(3) + "</td>");
//			out.println("</tr>");
//		}
//		out.println("</table>");		
		
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
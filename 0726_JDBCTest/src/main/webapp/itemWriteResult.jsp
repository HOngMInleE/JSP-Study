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
	String sql = "insert into item values(?,?,?)";
	itemMember ib = new itemMember();
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String uid = "scott";
		String pass = "TIGER";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, pass);
		pstmt = conn.prepareStatement(sql);
		
		//String name = request.getParameter("name");
		//String price = request.getParameter("price");
		//String description = request.getParameter("description");
		
		
		//pstmt.setString(1,name);
		//pstmt.setInt(2, Integer.parseInt(price));
		//pstmt.setString(3, description);
		
		ib.setName(request.getParameter("name"));
		ib.setPrice(request.getParameter("price"));
		ib.setDescription(request.getParameter("description"));
		
		pstmt.setString(1, ib.getName());
		pstmt.setInt(2, Integer.parseInt(ib.getPrice()));
		pstmt.setString(3, ib.getDescription());
		
		pstmt.executeUpdate();
		
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String info_id = request.getParameter("id");

	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:/comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/oracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
%>
			<table border="1" width="300">
				<tr>
					<td>아이디 : </td>
					<td><%=rs.getString("id") %></td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td><%=rs.getString("password") %></td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td><%=rs.getString("name") %></td>
				</tr>
				<tr>
					<td>나이 : </td>
					<td><%=rs.getInt("age") %></td>
				</tr>
				<tr>
					<td>성별 : </td>
					<td><%=rs.getString("gender") %></td>
				</tr>
				<tr>
					<td>이메일 주소 : </td>
					<td><%=rs.getString("email") %></td>
				</tr>
				<tr>
					<td colspan="2"><a href="member_list.jsp">리스트로 돌아가기</a></td>
				</tr>
			</table>
<%		
		} //if end
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}catch (Exception e) {
			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_info</title>
</head>
<body>
</body>
</html>
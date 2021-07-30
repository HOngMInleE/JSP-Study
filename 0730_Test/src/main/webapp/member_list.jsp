<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott";
	String pass = "TIGER";
	String sql = "select * from member";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member_List</title>
<style type="text/css">
	td {
		text-align: center;
	}
</style>
</head>
<body>
	<table border="1" align="center" width="400px">
		<tr>
			<td colspan="5" align="center">회원 목록</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
		</tr>
			<%
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, pass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				out.print("<tr>");
					out.print("<td><a>" + rs.getString("id") + "</a></td>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getInt("age") + "</td>");
					out.print("<td>" + rs.getString("gender") + "</td>");
					out.print("<td>" + rs.getString("email") + "</td>");
				out.print("</tr>");
			}//while end
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}//finally end
		%>
	</table>
</body>
</html>
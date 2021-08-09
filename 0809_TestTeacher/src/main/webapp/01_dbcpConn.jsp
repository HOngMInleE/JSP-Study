<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>

<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동</title>
</head>
<body>
	<h4> DB 연동 </h4>
	<%
	Context initContext = new InitialContext();
	Context envContext = (Context) initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");
	
	// 위와 같음
	// DataSource ds = (Datasource) initContext.lookup("java:/comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	out.println("DBCP 연동 성공"); 
	
	
	%>
</body>
</html>
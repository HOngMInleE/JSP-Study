<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AttributeTest03</title>
</head>
<body>
	<!--  Application영역에서 데이터 불러오기 // browser 껏다가 재실행해도 데이터가 남아있음 
				// Server(Tomcat Server) 껐다가 재실행하니 데이터 사라짐 // null값 나옴.-->
	<table>
		<tr>
			<td colspan="2"><b>Application영역에 저장된 내용들</b></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=application.getAttribute("name") %></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=application.getAttribute("id") %></td>
		</tr>
	</table>
	<br><br>
	
	<!--  Session영역에서 데이터 불러오기 // browser 껏다가 재실행하니 데이터가 사라짐.-->
	<table>
	<td colspan="2"><b>Session영역에 저장된 내용들</b></td>
	<% 
		Enumeration e = session.getAttributeNames();
		while (e.hasMoreElements()) {
			String attributeName = (String)e.nextElement();
			String attributeValue = (String)session.getAttribute(attributeName);
								// Object 로 불러왔기때문에 형변환.
		%>
		<tr>
			<td><%=attributeName %></td>
			<td><%=attributeValue %></td>
		</tr>
		<%	
		}
	%>
	
	
	</table>
</body>
</html>
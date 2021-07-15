<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
	// post방식이면 항상 꼭 넣어주어야 함.%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Test</title>
</head>
<body>
	<h1>Request 예제입니다.</h1>
	<table border="1dp" solid="black" width="400">
		<tr>
			<td>이름</td>
			<td><%= request.getParameter("name") %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<% if(request.getParameter("gender").equals("male")) { %> 남자
				 <% } else { %> 여자 <% } %>
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<%
					String[] hobby = request.getParameterValues("hobby");
					
				// 표현식으로 작성
					for (int i=0; i<hobby.length;i++) {
					%>
					<%= hobby[i]%> &nbsp;&nbsp;
					<%}%>
				
				<%
					// for (int i=0; i<hobby.length;i++) {
					//	out.print(hobby[i] + " ");
					// }
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="전송"></td>
		</tr>
</table>
</body>
</html>
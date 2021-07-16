<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String language = "korea";
	String cookie = request.getHeader("Cookie");
	
	if (cookie != null) {
		Cookie[] cookies = request.getCookies();
		
		for (Cookie c : cookies) {
			if (c.getName().equals("language")) {
				language = c.getValue();
			} 
		} // for end
	} // if end
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookieMain</title>
</head>
<body>
	<% if (language.equals("korea")) {
	%>
	<h3>안녕하세요. 이것은 쿠키 예제입니다.</h3>
	<% 
		} else {
	%>
	<h3>Hello. This is Cookie example.</h3>
	<%
		}
	%>	
	
		
	<form action="03_cookieExample02.jsp" method="post">
		<input type="radio" value="korea"  name="language"
			<% 
				if (language.equals("korea"))  {
			%>checked<%
				}%> > 한국어 페이지 보기 
		<input type="radio" value="english" name="language"
			<% 
				if (language.equals("english"))  {
			%>checked<%
				}%> > 영어 페이지 보기
		<input type="submit" value="설정">
	</form>
</body>
</html>
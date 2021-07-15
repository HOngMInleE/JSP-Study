<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String age = request.getParameter("age");
	String name = (String)request.getAttribute("name");
	
	// 02_RedirectResult.jsp 가 주소가 됨.
	// age, name 은 null 이 출력.
		// 이유는 Request 객체가 소멸하기 때문에 저장되어있던 값들도 소멸하게됨.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect Result</title>
</head>
<body>
redirect 방식으로 이동된 페이지<br>
나이 : <%= age %>
이름 : <%= name %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String age = request.getParameter("age");
	String name = (String)request.getAttribute("name");
		// 객체에서 정보를 얻어올 때는 Attribute 사용.
		// setAttribute 로 값이 넘어왔기 때문에 getAttribute 로 값을 받아야한다.
		// Attribute, Object타입으로 넘어오기 때문에 형변환을 해주어야함.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward Result</title>
</head>
<body>
Forward 방식으로 이동된 페이지<br>
나이 : <%= age %>
이름 : <%= name %>
</body>
</html>
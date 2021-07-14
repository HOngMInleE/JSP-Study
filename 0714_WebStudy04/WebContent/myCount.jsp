<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // jsp에서 java코드를 사용하기 위함.
	int count = 0;
	out.print("count : ");	
	out.println(++count); // 1

%>
</body>
</html>
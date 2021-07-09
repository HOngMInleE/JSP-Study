<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="get" action="MethodServlet" > <!--  action : Url 에 나타나는 주소값. -->
	<input type="submit" value = "get방식의 호출" >
		<!-- Url 주소값에 MethodServlet 를 넣으면 get방식으로 호출이 됨.-->
	</form>
	
	<br>
	<a href="http://localhost:8181/0709_WebStudy01/MethodServlet">get방식 호출</a>
	<br>
	<br>
	
	<form method="post" action="MethodServlet">
	<input type="submit" value = "post방식의 호출" >
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attribute Result</title>
</head>
<body>
	pageScope = <%= pageContext.getAttribute("pageScope")%>
	<!--  null값 나옴 // page영역은 불러와지지 않음. -->
	<br>
	requestScope = <%= request.getAttribute("requestScope")%>
	<!--  requestScope // forward방식으로 전송했기때문에 request 영역은 불러와짐. -->
</body>
</html>
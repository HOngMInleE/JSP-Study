<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forTokens var="city" items="seoul.Incheon, Daegu.Busan" delims=",">
		${city } <br>
	</c:forTokens>
	<hr>
	
	<c:forTokens var="city" items="seoul.Incheon, Daegu.Busan" delims=",.">
		${city } <br>
	</c:forTokens>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forForm_Pro</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num")); 
		// String으로 입력받았기에 Int로 타입변환.
%>
<%! 
	public int sum(int x) {
		
		int total = 0;
		for (int i=0; i<=x; i++) {
			total += i;
		}
		return total;
	}
%>

<h2><%= "1부터" + num + "까지 자연수 합 구하기" %></h2>

<%
	for (int i=1; i<num; i++) {
		out.print(i + "+"); // 1+2+3+....9+
	}
	out.print(num + " = " + sum(num)); // 10 = sum(num) 
%>

</body>
</html>
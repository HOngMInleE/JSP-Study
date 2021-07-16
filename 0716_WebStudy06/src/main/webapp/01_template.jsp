<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageFile = request.getParameter("page"); 
								// left파일에 ? 로 page 파라미터가 넘어옴.
	if (pageFile == null) {
		pageFile = "01_newItem";
	}
								
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>
</head>
<body>
	<table width="960px" border="1" align="center">
		<tr>
			<td heigh="43" colspan="3" align="left">
				<jsp:include page="01_top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td width="15%" align="right" valign="top">
				<jsp:include page="01_left.jsp"/>
			</td>
			<td colspan="2" align="center">
				<jsp:include page='<%=pageFile+".jsp"%>' />
			</td>
		</tr>
		<tr>
			<td width="100%" height="40" colspan="3">
				<jsp:include page="01_bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%
	String savePath = "upload";
	int uploadFileSizeLimit = 5 * 1024 * 1024;
	String encType = "UTF-8";
	String uploadFilePath = request.getRealPath("/upload");
	
	String name = "";
	String subject = "";
	String fileName1 = "";
	String fileName2 = "";
	String originFileName1 = "";
	String originFileName2 = "";
	
	try {
		MultipartRequest multi = new MultipartRequest(request,uploadFilePath,
				uploadFileSizeLimit,encType,
				new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames();
		// 개수가 적으니 반복문 사용안함.
		String file1 = (String)files.nextElement(); 
		fileName1 = multi.getFilesystemName(file1);
		originFileName1 = multi.getOriginalFileName(file1);
		
		String file2 = (String)files.nextElement(); 
		fileName2 = multi.getFilesystemName(file2);
		originFileName2 = multi.getOriginalFileName(file2);
		
	}catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileUploadJSP</title>
</head>
<body>
	<form action="03_fileCheck.jsp" name="fileCheck" method="post">
		<input type="hidden" name="name" value=<%=name %>>
		<input type="hidden" name="subject" value=<%=subject %>>
		<input type="hidden" name="fileName1" value=<%=fileName1 %>>
		<input type="hidden" name="fileName2" value=<%=fileName2 %>>
		<input type="hidden" name="originFileName1" value=<%=originFileName1 %>>
		<input type="hidden" name="originFileName2" value=<%=originFileName2 %>>
	</form>
	<a href="#" onclick="javascript:fileCheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>
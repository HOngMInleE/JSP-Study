<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String fileName = request.getParameter("file_name");
	
	String savePath = "upload";
	ServletContext context = getServletContext();
	String DownloadFilePath = context.getRealPath(savePath);
	String FilePath = DownloadFilePath + "\\" + fileName;
	
	byte b[] = new byte[4096]; // 배열 변수
	FileInputStream in = new FileInputStream(FilePath);
	
	String MimeType = getServletContext().getMimeType(FilePath);
	
	if (MimeType == null) {
		MimeType = "aplication/octet-stream";
	}
	
	response.setContentType(MimeType);
	String agent = request.getHeader("User-Agent");
	boolean isBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("TRident") > -1);
	
	if (isBrowser) {
		fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
	}else {
		fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
	}
	
	response.setHeader("Content-Disposition","attachment; filename = " + fileName);
	
// 넘어온 바이트(형식데이터)를 파일형식으로 바꿔 줌.
	ServletOutputStream out2 = response.getOutputStream();
	
	// 데이터 받아주는 과정
	int numRead;
	while ((numRead = in.read(b,0,b.length)) != -1) { // -1: 더이상 받아올 정보가 없다.
		// 받아온 데이터를 output 객체를 통해 out2에 보내줌
		out2.write(b,0,numRead);
	}
	out2.flush();
	out2.close(); // DB와 마찬가지로 Stream관련 메소드들은 close해주어야함.
	in.close();
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file_down</title>
</head>
<body>

</body>
</html>
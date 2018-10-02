<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="MethodServlet" method = "get">
		<input type="submit" value="get방식으로 호출하기"/>
	</form>
	
	<form action="MethodServlet" method = "post">
		<input type="submit" value="post방식으로 호출하기"/>
	</form>
</body>
</html>
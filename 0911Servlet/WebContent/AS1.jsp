<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{background:skyblue}
</style>
</head>
<body>
 	<!--선언문. 메소드,출력문은 못 씀, 전역변수-->
	<%!
		int c = 6;
		int d = 4;
		
	%>
	<!--선언,메소드 가능-->
	<%
		int e = c+d;
	%>
	<%=c%>+<%=d%>=<%=e%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 목록 조회</h2>
<hr>
<%
 	Connection conn;	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url, user, pw;
	url = "jdbc:oracle:thin:@localhost:1521:xe";
	user = "system";
	pw = "1111";
	conn = DriverManager.getConnection(url,user,pw);
%>
<table border ="1" cellspacing="0" width="1000px" align="center">
<colgroup>
	<col width="25%">
	<col width="25%">
	<col width="25%">
	<col width="25%">
</colgroup>
<tr>
	<th>회원아이디</th>
	<th>회원이름</th>
	<th>이메일</th>
	<th>연락처</th>
</tr>
<%
	String id , name, email, tel ,sql;
	sql = "SELECT * FROM sys.custom_01 order by p_id asc";
	ResultSet res = conn.prepareStatement(sql).executeQuery();
	while(res.next()){
		id = res.getString("p_id");
		name = res.getString("c_name");
		email = res.getString("c_email");
		tel = res.getString("c_tel");
%>
	<tr align = "center">
		<td><%= id%></td>
		<td><%= name%></td>
		<td><%= email%></td>
		<td><%= tel%></td>		
	</tr>
<%
	}
%>
</table>
</body>
</html>
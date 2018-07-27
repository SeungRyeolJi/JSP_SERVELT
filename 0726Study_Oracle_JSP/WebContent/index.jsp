<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String user = "system";
	String pw = "1111";//비번
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url,user,pw);
	ResultSet res = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP CRUD TEST</title>
<style>
	a{"text-decoration:none;color:black}
</style>
</head>
<body>
	<%
		//sys와 system 한 사람의 차이점
		sql ="SELECT * FROM sys.comment_list";
		res = conn.prepareStatement(sql).executeQuery();
		String list_idx, list_writer, list_content,list_date,list_link;
		while(res.next()){
				list_idx = res.getString("idx");
				list_writer = res.getString("writer");
				list_content = res.getString("content");
				list_date= res.getString("reg_date");
				//view로 이동할 때 idx값을 넘김
				list_link = "./view.jsp?idx="+list_idx;
				out.println(String.format("<p><a href=\"%s\">%s / %s / %s / %s</b></p>",list_link,list_idx,list_writer,list_content,list_date));
		}
	%>
	<a href="write.jsp">글작성</a>
</body>
</html>
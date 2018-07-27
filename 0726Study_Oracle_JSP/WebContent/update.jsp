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
	
	String action = request.getParameter("action");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String idx= request.getParameter("idx");
	String date ;
	
	if(action != null){
			sql = "UPDATE sys.comment_list SET writer ='%s', content = '%s' where idx = %s";
			sql = String.format(sql,writer,content,idx);
		conn.prepareStatement(sql).executeUpdate();
		out.println("<script>alert('작성완료');location.href='./';</script>");
	} 
	//sys와 system 한 사람의 차이점
	sql ="SELECT * FROM sys.comment_list where idx = "+idx;
	res = conn.prepareStatement(sql).executeQuery();
	res.next();
	writer = res.getString("writer");
			content = res.getString("content");
			date= res.getString("reg_date");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
</head>
<body>
	<form action="" method="post">
		<fieldset><legend>입력</legend>
			<input type="hidden" name="action" value="insert">
			<input type="text" name="writer" placeholder="작성자" value="<%=writer%>">
			<input type="text" name="content" placeholder="내용" value="<%=content %>">
			<button type="submit">전송</button>	
		</fieldset>
	</form>
<p>
	<a href="./">취소</a>
</p>
</body>
</html>
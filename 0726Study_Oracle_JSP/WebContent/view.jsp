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
<title>글 보기</title>
</head>
<body>
	<%
		String idx =request.getParameter("idx"); 
		//sys와 system 한 사람의 차이점
		sql ="SELECT * FROM sys.comment_list where idx = "+idx;
		res = conn.prepareStatement(sql).executeQuery();
		String writer, content, date;
		if(res.next()){
				writer = res.getString("writer");
				content = res.getString("content");
				date= res.getString("reg_date");
	%>
<ul>
	<li>작성자 : <%=writer%></li>
	<li>작성일 : <%=date%></li>
	<li>내용 : <%=content %></li>
	<li>
		<a href="./">취소</a>
		<a href="./update.jsp?idx=<%=idx%>">수정</a>
		<a href="./delete.jsp?idx=<%=idx%>">삭제</a>
	</li>	
</ul>
<%
		}else{
			out.println("조회한 게시물이 없습니다.");
		}
%>
</body>
</html>
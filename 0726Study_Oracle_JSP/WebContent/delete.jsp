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
	

	String idx= request.getParameter("idx");
	sql = "DELETE FROM sys.comment_list where idx = %s";
	//숫자는 ''없어도 됨
	sql = String.format(sql,idx);
	//select는 query 나머지는 update
	conn.prepareStatement(sql).executeUpdate();
	out.println("<script>alert('삭제되었습니다.');location.href='./'</script>");
%>

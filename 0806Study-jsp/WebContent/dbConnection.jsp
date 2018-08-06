<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn;
	ResultSet res;
	/* DB 접속 */
	String user = "system"; // oracle 계정
	String pw = "1111";   // oracle 비밀번호
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 그대로 사용
	String sql = "";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
%>
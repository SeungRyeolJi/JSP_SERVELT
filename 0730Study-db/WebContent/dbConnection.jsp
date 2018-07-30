<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
 	Connection conn;	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url, user, pw;
	url = "jdbc:oracle:thin:@localhost:1521:xe";
	user = "system";
	pw = "1111";
	conn = DriverManager.getConnection(url,user,pw);
%>
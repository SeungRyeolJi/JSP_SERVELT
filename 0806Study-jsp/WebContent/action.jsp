<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<%
	String action = request.getParameter("action");
	PreparedStatement pstmt = null;
	String move_url = "index.jsp";
	switch(action){
	case "insert":
		sql = "insert into sys.board_tbl values(sys.board_seq.nextval,?,?,?,?)";	
		pstmt = conn.prepareStatement(sql);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		
		pstmt.setString(1, request.getParameter("writer"));
		pstmt.setString(2, request.getParameter("subject"));
		pstmt.setString(3, request.getParameter("content"));
		pstmt.setTimestamp(4, ts);
		break;
		
	case "update":
		sql = "update sys.board_tbl SET writer = ? , subject = ? , content = ?  where idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("writer"));
		pstmt.setString(2, request.getParameter("subject"));
		pstmt.setString(3, request.getParameter("content"));
		
	/* 	out.print(request.getParameter("idx"));
		if(true)
			return; */
		int idx = Integer.parseInt(request.getParameter("idx"));
		pstmt.setInt(4,idx);
		
		break;
		
	case "delete":
		sql = "delete from sys.board_tbl  where = idx";
		break;
	}
	
	pstmt.executeQuery();
%>
<script>
	alert('완료되었습니다.');
	location.replace("<%=move_url%>");
</script>
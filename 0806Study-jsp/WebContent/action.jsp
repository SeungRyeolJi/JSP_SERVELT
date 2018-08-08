<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<%
	String action = request.getParameter("action");
	PreparedStatement pstmt = null;
	
	String move_url = "index.jsp";
	int idx;
	Timestamp ts;
	switch(action){
	case "insert":
		sql = "insert into sys.board_tbl values(sys.board_seq.nextval,?,?,?,?)";	
		pstmt = conn.prepareStatement(sql);
		ts = new Timestamp(System.currentTimeMillis());
		
		pstmt.setString(1, request.getParameter("writer"));
		pstmt.setString(2, request.getParameter("subject"));
		pstmt.setString(3, request.getParameter("content"));
		pstmt.setTimestamp(4, ts);
		break;
		
	case "update":
		sql = "update sys.board_tbl SET writer = ? , subject = ? , content = ?  where idx = ?";
		idx = Integer.parseInt(request.getParameter("idx"));
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("writer"));
		pstmt.setString(2, request.getParameter("subject"));
		pstmt.setString(3, request.getParameter("content"));
		
		pstmt.setInt(4,idx);
		
		break;
		
	case "board_delete":
		idx = Integer.parseInt(request.getParameter("idx"));
		sql = "delete from sys.board_tbl  where idx = "+idx;
		pstmt = conn.prepareStatement(sql);
		break;
	
	case "comment_delete":
		//댓글 idx
		idx = Integer.parseInt(request.getParameter("idx"));
		sql = "delete from sys.comment_tbl where idx="+idx;
		pstmt = conn.prepareStatement(sql);
		break;
		
	case "comment":
		sql = "insert into sys.comment_tbl values(sys.comment_seq.nextval,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		idx = Integer.parseInt(request.getParameter("idx"));
		sql ="select writer from sys.board_tbl where idx = "+idx;
		res = conn.prepareStatement(sql).executeQuery();
		res.next();
		
		ts = new Timestamp(System.currentTimeMillis());
		
		pstmt.setInt(1,idx);
	 	pstmt.setString(2,res.getString("writer"));
	 	pstmt.setString(3,request.getParameter("comment_value"));
	 	pstmt.setTimestamp(4,ts);
	 	
		break;
	}
	
	pstmt.executeQuery();
%>
<script>
	alert('완료되었습니다.');
	location.replace("<%=move_url%>");
</script>
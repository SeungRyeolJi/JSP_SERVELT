<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<%
	String action = request.getParameter("action");
	if(action != null){
		String sql = "", id = request.getParameter("id");
		PreparedStatement pstmt;
		ResultSet rs;
		sql = "SELECT count(*) FROM sys.custom_01 where p_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next() && rs.getInt(1) > 0 ){
			out.println("<script>alert('중복된 아이디 존재'); history.back()</script>");
			if(true) return;
		}
		
		sql ="INSERT INTO sys.custom_01 values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, request.getParameter("pw"));
		pstmt.setString(3, request.getParameter("name"));
		pstmt.setString(4, request.getParameter("email"));
		pstmt.setString(5, request.getParameter("tel"));
		pstmt.executeUpdate();
		
		out.println("<script>alert('완료'); location.href='./'</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 추가</h2>
<hr>
<form action="" method="post">
	<fieldset>
		<input type="hidden" name ="action" value="insert"></input>
		<legend>회원 정보 작성</legend>
		<p>
			<label>
				<span>아이디</span>
				<input type="text" name="id" size ="10"></input>
			</label>
		</p>
			<p>
			<label>
				<span>비밀번호</span>
				<input type="password" name="pw" size ="10"></input>
			</label>
		</p>
			<p>
			<label>
				<span>이름</span>
				<input type="text" name="name" size ="20"></input>
			</label>
		</p>
			<p>
			<label>
				<span>이메일</span>
				<input type="email" name="email" size ="20"></input>
			</label>
		</p>
			<p>
			<label>
				<span>연락처</span>
				<input type="tel" name="tel" size ="20"></input>
			</label>
		</p>
		<button type="submit">전송</button>
	</fieldset>
</form>
</body>
</html>
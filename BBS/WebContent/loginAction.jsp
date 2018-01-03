<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!doctype html>
<html lang="en">
<head>
    <title>로그인</title>
</head>
<body>
	<%
		String userID = null;//세션값
		if(session.getAttribute("userID") != null){
 			userID = (String) session.getAttribute("userID");
		}
		if(userID != null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되었습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>"); 
		}
	//java.io.PrintWriter는 js를 사용할 수 있게 해주는 것//
	//scope는 범위 설정 pags는 현재 페이지만//
	//setProperty는 로그인페이지에서 넘어곤 값을 받는 것
		UserDAO userDAO = new UserDAO();//mysql>bbs접속
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		//setProperty로 설정한 user값의 아이디와 비밀번호를 로그인 메서드에 넘김
		//로그인 접속
		if(result ==1 ){
			session.setAttribute("userID",user.getUserID());
			System.out.println("세션 생성 "+"저장하는 값:"+user.getUserID()+"저장된 값:"+(String)session.getAttribute("userID"));
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
			System.out.println("로그인 성공");
		}
		else if(result == 0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>"); 
		}
		else if(result == -1 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result ==-2 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스의 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>
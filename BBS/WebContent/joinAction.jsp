<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!doctype html>
<html lang="en">
<head>
    <title>회원가입</title>
</head>
<body>
	<%
	//java.io.PrintWriter는 js를 사용할 수 있게 해주는 것//
	//scope는 범위 설정 pags는 현재 페이지만//
	//setProperty는 로그인페이지에서 넘어곤 값을 받는 것
			String userID = null;//세션값
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
					
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되었습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>"); 
		}
	if(user.getUserID() == null || user.getUserPassword() == null || 
			user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alreat('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
		UserDAO userDAO = new UserDAO();//mysql>bbs접속
		int result = userDAO.join(user);
		//setProperty로 설정한 user값의 아이디와 비밀번호를 로그인 메서드에 넘김
		//실패
		if(result == -1 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//성공
		else{
			session.setAttribute("userID",user.getUserID());
			System.out.println("세션 생성");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location = href ='main.jsp'");
			System.out.println("회원가입 성공");
			script.println("</script>"); 
		}
	%>
</body>
</html>
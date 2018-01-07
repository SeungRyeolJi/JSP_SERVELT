<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>

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
			
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>"); 
		}else{
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alreat('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			
				BbsDAO bbsDAO = new BbsDAO();//mysql>bbs접속
				int result = bbsDAO.write( bbs.getBbsTitle(), userID, bbs.getBbsContent());
				//setProperty로 설정한 user값의 아이디와 비밀번호를 로그인 메서드에 넘김						
				//실패
				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				//성공
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location = href ='bbs.jsp'");
					script.println("</script>"); 
				}
		}
	
	%>
</body>
</html>
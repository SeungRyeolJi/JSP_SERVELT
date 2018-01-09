<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bbs.css">

    <title>게시판 글 수정</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	if(userID ==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.')"); 
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	int bbsID  = 0;
	if(request.getParameter("bbsID") != null){
		System.out.println(request.getParameter("bbsID") instanceof String);
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	 Bbs bbs = new BbsDAO().getBbs(bbsID);
	 if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
	 }
	%>
<jsp:include page="header.jsp"/>
    <div id="bbs">
  	<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
        <table id="bbsTable">
        <thead>
            <tr id="tableHead">
                <th colspan="2">게시판 글 수정</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50" id="bbsTitle" value="<%=bbs.getBbsTitle()%>"/></td>
           </tr>
           <tr>
                <td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" id="bbsContent"><%=bbs.getBbsContent()%></textarea></td>					            
           </tr>
           </tbody>
        </table>
        <input type="submit" id="writing" value="글수정"/>
      </form>
    </div>
</body>
</html>
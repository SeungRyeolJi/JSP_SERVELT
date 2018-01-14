<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bbs.css">
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int bbsID  = 0;
	if(request.getParameter("bbsID") != null){
		System.out.println(request.getParameter("bbsID") instanceof String);
		System.out.println("공백을 주의하자..");
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
%>
    <title>게시판 글보기</title>
</head>
<body>
<jsp:include page="header.jsp"/>
    <div id="bbs">
        <table id="bbsTable">
        <thead>
            <tr id="tableHead">
                <th colspan="3">게시판 글 보기</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td id="bbsTitle">제목 : <%= bbs.getBbsTitle().replaceAll(" ","&nbsp").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
           </tr>
           <tr>
           		<td id="writerAndTime">작성자 : <%= bbs.getUserID().replaceAll(" ","&nbsp").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>")%> 작성시간  : <%= bbs.getBbsDate().substring(0, 10)+" "+bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분"%></td>
           </tr>
           <tr>
                <td id="bbsContent"><%= bbs.getBbsContent().replaceAll(" ","&nbsp").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>					            
           </tr>
           </tbody>
           <a href="bbs.jsp" class="btn">목록</a>
           <%
           	if(userID != null && userID.equals(bbs.getUserID())){
           %>
          	<a href="update.jsp?bbsID=<%=bbsID%>"class="btn">수정</a>
          	<a href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn">삭제</a>
           <%
           	}
           %>
        </table>
    </div>
</body>
</html>
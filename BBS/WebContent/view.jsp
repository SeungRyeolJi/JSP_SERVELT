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
		System.out.println("에러가");
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
		System.out.println("났나요?");
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
    <title>게시판 글쓰기</title>
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
                <td id="bbsTitle">제목 : <%= bbs.getBbsTitle() %></td>
           </tr>
           <tr>
           		<td id="writerAndTime">작성자 : <%= bbs.getUserID()%> 작성시간  : <%= bbs.getBbsDate().substring(0, 10)+" "+bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분"%></td>
           </tr>
           <tr>
                <td id="bbsContent"><%= bbs.getBbsContent() %></td>					            
           </tr>
           </tbody>
        </table>
    </div>
</body>
</html>
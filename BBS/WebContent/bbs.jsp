<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%
	String userID = null;
	if(session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	int pageNumber =1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bbs.css">

    <title>게시판</title>
</head>
<body>
<jsp:include page="header.jsp"/>
   <a href="write.jsp" id="writeBbs">글쓰기</a>
    <div id="bbs">
        
        <table id="bbsTable">
        <thead>
            <tr id="tableHead">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <%
            	BbsDAO bbsDAO = new BbsDAO(); //에러
            	ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
            	for(int i=0;i<list.size();i++){
           	%>
            <tr>
                <td><%= list.get(i).getBbsID() %></td>
                <td><a href="view.jsp?bbsID= <%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle() %></a></td>
                <td><%= list.get(i).getUserID() %></td>
                <td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
            </tr>
            <%
            	}
            %>
            </tbody>
        </table>
        <%
        	if(pageNumber != 1 ){
        %>
        	<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="page-move" >이전</a>
        <%
        	} if(bbsDAO.nextPage(pageNumber+1)){
        %>
        	<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="page-move" >다음</a>
        <%
        	}
        %>
    </div>
</body>
</html>
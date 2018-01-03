<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" href="css/header.css">
<nav id="navbar">
    <ul>
        <li><p id="navbar_brand">J S P 게시판 웹 사이트</p></li>
        <li><p><a href="main.jsp">메인</a></p></li>
        <li><p><a href="bbs.jsp">게시판</a></p></li>
        <%
        //세션이 에러
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			System.out.println(userID);
		} 
        	if(userID==null){
        %>
        <li id="dropdown">
            <p>접속하기</p>
            <ul id="dropdown_mark">
                <li><p><a href="login.jsp">로그인</a></p></li>
                <li><p><a href="join.jsp">회원가입</a></p></li>
            </ul>
        </li>
         <%
        }else{
        %>
         <li id="dropdown">
            <p>회원관리</p>
            <ul id="dropdown_mark">
                <li><p><a href="logoutAction.jsp">로그아웃</a></p></li>
            </ul>
        </li>
         <%
        }
        %>
    </ul>
</nav>

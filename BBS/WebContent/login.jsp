<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/login.css">
    <title>로그인</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true"/>
	<form method = "post" action="loginAction.jsp">
    <h2 id="loginTitle">로그인 화면</h2>
    <input type="text" id="userPw" class="inputRoom"  placeholder="아이디" name="userID" maxlength="20">
    <input type="password" id="userPw" class="inputRoom"  placeholder="비밀번호" name="userPassword" maxlength="20">
    <input type="submit"value="로그인" class="inputRoom" id="loginSubmit">
   </form>
</body>
</html>
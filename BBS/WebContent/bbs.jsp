<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <tr id="tableHead">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            <tr>
                <td>1</td>
                <td>시험글</td>
                <td>관리자</td>
                <td>2018-01-02</td>
            </tr>
        </table>
    </div>
</body>
</html>
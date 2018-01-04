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

    <title>게시판 글쓰기</title>
</head>
<body>
<jsp:include page="header.jsp"/>
    <div id="bbs">
  	<form method="post" action="wirteAction.jsp">
        <table id="bbsTable">
        <thead>
            <tr id="tableHead">
                <th colspan="2">글쓰기 양식</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50"/></td>
           </tr>
           <tr>
                <td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048"></textarea></td>					            
           </tr>
           </tbody>
        </table>
        <input type="submit" id="writing" value="글작성"/>
      </form>
    </div>
</body>
</html>
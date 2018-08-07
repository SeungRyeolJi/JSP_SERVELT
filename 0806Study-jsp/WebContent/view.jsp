<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	sql = "select * from sys.board_tbl where idx = "+request.getParameter("idx");
	res = conn.prepareStatement(sql).executeQuery();
	res.next();
	String subject,writer,content,date;
	writer = res.getString("writer");
	subject = res.getString("subject");
	content = res.getString("content");
	date = res.getString("date");
%>
  <fieldset>
    <fieldset>

      <table class="bbsView">

        <colgroup>
          <col width="25%">
          <col widt="25%">
          <col width="25%">
          <col widt="25%">
    		</colgroup>


        <h2>게시물 조회</h2>

        <tr>
          <th>제목 : </th>
          <th><%=subject%></th>
        </tr>

        <tr>
          <td>작성자 : </td>
          <td><%=writer %></td>
          <td>작성일 : </td>
          <td><%=date%></td>
        </tr>

      </table>

      <p>내용 : <%=content %> </p>

    </fieldset>

    <fieldset>
      <table class="comment">
        <colgroup>
          <col width="10%">
          <col widt="40%">
          <col width="40%">
          <col widt="10%">
        </colgroup>

        <tr><td>댓글 조회</td></tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td>삭제</td>
        </tr>
      </table>
    </fieldset>

    <fieldset>
        <form class="writeComplete" action="index.html" method="post" class="write">
          <input type="text" name="comment_value">
          <button type="submit">작성완료</button>
        </form>
    </fieldset>

      <div class="buttonBox">
        <a href="index.jsp"><button>목록</button></a>
        <a href="update.jsp?idx=<%=request.getParameter("idx")%>"><button>수정</button></a>
        <a href="action.jsp?action=delete"><button>삭제</buttno></a>
      </div>
  </fieldset>
<%@ include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	String idx = request.getParameter("idx");
	sql = "select * from sys.board_tbl where idx = "+idx;
	res = conn.prepareStatement(sql).executeQuery();
	res.next();
	String subject,writer,content,date;
	writer = res.getString("writer");
	subject = res.getString("subject");
	content = res.getString("content");

%>
<!--업데이트  -->
  <fieldset>
    <form action="action.jsp" method="post">
    <h2>게시물 작성</h2>
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="idx" value=<%=idx %>>
    <table class="bbsWrite">
      <colgroup>
        <col width="20%">
        <col width="80%">
      </colgroup>
      <tr>
        <td>작성자</td>
        <td><input type="text" name="writer" value ="<%=writer%>"></td>
      </tr>
      <tr>
        <td>제목</td>
        <td><input type="text" name="subject" value="<%=subject%>"></td>
      </tr>
      <tr>
        <td>내용</td>
        <td>
          <textarea name="content" id="" cols="60" rows="12">
				<%=content%>
          </textarea>
        </td>
      </tr>
    </table>
    <div class="buttonBox">
      <button type="button"><a href="index.jsp">목록</a></button>
      <button type="submit">완료</button>
    </div>
    </form>
  </fieldset>
<%@ include file="footer.jsp"%>
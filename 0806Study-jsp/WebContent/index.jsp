<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp"%>
<%
	sql = "select * from sys.board_tbl order by idx asc";
	res = conn.prepareStatement(sql).executeQuery();
	int idx;
	String writer,subject,content,date;
%>
  <!-- 게시판 내용  -->
  <article class="content">
    <fieldset>
    <table>
      <colgroup>
  			<col span="2" width="20%">
  			<col width="40%">
        <col widt="30%">
  		</colgroup>
      <tr>
        <th width=>번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>작성일</th>
      </tr>
	<%
		while(res.next()){
			idx = res.getInt("idx");
			writer = res.getString("writer");
			subject = res.getString("subject");
			date = res.getString("date");
	%>
      <tr>
        <td><a href="./view.jsp?idx=<%=idx%>"><%= idx %></a></td>
        <td><%= writer %></td>
        <td><a href="./view.jsp?idx=<%=idx%>"><%= subject %></a></td>
        <td><%= date %></td>
      </tr>
     <%} %>
    </table>
  <a href="write.jsp"><button type="button"">작성</button></a>
  </fieldset>
  </article>

<%@ include file ="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp"%>
<%
	sql = "select * from board_tbl order by idx desc";
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
        <td><%= idx %></td>
        <td><%= writer %></td>
        <td><%= subject %></td>
        <td><%= date %></td>
      </tr>
     <%} %>
    </table>
  <button type="button" name="writeButton" class="writeButton">작성</button>
  </fieldset>
  </article>

<%@ include file ="footer.jsp"%>
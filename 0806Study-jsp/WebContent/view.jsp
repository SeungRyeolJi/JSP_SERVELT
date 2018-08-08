<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	String idx = request.getParameter("idx");
	sql = "select * from sys.board_tbl where idx = "+idx;
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
          <col width="25%">
          <col width="25%">
          <col width="25%">
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

      <p>내용 : <%=content.toString().replaceAll("<script>","하지마") %> </p>

    </fieldset>

    <fieldset>
      <table class="comment">
        <colgroup>
             <col width="20%">
          <col width="35%">
          <col width="35%">
          <col width="10%">
        </colgroup>

        <tr><td>댓글 조회</td></tr>
        <%	
        	sql = "select * from sys.comment_tbl where bidx = "+ idx;
        	res = conn.prepareStatement(sql).executeQuery();
        	while(res.next()){
        %>
        <tr>
          <td><%=res.getString("writer")%></td>
          <td><%=res.getString("content").toString().replaceAll("<script>","하지마")%></td>
          <td><%=res.getTimestamp("date")%></td>
          <td><a href="action.jsp?action=comment_delete&idx=<%=res.getInt("idx")%>">삭제</a></td>
        </tr>
        <%
        	break;	
        	}
        %>
      </table>
    </fieldset>

    <fieldset>
    
        <form action="action.jsp" method="post">
          <input type="hidden" name="idx" value="<%=idx%>">
          <input type="hidden" name="action" value="comment">
          <input type="text" name="comment_value">
          <button type="submit">작성완료</button>
        </form>
    </fieldset>

      <div class="buttonBox">
        <a href="index.jsp"><button>목록</button></a>
        <a href="update.jsp?idx=<%=idx%>"><button>수정</button></a>
        <a href="action.jsp?action=board_delete&idx=<%=idx%>"><button>삭제</buttno></a>
      </div>
  </fieldset>
<%@ include file="footer.jsp"%>
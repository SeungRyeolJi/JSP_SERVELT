<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
  <fieldset>
    <form action="action.jsp" method="post">
    <h2>게시물 작성</h2>
    <input type="hidden" name="action" value="insert">
    <table class="bbsWrite">
      <colgroup>
        <col width="20%">
        <col width="80%">
      </colgroup>
      <tr>
        <td>작성자</td>
        <td><input type="text" name="writer"></td>
      </tr>
      <tr>
        <td>제목</td>
        <td><input type="text" name="subject"></td>
      </tr>
      <tr>
        <td>내용</td>
        <td>
          <textarea name="content" id="" cols="60" rows="12">

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
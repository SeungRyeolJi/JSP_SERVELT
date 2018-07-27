<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	/* 한글 깨짐 방지 */
	request.setCharacterEncoding("UTF-8");
	
	/* DB 접속 */
	String user = "system";
	String pw = "1111";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "";
	/* 드라이버 있는 지 검사, 로딩 */
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url,user,pw);
	/* next value 가져오기 */
	sql = "SELECT custno from sys.member_tbl_02 where rownum <=1 order by custno desc";
	ResultSet res = conn.prepareStatement(sql).executeQuery();
	int custno = 10001;
	if(res.next()){
		custno = res.getInt(1)+1;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/common.css">
<title>Insert title here</title>
</head>
<body>
	<div class ="header">
		<h3 class="logo">쇼핑몰 회원 관리 var 1.0</h3>
		<div class="gnb">
			<ul>
				<li><a href="./index.jsp">회원등록</a></li>
				<li><a href="./list.jsp">회원목록 조회/수정</a></li>
				<li><a href="./money.jsp">회원매출조회</a></li>
				<li><a href="./index">홈으로.</a></li>
			</ul>
		</div>
	</div>
	<div class="containr">
		<div class ="content">
			<h2>홈쇼핑 회원 등록</h2>
			<form action="./action.jsp" method="post">
			<input type="hidden" name="action" value="member_insert">
			<table>
				<colgroup>
					<col widht="40%">
					<col width="60%">
				</colgroup>
				<tr>
				<th>회원번호(자동발생)</th>
				<th><input type="text" name="custno" size="20" value="<%=custno%>"></th>				
				</tr>
				<tr>
				<th>회원성명</th>
				<th><input type="text" name="custname" size="20"></th>				
				</tr>
				<tr>
				<th>회원전화</th>
				<th><input type="text" name="phone" size="30"></th>				
				</tr>
				<tr>
				<th>회원주소</th>
				<th><input type="text" name="address" size="40"></th>				
				</tr>
				<tr>
				<th>가입일자</th>
				<th><input type="text" name="joindate" size="20"></th>				
				</tr>
				<tr>
				<th>고객등급(A:VIP,B:일반,C:직원)</th>
				<th><input type="text" name="grade" size="20"></th>				
				</tr>
				<tr>
				<th>도시코드</th>
				<th><input type="text" name="city" size="20"></th>				
				</tr>
			</table>
			<div class="btn_group">
				<button type="submit">전송</button>
				<button type="button"><a href="./list.jsp">조회</a></button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
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
	
	String action = request.getParameter("action");
	String custno, custname,phone,address ,joindate, grade,city;
	switch(action){
	case "member_insert" :
		custno = request.getParameter("custno");
			custname = request.getParameter("custname");
			phone = request.getParameter("phone");
			address = request.getParameter("address");
			joindate = request.getParameter("joindate");
		 	grade = request.getParameter("grade");
		 	city = request.getParameter("city");
		
		sql = "INSERT INTO sys.member_tbl_02 values('%s','%s','%s','%s','%s','%s','%s')";
		sql = String.format(sql,custno,custname,phone,address,joindate,grade,city);
		break;
	case "member_update" :
		custno = request.getParameter("custno");
		custname = request.getParameter("custname");
		phone = request.getParameter("phone");
		address = request.getParameter("address");
		joindate = request.getParameter("joindate");
	 	grade = request.getParameter("grade");
	 	city = request.getParameter("city");
		//trim 공백 제거
		sql = "update sys.member_tbl_02 SET ";
		sql+= "custname = '%s',";
		sql+= "phone = '%s',";
		sql+= "address = '%s',";
		sql+= "joindate = '%s',";
		sql+= "grade = '%s',";
		sql+= "city = '%s' ";
		sql+= "where custno = %s";
		sql = String.format(sql,custname.trim().trim(),phone.trim(),address.trim(),joindate.trim(),grade.trim(),city.trim(),custno.trim());
		break;
	}
	//out.println(sql);
	//if(true) return;
	conn.prepareStatement(sql).executeUpdate();
  	%>
<script>
	alert('완료');
	location.replace("./");
</script>

package oracleTutorial;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//sql 연결 : conn system(id)/root(pw) as sysdba;
//사용자에 권한 : grant select, insert, update, delete on sys.board to system;
public class ConnTest {
	public static Connection getConnection() {
		//select instance from v$thread;
				String user = "system";
				String pw = "root";
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				Connection conn = null;

				try {
					//드라이브가 있는 지 없지는 지
					Class.forName("oracle.jdbc.driver.OracleDriver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					conn = DriverManager.getConnection(url, user, pw);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				System.out.println("연결성공 ");
				return conn;
	}
	public static void selectList() throws SQLException {
		String sql;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet res;
		
		sql = "SELECT * FROM sys.board";
	
		pstmt = conn.prepareStatement(sql);
		res = pstmt.executeQuery();
	
		
		while(res.next()) {
			int idx = res.getInt("idx");
			String writer = res.getString("writer");
			String subject = res.getString("subject");
			String content = res.getString("content");
			String date = res.getString("reg_date");
			System.out.println("글번호 : "+idx);
			System.out.println("작성자 : "+writer);
			System.out.println("제목 : "+content);
			System.out.println("작성일 : "+date);
			System.out.println("");		
			}
	}
	public static void main(String[] args) throws SQLException {
		selectList();
		
		String sql;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		//테이블 내용 비우기 
		sql = "DELETE FROM sys.board";
		conn.prepareStatement(sql).executeUpdate();
		selectList();
		//테이블 내용 추가 
		sql = "INSERT INTO sys.board values(1,'작성자 테스트','제목 테스트','내용 테스트',sysdate)";
		conn.prepareStatement(sql).executeQuery();
		sql = "INSERT INTO sys.board values(2,'작성자 테스트2','제목 테스트2','내용 테스트2',sysdate)";
		conn.prepareStatement(sql).executeQuery();
		selectList();
		//내용 수정 
		sql = "UPDATE sys.board SET subject = '작성자 수정' where idx = 1";
		conn.prepareStatement(sql).executeQuery();
		selectList();
	}
}

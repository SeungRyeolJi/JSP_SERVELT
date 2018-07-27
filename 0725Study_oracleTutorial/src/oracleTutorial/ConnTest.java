package oracleTutorial;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//sql ���� : conn system(id)/root(pw) as sysdba;
//����ڿ� ���� : grant select, insert, update, delete on sys.board to system;
public class ConnTest {
	public static Connection getConnection() {
		//select instance from v$thread;
				String user = "system";
				String pw = "root";
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				Connection conn = null;

				try {
					//����̺갡 �ִ� �� ������ ��
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
			
				System.out.println("���Ἲ�� ");
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
			System.out.println("�۹�ȣ : "+idx);
			System.out.println("�ۼ��� : "+writer);
			System.out.println("���� : "+content);
			System.out.println("�ۼ��� : "+date);
			System.out.println("");		
			}
	}
	public static void main(String[] args) throws SQLException {
		selectList();
		
		String sql;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		//���̺� ���� ���� 
		sql = "DELETE FROM sys.board";
		conn.prepareStatement(sql).executeUpdate();
		selectList();
		//���̺� ���� �߰� 
		sql = "INSERT INTO sys.board values(1,'�ۼ��� �׽�Ʈ','���� �׽�Ʈ','���� �׽�Ʈ',sysdate)";
		conn.prepareStatement(sql).executeQuery();
		sql = "INSERT INTO sys.board values(2,'�ۼ��� �׽�Ʈ2','���� �׽�Ʈ2','���� �׽�Ʈ2',sysdate)";
		conn.prepareStatement(sql).executeQuery();
		selectList();
		//���� ���� 
		sql = "UPDATE sys.board SET subject = '�ۼ��� ����' where idx = 1";
		conn.prepareStatement(sql).executeQuery();
		selectList();
	}
}

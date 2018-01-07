package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	//�ܺ� ���̷���
	
	public BbsDAO() {
		//mysql�� ����
		//UserDAO�� ������
		try {
			String dbURL ="jdbc:mysql://localhost:3306/BBS?autoReconnect=true&useSSL=false";
			//localhost�� ���� ��ǻ���� �ּҸ� �ǹ�, 3306��Ʈ�� ��Ƶ� mysql�� ���� bbs�� 3306������ db
			String dbID = "root";
			String dbPassword = "qweqaz156!";
			Class.forName("com.mysql.jdbc.Driver");
			//driver�� mysql�� ���� �� �� �ְ��ϴ� �ϳ��� ���̺귯��
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			//db�� ���� conn��ü �ȿ� db������ ��
		} catch(Exception e) {
			e.printStackTrace();
			//���� �߻��� ������ ������
		}
	}
	
	public String getDate () {
		//�ð��� ��������
		String SQL ="SELECT NOW()";
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";//db����
	}
	
	public int getNext () {
		//�ð��� ��������
		String SQL ="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		//���� ������������ �������� ��ȣ �������� 
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //ù �Խù�
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//db����
	}
	
	public int write(String bbsTitle,String userID, String bbsContent) {
		String SQL ="INSERT INTO BBS VALUE (?,?,?,?,?,?)";
		//���� ������������ �������� �������� 
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			//executeUpdate�� insert, delete, update�� �����͸� �ٷ�� ���� �� �� ���(���尰��?)
			//executeQuery�� ���� ����� resultSet�� �����ϱ� ���� �� select �� ���
			//execute�� ��� ���� ��� ����(ddl(����) ,dml(����) ,dcl(��Ʈ��))
		}catch(Exception e) {
			System.out.println("ĳġ�� ���� ��");
			e.printStackTrace();
		}
		return -1;//db����
	}
	
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL ="SELECT * FROM BBS WHERE bbsID <? AND  bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		//desc�� ������ �� asc�� �ø��� ��
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs =new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+
						rs.getString(4)+" "+rs.getString(5)+" "+rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;//db����
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL ="SELECT * FROM BBS WHERE bbsID <? AND  bbsAvailable = 1";
		//desc�� ������ �� asc�� �ø��� ��
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) *10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;//db����
	}
}

package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	//외부 라이러리
	
	public BbsDAO() {
		//mysql의 접속
		//UserDAO의 생성자
		try {
			String dbURL ="jdbc:mysql://localhost:3306/BBS?autoReconnect=true&useSSL=false";
			//localhost는 본인 컴퓨터의 주소를 의미, 3306포트는 깔아둔 mysql의 접근 bbs는 3306에서의 db
			String dbID = "root";
			String dbPassword = "qweqaz156!";
			Class.forName("com.mysql.jdbc.Driver");
			//driver는 mysql의 접속 할 수 있게하는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			//db에 접속 conn객체 안에 db정보가 들어감
		} catch(Exception e) {
			e.printStackTrace();
			//오류 발생시 오류를 보여줌
		}
	}
	
	public String getDate () {
		//시간을 가져오는
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
		return "";//db오류
	}
	
	public int getNext () {
		//시간을 가져오는
		String SQL ="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		//가장 내림차순으로 마지막의 번호 가져오게 
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫 게시물
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//db오류
	}
	
	public int write(String bbsTitle,String userID, String bbsContent) {
		String SQL ="INSERT INTO BBS VALUE (?,?,?,?,?,?)";
		//가장 내림차순으로 마지막을 가져오게 
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			//executeUpdate는 insert, delete, update등 데이터를 다루는 것을 할 때 사용(저장같은?)
			//executeQuery는 쿼리 결과를 resultSet에 저장하기 위한 것 select 때 사용
			//execute는 모든 쿼를 사용 가능(ddl(정의) ,dml(조작) ,dcl(컨트롤))
		}catch(Exception e) {
			System.out.println("캐치문 실행 됨");
			e.printStackTrace();
		}
		return -1;//db오류
	}
	
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL ="SELECT * FROM BBS WHERE bbsID <? AND  bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		//desc는 내림차 순 asc는 올림차 순
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
		return list;//db오류
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL ="SELECT * FROM BBS WHERE bbsID <? AND  bbsAvailable = 1";
		//desc는 내림차 순 asc는 올림차 순
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
		return false;//db오류
	}
}

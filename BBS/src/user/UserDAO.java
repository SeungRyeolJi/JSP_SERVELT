package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	//데이터베이스의 접근, 값을 넣어주는 객체
	
	private Connection conn;
	private PreparedStatement pstmt; 
	private ResultSet rs;
	//외부 라이러리
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		//로그인 작업
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			//pstmt에 데이터베이스 문장을 삽입하는 걸로 인스턴스를 가져옴
			pstmt.setString(1,userID);
			//☆ sql인잭션 같은 해킹 방법을 막기위해 ?로 해뒀다가 바꾸는 것 userID를 ?에 넣음
			rs=pstmt.executeQuery();
			//결과를 담을 수 있는 rs에다가 실행한 결과를 넣어준다.
			if(rs.next()) {
				//결과 존재하면
				if(rs.getString(1).equals(userPassword)) {
					//아이디의 비밀번호와 입력한 비밀번호를 비교
					return 1;//아이디가 있다 => 로그인 성공
				}
				else
					return 0;//비밀번호와 아이디가 일치하지 않음  => 로그인 실패
			}
			return -1;//bbs db에 아이디가 없다
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;//데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (? ,? ,? ,? ,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5,user.getUserEmail());	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}

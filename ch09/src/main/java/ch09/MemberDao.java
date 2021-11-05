package ch09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {// DAO (Data Access Object DB와 연결하고 CRUD작업)
	// 싱글톤 : 객체를 하나만 생성해서 공유
	// static 정적, 공유, 객체를 생성하지 않고 바로 사용가능, 클래스 변수
	// 클래스를 로딩할때 딱 한번만 실행한다.
	private static MemberDao instance = new MemberDao();

	private MemberDao() {
	}// 생성자 기본형, 외부에서 객체 생성을 금지하기 위해 private

	public static MemberDao getInstance() {
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			// Context에가서 DataSource를 찾아봐라 그중에 jdbc/OracleDB
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("연결 에러 : " + e.getMessage());
		}
		return conn;
	}

	public int insert(Member member) {//화면에서 입력한 id,password,name
		int result = 0;
		Connection conn = getConnection(); //db연결
		PreparedStatement pstmt = null;
		String sql = "insert into member1 values(?,?,?,sysdate)";
		try {//데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return result;
	}
	public int loginChk(String id, String password) {//화면에서 입력한 id,password,name
		int result = 0;
		Connection conn = getConnection(); //db연결
		PreparedStatement pstmt = null;
		String sql = "select password from member1 where id=?";
		ResultSet rs= null;
		try {//데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); //password가 저장
			if(rs.next()) {
				String dbPass =rs.getString("password"); //DB에 저장된 암호를 가져옴
				if(password.equals(dbPass)) {
					result =1; //아이디와 패스워드가 일치한다.
				}else {
					result =0;//아이디는 있지만 암호가 잘못됨
				}
			}else result = -1;//없는아이디
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return result;
	}
}

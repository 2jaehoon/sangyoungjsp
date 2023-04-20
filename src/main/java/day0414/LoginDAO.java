package day0414;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class LoginDAO {
	
	public String selectLogin( LoginVO lVO )throws SQLException {
		
		String cipherName="";
		
		DbConnection dbCon = DbConnection.getInstance();
		//1. JNDI 사용 객체 생성
		//2. DataSource 얻기
		Connection con  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//3. Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성 객체 얻기
			StringBuilder  selectInjection = new StringBuilder();
			selectInjection
			.append(" select name")
			.append(" from test_injection ")
			.append(" where id=? and pass=? ");
			
			pstmt = con.prepareStatement(selectInjection.toString());
			//5. 바인드 변수 값 설정
			pstmt.setString(1, lVO.getId());
			pstmt.setString(2, lVO.getPass());
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			if(rs.next() ) {//아이디와 비밀번호 맞은 경우=> 로그인 성공
				cipherName=rs.getString("name");	
				
			}//end if
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		return cipherName;//이름 또는 초기화한 값
	}

}

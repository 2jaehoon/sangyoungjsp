package day0415;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import kr.co.sist.dao.DbConnection;

public class IpDupDAO {
	public String selectId( String id )throws SQLException{
		String resultId="";
		
		
		DbConnection dbCon = DbConnection.getInstance();
		
		//1. JNDI 사용객체 생성
		
		//2. DataSource 얻기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//3. Connection 얻기
			con=dbCon.getConn();
		
		//4. 쿼리문 생성 객체 얻기
			String selectId = " select id from test_injection where id=? ";
			pstmt = con.prepareStatement(selectId);
		
		//5. 바인드 변수에 값 할당
		pstmt.setString(1, id);
		//6. 쿼리문 수행 후 결과 얻기
		rs=pstmt.executeQuery();
		if(rs.next() ) {
			resultId = rs.getString("id");
		}//end if
		
		}finally {
		//7. 연결 끊기
		dbCon.dbClose(rs, pstmt, con);
	}//end finally
		
		return resultId;
	}//selectId

}//class

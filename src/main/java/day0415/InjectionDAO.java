package day0415;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import kr.co.sist.dao.DbConnection;

public class InjectionDAO {
	

	
	
	
	
	public void insertInjection( InjectionVO iVO )throws SQLException {
		 Connection con = null;
		 PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		 try {
		//1. JNDI 사용 객체 생성
		//2. DataSource 얻기
		//3. Connection 얻기
			 con=dbCon.getConn();
		//4. 쿼리문 생성 객체 얻기
			 StringBuilder insertInjection = new StringBuilder();
			 insertInjection
			 .append(" insert into test_injection(id, pass, name, ip, input_date) values(?,?,?,?,sysdate) ");
			 
			 pstmt=con.prepareStatement(insertInjection.toString());
		//5. 바인드 변수 값 설정
			 pstmt.setString(1, iVO.getId());
			 pstmt.setString(2, iVO.getPass());
			 pstmt.setString(3, iVO.getName());
			 pstmt.setString(4, iVO.getIp());
			 
		//6. 쿼리문 수행 후 결과 얻기
			 pstmt.executeQuery(); //prepared에서는  update인데
		 }finally {
		//7. 연결 끊기
			 dbCon.dbClose(null, pstmt, con);
		 }//end finally
}//insertInjection
	
	
	
	
	public List<InjectionVO> selectAllInjection( )throws SQLException {
		List<InjectionVO> list = new ArrayList<InjectionVO>();
		 Connection con = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		 try {
		//1. JNDI 사용 객체 생성
		//2. DataSource 얻기
		//3. Connection 얻기
			 con=dbCon.getConn();
		//4. 쿼리문 생성 객체 얻기
			 StringBuilder selectInjection = new StringBuilder();
			 selectInjection
			 .append(" select id, pass, name, nvl(ip, '127.0.0.1') ip, input_date ")
			 .append(" from test_injection ");
			 
			 pstmt=con.prepareStatement(selectInjection.toString());
		//5. 바인드 변수 값 설정
		//6. 쿼리문 수행 후 결과 얻기
			 rs = pstmt.executeQuery(); //prepared에서는  update인데
			 
			 InjectionVO iVO = null;
			 
			 while( rs.next() ) {
				 iVO = new InjectionVO();
				 iVO.setId(rs.getString("id"));
				 iVO.setName(rs.getString("name"));
				 iVO.setIp(rs.getString("ip"));
				 iVO.setInput_date(rs.getDate("input_date"));
				 
				 list.add(iVO);
				 
			 }//end while
			 
		 }finally {
		//7. 연결 끊기
			 dbCon.dbClose(null, pstmt, con);
		 }//end finally
		 
		 return list;
		 
}//selectAllInjection

	
}//class

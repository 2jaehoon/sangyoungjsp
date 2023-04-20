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
		//1. JNDI ��� ��ü ����
		//2. DataSource ���
		//3. Connection ���
			 con=dbCon.getConn();
		//4. ������ ���� ��ü ���
			 StringBuilder insertInjection = new StringBuilder();
			 insertInjection
			 .append(" insert into test_injection(id, pass, name, ip, input_date) values(?,?,?,?,sysdate) ");
			 
			 pstmt=con.prepareStatement(insertInjection.toString());
		//5. ���ε� ���� �� ����
			 pstmt.setString(1, iVO.getId());
			 pstmt.setString(2, iVO.getPass());
			 pstmt.setString(3, iVO.getName());
			 pstmt.setString(4, iVO.getIp());
			 
		//6. ������ ���� �� ��� ���
			 pstmt.executeQuery(); //prepared������  update�ε�
		 }finally {
		//7. ���� ����
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
		//1. JNDI ��� ��ü ����
		//2. DataSource ���
		//3. Connection ���
			 con=dbCon.getConn();
		//4. ������ ���� ��ü ���
			 StringBuilder selectInjection = new StringBuilder();
			 selectInjection
			 .append(" select id, pass, name, nvl(ip, '127.0.0.1') ip, input_date ")
			 .append(" from test_injection ");
			 
			 pstmt=con.prepareStatement(selectInjection.toString());
		//5. ���ε� ���� �� ����
		//6. ������ ���� �� ��� ���
			 rs = pstmt.executeQuery(); //prepared������  update�ε�
			 
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
		//7. ���� ����
			 dbCon.dbClose(null, pstmt, con);
		 }//end finally
		 
		 return list;
		 
}//selectAllInjection

	
}//class

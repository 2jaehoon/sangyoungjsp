package day0413;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import kr.co.sist.dao.DbConnection;

public class InjectionDAO {
	
	public List<InjectionVO> selectInjectAll() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<InjectionVO> iList = new ArrayList<InjectionVO>();
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			
		con=dbCon.getConn();
		
		
		String selectjectA = "select id, pass, name, input_date from test_injection";
		pstmt=con.prepareStatement(selectjectA);
		rs = pstmt.executeQuery();
		
		String id = "";
		String pass = "";
		String name = "";
		Date date = null;
		
		
		InjectionVO iVO = null;
		while(rs.next()) { // ���ڵ尡 �����ϴ��� �� �� ������ ������ �ٸ� ��� ���ڵ带 �����;� �Ѵ�.
			//Ŀ�� ������ ���ڵ尡 �����ϸ� TRUE�� ��ȯ�Ͽ� Ŀ���� ��ġ�� �Ʒ��� �̵�
			/*
			 * id=rs.getString("id"); pass=rs.getString("pass"); name=rs.getString("name");
			 * date=rs.getDate("input_date");
			 */
			
			
			iVO = new InjectionVO( rs.getString("id"),rs.getString("pass"),rs.getString("name"),rs.getDate("input_date") );
			iList.add(iVO);
			
		}//end while

		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
			
		
		return iList;
	}//selectInjectAll
	
	
	
	
	
	public InjectionVO selectInjectOne( String name ) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		InjectionVO iVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			
		con=dbCon.getConn();
		
		
		StringBuilder selectInjectO = new StringBuilder();
		selectInjectO.append(" select id, pass, name, input_date ")
		.append(" from  test_injection ")
		.append(" where  name=? ");
				
		pstmt=con.prepareStatement(selectInjectO.toString());
		
		pstmt.setString(1, name);
		
		rs = pstmt.executeQuery();
		

		
		
		
		if(rs.next()) { //�˻��� ���ڵ尡 �����ϴ�?
			//VO�� �����Ͽ� �˻� ����� �Ҵ�
			
			iVO = new InjectionVO( rs.getString("id"),rs.getString("pass"),name,rs.getDate("input_date") );
			
			
		}//end while

		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
			
		
		return iVO;
	}//selectInjectOne
	
	public int updateInjection( InjectionVO iVO )throws SQLException {
		int cnt = 0;
		 Connection con = null;
		 PreparedStatement pstmt = null;
		
		 DbConnection dbCon = DbConnection.getInstance();
		 try {
		//1. JNDI ��� ��ü ����
		//2. DataSource ���
		//3. Connection ���
			 con=dbCon.getConn();
		//4. ������ ���� ��ü ���
			 StringBuilder updateInjection = new StringBuilder();
			 updateInjection
			 .append(" update test_injection ")
			 .append(" set name=?, pass=? ")
			 .append(" where id=? ");
			 
			 pstmt=con.prepareStatement(updateInjection.toString());
		//5. ���ε� ���� �� ����
			 pstmt.setString(1, iVO.getName());
			 pstmt.setString(2, iVO.getPass());
			 pstmt.setString(3, iVO.getId());
			 
		//6. ������ ���� �� ��� ���
			 cnt=pstmt.executeUpdate();
			
		 }finally {
		//7. ���� ����
			 dbCon.dbClose(null, pstmt, con);
		 }//end finally
		 return cnt;
}//updateInjection
	
	
	public int deleteInjection( String name )throws SQLException {
		int dcnt = 0;
		 Connection con = null;
		 PreparedStatement pstmt = null;
		
		 DbConnection dbCon = DbConnection.getInstance();
		 try {
		//1. JNDI ��� ��ü ����
		//2. DataSource ���
		//3. Connection ���
			 con=dbCon.getConn();
		//4. ������ ���� ��ü ���
			 String deleteInjection = "delete from test_injection where name=? ";

			 
			 pstmt=con.prepareStatement(deleteInjection);
		//5. ���ε� ���� �� ����
			 pstmt.setString(1, name);
			 
		//6. ������ ���� �� ��� ���
			 dcnt=pstmt.executeUpdate();
			
		 }finally {
		//7. ���� ����
			 dbCon.dbClose(null, pstmt, con);
		 }//end finally
		 return dcnt;
}//deleteInjection
	
	
	
	
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
			 .append(" insert into test_injection(id, pass, name, input_date) values(?,?,?,sysdate) ");
			 
			 pstmt=con.prepareStatement(insertInjection.toString());
		//5. ���ε� ���� �� ����
			 pstmt.setString(1, iVO.getId());
			 pstmt.setString(2, iVO.getPass());
			 pstmt.setString(3, iVO.getName());
			 
		//6. ������ ���� �� ��� ���
			 pstmt.executeQuery(); //prepared������  update�ε�
		 }finally {
		//7. ���� ����
			 dbCon.dbClose(null, pstmt, con);
		 }//end finally
}//insertInjection
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}//class

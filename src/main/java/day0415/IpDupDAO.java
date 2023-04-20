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
		
		//1. JNDI ��밴ü ����
		
		//2. DataSource ���
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//3. Connection ���
			con=dbCon.getConn();
		
		//4. ������ ���� ��ü ���
			String selectId = " select id from test_injection where id=? ";
			pstmt = con.prepareStatement(selectId);
		
		//5. ���ε� ������ �� �Ҵ�
		pstmt.setString(1, id);
		//6. ������ ���� �� ��� ���
		rs=pstmt.executeQuery();
		if(rs.next() ) {
			resultId = rs.getString("id");
		}//end if
		
		}finally {
		//7. ���� ����
		dbCon.dbClose(rs, pstmt, con);
	}//end finally
		
		return resultId;
	}//selectId

}//class

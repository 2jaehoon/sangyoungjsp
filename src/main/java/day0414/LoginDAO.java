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
		//1. JNDI ��� ��ü ����
		//2. DataSource ���
		Connection con  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//3. Connection ���
			con=dbCon.getConn();
		//4. ������ ���� ��ü ���
			StringBuilder  selectInjection = new StringBuilder();
			selectInjection
			.append(" select name")
			.append(" from test_injection ")
			.append(" where id=? and pass=? ");
			
			pstmt = con.prepareStatement(selectInjection.toString());
			//5. ���ε� ���� �� ����
			pstmt.setString(1, lVO.getId());
			pstmt.setString(2, lVO.getPass());
		//6. ������ ���� �� ��� ���
			rs=pstmt.executeQuery();
			
			if(rs.next() ) {//���̵�� ��й�ȣ ���� ���=> �α��� ����
				cipherName=rs.getString("name");	
				
			}//end if
			
		}finally {
			//7. ���� ����
			dbCon.dbClose(rs, pstmt, con);
		}
		return cipherName;//�̸� �Ǵ� �ʱ�ȭ�� ��
	}

}

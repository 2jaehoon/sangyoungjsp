package day0419;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.vo.EmpVO;

public class EmpDAO {
	
	public EmpVO selectOneEmp( int empno ) throws SQLException{
		EmpVO eVO = null;
		
		DbConnection dbCon  = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=dbCon.getConn();
			
			StringBuilder selectOneEmp = new StringBuilder();
			selectOneEmp
			.append(" select ename, job, sal, hiredate, deptno ")
			.append(" from cp_emp ")
			.append(" where empno=? ");
			
			pstmt = con.prepareStatement(selectOneEmp.toString());
			
			pstmt.setInt(1, empno);
			
			rs=pstmt.executeQuery();
			
			if(rs.next() ) {
				eVO = new EmpVO( empno, rs.getInt("sal"), rs.getInt("deptno"), rs.getString("ename"), rs.getString("job"), rs.getDate("hiredate") );
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return eVO;
	}//selectEmp
	
	/**
	 * ���κ� ������ DB �۾��� ������ �� Dynamic Query�� �ۼ��Ͽ� �ߺ��ڵ带 ���� �� �ִ�.
	 * 
	 * ��������(dynamic query): ��Ȳ�� ���� �������� �ٸ��� �����Ǿ� ����Ǵ� ��.
	 * 
	 * cp_emp ���̺��� ��� ����� ��ȸ�ϰų� �μ���ȣ�� �ԷµǸ� �μ���ȣ�� �ش��ϴ� ����� ��ȸ
	 * => ���� : �μ� ��ȣ�� 0���̸� ��� ����� ��ȸ
	 * @return
	 * @throws SQLException
	 */
	
	public List<EmpVO> selectAllEmp( int deptno ) throws SQLException{
		List<EmpVO> list = new ArrayList<EmpVO>();
		DbConnection dbCon  = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=dbCon.getConn();
			
			StringBuilder selectAllEmp = new StringBuilder();
			selectAllEmp
			.append(" select empno, ename, job, sal, hiredate, deptno ")
			.append(" from cp_emp  ");
			
			if(deptno != 0) {//��������
				selectAllEmp.append(" where deptno = ? ");
			}//end if
			
			selectAllEmp.append(" order by sal desc ");
			
			pstmt = con.prepareStatement(selectAllEmp.toString());
			
			if(deptno != 0) {//���������� �� ���ε� ������ �־��ش�.
				pstmt.setInt(1, deptno);
			}//end if
			
			rs=pstmt.executeQuery();
			EmpVO eVO = null;
			
			while(rs.next() ) {
				eVO = new EmpVO( rs.getInt("empno"), rs.getInt("sal"), rs.getInt("deptno"), rs.getString("ename"), rs.getString("job"), rs.getDate("hiredate") );
				
				list.add(eVO);
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectEmp
	
	
	
	
	
	

	
}//class

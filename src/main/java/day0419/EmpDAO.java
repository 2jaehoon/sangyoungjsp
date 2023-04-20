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
	 * 상당부분 동일한 DB 작업을 수행할 때 Dynamic Query를 작성하여 중복코드를 줄일 수 있다.
	 * 
	 * 동적쿼리(dynamic query): 상황에 따라 쿼리문이 다르게 생성되어 실행되는 것.
	 * 
	 * cp_emp 테이블의 모든 사원을 조회하거나 부서번호가 입력되면 부서번호에 해당하는 사원만 조회
	 * => 기준 : 부서 번호가 0번이면 모든 사원을 조회
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
			
			if(deptno != 0) {//동적쿼리
				selectAllEmp.append(" where deptno = ? ");
			}//end if
			
			selectAllEmp.append(" order by sal desc ");
			
			pstmt = con.prepareStatement(selectAllEmp.toString());
			
			if(deptno != 0) {//동적쿼리일 때 바인드 변수를 넣어준다.
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

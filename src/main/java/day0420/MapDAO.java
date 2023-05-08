package day0420;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class MapDAO {
	
	public List<MapVO> selectAllRestaurent()throws SQLException{
		
		List<MapVO> list = new ArrayList<MapVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dbCon.getConn();
			StringBuilder selectMap = new StringBuilder();
			selectMap
			.append(" select num, lat, lng, rest_name, info ")
			.append(" from map ");
			
			pstmt = con.prepareStatement(selectMap.toString());
			
			rs=pstmt.executeQuery();
			
			MapVO mVO = null;
			
			while( rs.next() ) {
				mVO = new MapVO( rs.getInt("num"), rs.getDouble("lat"), rs.getDouble("lng"), rs.getString("rest_name"), rs.getString("info") );
				list.add(mVO);
			}//end while
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally

		return list;
	}//selectAllRestaurent
	

}//class

<%@page import="java.util.ArrayList"%>
<%@page import="day0420.MapVO"%>
<%@page import="java.util.List"%>
<%@page import="day0420.MapDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
JSONObject jsonObj = new JSONObject();
jsonObj.put("rest_result", false);
try{
	
	MapDAO mDAO = new MapDAO();
	List<MapVO> list = mDAO.selectAllRestaurent();
	
	
	jsonObj.put("rest_cnt", list.size() );
	jsonObj.put("rest_result", list.size()!=-1);
	
	JSONArray jsonArr = new JSONArray();
	JSONObject jsonTemp = null;
	for( MapVO mVO : list ){
    	jsonTemp = new JSONObject();
    	jsonTemp.put("num", mVO.getNum() );
    	jsonTemp.put("lat", mVO.getLat() );
    	jsonTemp.put("lng", mVO.getLng() );
    	jsonTemp.put("name", mVO.getRest_name() );
    	jsonTemp.put("info", mVO.getInfo() );
    
    	jsonArr.add( jsonTemp );
    }//end for

	jsonObj.put("rest_data", jsonArr);
	
}catch( NumberFormatException ne ){
	
}catch(SQLException se){
se.printStackTrace();	
}

out.print( jsonObj.toJSONString() );
%>

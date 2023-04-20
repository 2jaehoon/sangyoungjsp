<%@page import="org.json.simple.JSONObject"%>
<%@page import="day0415.InjectionVO"%>
<%@page import="java.util.List"%>
<%@page import="day0415.InjectionDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="db table에서 조회된 결과를 사용하여 JSONArray 생성"
    %><%
    //1. JSONArray를 생성
    JSONArray jsonArr = new JSONArray();
    
    //2. JSONObject 생성하여 조회 결과를 할당
    InjectionDAO iDAO = new InjectionDAO();
    List<InjectionVO> list = iDAO.selectAllInjection();
    
    JSONObject jsonObj = null;
    /*기존 for문
    InjectionVO iVO = null;
    for( int i=0; i<list.size(); i++ ){
    	iVO = list.get(i);
    	jsonObj = new JSONObject();
    	jsonObj.put("id", iVO.getId() );
    	jsonObj.put("name", iVO.getName() );
    }//end for 
    */
    
    //개선된 for
    for( InjectionVO iVO : list ){
    	jsonObj = new JSONObject();
    	jsonObj.put("id", iVO.getId() );
    	jsonObj.put("name", iVO.getName() );
    	jsonObj.put("ip", iVO.getIp() );
    	jsonObj.put("input_date", iVO.getInput_date() );
        //3. JSONObject을 JSONArray 할당
        jsonArr.add(jsonObj);
    }
    

    //4. 출력
    out.print( jsonArr.toJSONString() );
%>
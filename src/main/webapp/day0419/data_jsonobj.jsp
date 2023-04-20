<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    //0. 데이터의 부가적인 정보를 가진 jsonobject 생성
    JSONObject jsonData = new JSONObject();
    //부가적인 정보를 할당
    jsonData.put("prdCo", "상준기업");
    jsonData.put("prdDate",
    		new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss").format(new Date())
    		);
    
    
    //1. JSONArray를 생성
    //데이터 검색이 되었는지? 언제 생성되었는지 부개적인 정보 필요
    		//jsonobject을 사용하여 부가정인 정보와 함께 데이터를 제공하게됨
    JSONArray jsonArr = new JSONArray();
    
    //2. JSONObject 생성하여 조회 결과를 할당
    InjectionDAO iDAO = new InjectionDAO();
    List<InjectionVO> list = iDAO.selectAllInjection();
    
    //부가적인 정보 할당
    jsonData.put("dataSize", list.size());
    jsonData.put("resultFlag", !list.isEmpty());
    
    if( !list.isEmpty() ){
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
        jsonData.put("category", "회원정보유출");
    }//end for
    //검색결과가 있을 때에만 data키가 JSONObject에 존재
    jsonData.put("data", jsonArr);
    }
    //4. 출력
    out.print( jsonData.toJSONString() );
%>
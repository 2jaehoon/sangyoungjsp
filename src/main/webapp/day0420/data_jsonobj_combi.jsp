<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="day0419.EmpDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info = "복합 JSONObject"
    %>
    <%
    String deptno = request.getParameter("deptno");
    if( deptno == null || "".equals(deptno) ){
    	deptno="0";//파라메터가 없으면 모든 사원을 조회
    }//end if
    
    JSONObject jsonObj = new JSONObject();
    jsonObj.put( "resultFlag",false );
    
    
    
    try{
    int intDeptno = Integer.parseInt( deptno );
    
    EmpDAO eDAO = new EmpDAO();
    List<EmpVO> list = eDAO.selectAllEmp( intDeptno );
    
   SimpleDateFormat sdf =  new SimpleDateFormat("MM-dd-yyyy a HH:mm");
   
    jsonObj.put( "resultFlag",list.size()!=-1 );
    jsonObj.put( "dataSize",list.size() );
    jsonObj.put( "searchDate", sdf.format(new Date() ) );
    
    JSONArray jsonArr = new JSONArray();//검색 결과를 저장할 JSONObject을 저장할 JSONArray
    JSONObject jsonTemp = null;//검색 결과를 저장할 JSONObject
    for( EmpVO eVO : list ){
    	jsonTemp = new JSONObject();
    	jsonTemp.put("empno", eVO.getEmpno() );
    	jsonTemp.put("ename", eVO.getEname() );
    	jsonTemp.put("job", eVO.getJob() );
    	jsonTemp.put("sal", eVO.getSal() );
    	jsonTemp.put("hiredate", sdf.format(eVO.getHiredate()) );
    	jsonTemp.put("deptno", eVO.getDeptno() );
    
    	jsonArr.add( jsonTemp );
    	
    }//end for
    //검색결과를 가진 JSONArray를 JSONObject에 저장
    jsonObj.put("empData", jsonArr);
    
    }catch( NumberFormatException ne ){
    	
    }catch(SQLException se){
    se.printStackTrace();	
    }
    
    out.print( jsonObj.toJSONString() );
    
    %>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info = "JSONArray 사용"
    %>
    
    <%
    //1. JSONObject을 저장할 JSONArray 생성( List)
    JSONArray ja = new JSONArray();
    //2. 데이터를 가진 JSONObject 생성
    JSONObject json = new JSONObject();
    json.put("name", "황충연");
    json.put("age", 25);
    
    JSONObject json2 = new JSONObject();
    json2.put("name", "윤상준");
    json2.put("age", 24);
    
    JSONObject json3 = new JSONObject();
    json3.put("name", "김경태");
    json3.put("age", 25);
    
    //3. JSONObject를 JSONArray 할당
    ja.add( json );
    ja.add( json2 );
    ja.add( json3 );
    
    //4. JSONArray를 출력
    out.print(ja);
    %>
    

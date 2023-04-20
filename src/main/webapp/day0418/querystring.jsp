<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="QueryString 받기"
    %><%
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("name", "처리된 이름 : " + name);
    jsonObj.put("age", "처리된 나이 : " + age);
    
    System.out.print( jsonObj.toJSONString() );//콘솔
    out.print(jsonObj.toJSONString());
    %>

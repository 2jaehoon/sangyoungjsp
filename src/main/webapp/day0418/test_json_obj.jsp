<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
<%
String name = "윤상준";
int age = 25;
String addr = "서울시 강남구 역삼동";
boolean flag = true;
// JSP 문자열로 JSONObject을 생성할 떄 이름을 문자열로 처리한다.
// {이름 : 값, 이름: 값,,,} => {"이름" : 값, "이름": 값,,,}

//json-simple.jar에서 제공하는 Library를 사용하여 JSONObject 생성
//1. 생성 : 값을 저장할 JSONObject 객체를 제공
JSONObject json = new JSONObject();
//2. 값 할당 : Map에서 제공하는 메서드 사용 - JSONObject에 값 설정한다.
json.put("name", name);
json.put("age", age);
json.put("addr", addr);
json.put("flag", flag);
//3. 값 사용 : 출력
out.print( json );

System.out.print(json.toJSONString());
System.out.print(json.get("name"));
%>



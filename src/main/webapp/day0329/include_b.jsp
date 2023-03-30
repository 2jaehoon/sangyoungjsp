<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 끼워지는 jsp에서는 html이 중첩되지 않도록 코드를 작성해야한다. -->
<% 
//여러 페이지에서 공통으로 사용하는 기능을 정의한다
String msg = "오늘은 수요일입니다."; %>
<strong>내부 jsp 파일</strong><br>
변수를 선언한 JSP에서 사용 : <mark><%= msg %></mark>

<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="forward 액션 태그"
    %>
    
    <%
    //한글로 파라메터 값을 전송하려면 요청 charset을 변경해야 한다.
    request.setCharacterEncoding("UTF-8");
    
    
    //데이터 처리 페이지
    String[] names = {"김경태", "윤상준", "김규미", "모민경"};
    //처리된 데이터를 뷰페이지로 넘기기 위해
    //scope 객체(request)의 setAttribute을 사용하거나 
	request.setAttribute("name", names[new Random().nextInt(names.length)] );
    //web parameter를 사용한다.<jsp:param>
    
    String param=request.getParameter("param_name");
    System.out.println("------------------------------------------------------------------------" + param);
    
    %>
    <!-- 단순 페이지 이동 -->
<%--     <jsp:forward page="forward_action_b.jsp" /> --%>
<!--  웹 파라메터를 생성한 페이지 이동 -->
    <!-- forward 태그안에는 param만 정의할 수 있다. -->
    <jsp:forward page="forward_action_b.jsp" > 
    <jsp:param name="addr" value="서울시 강남구 역삼동"/>
    <jsp:param name="age" value="20"/>
    </jsp:forward>
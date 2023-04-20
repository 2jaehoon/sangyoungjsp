<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자가 요청하여 업무를 처리하는 페이지 - view를 하지 않는다." 
    %>
    <!-- 업무로직을 처리하는 페이지에서는 화면 디자인에 대한 코드를 만들 필요가 없다. -->



 
<%
// 업무로직을 처리하는 일
  List<String> list = new ArrayList<String>();
list.add("add");
list.add("html");
list.add("jdbc");
list.add("oracle");

String name = "이재훈";

int[] value = new int[101];
for(int i=0; i<101; i++){
	value[i]=i;
}//end for

//1. 이동할 페이지를 설정하여 RequestDispatcher를 받는다.
RequestDispatcher rd = request.getRequestDispatcher("forward_b.jsp");
		
		//2. 업무처리된 결과를 view 페이지로 보내기 위한 설정
		//scope 객체 사용(page, request, session, application)
		request.setAttribute("subject",list );
		request.setAttribute("name",name );
		request.setAttribute("selectValue",value );

// 페이지 이동
rd.forward(request, response);
//3. 이 페이지를 요청할 때 생성된 request, response를 할당 하여 페이지 이동 수행
//rd.forward(request, response);


%>


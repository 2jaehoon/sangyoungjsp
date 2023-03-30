<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
//scriptlet 안의 코드는 _jspService method 안에 생성된다.
// java의 문법상 method는 중첩 정의를 할 수 없다.=> error
public void test(){
	
}
%> --%>
<%!
int age;
public String name(){
	return "이재훈";
}
	%>
	
	<%age = 27;//instance 변수에 값 할당 %>
	
	나이는 <%=age %>살<br>
	이름은 <%= name() %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%//scriptlet : JSP에서 method내의 자바 코드를 작성해야할 때 사용
//scriptlet 안에 정의된 코드는 _jspService method 안에 생성된다.
int age=25;//지역 변수
String name = "이단군";


%>
이름은 <%= name %>이고
나이는 <%= age %> 살<br>
<%
//scriptlet은 JSP에서 몇 개를 정의하든 java로 변경될 때 _jspService method 하나에
//정의된다.
name="윤상준";
age=24;
%>
이름은 <%= name %>이고
나이는 <%= age %> 살<br>

<%
//연산
int i = 3;
int j = 17;
int result = i+j;
%>
연산 결과 : <%= result %><br>

<select>
<%
//제어
for(int k=0; k<10; k++){
	%>
	<option value = "<%=k %>"><%=k %></option>
	<%
}//end for
%>
</select>

</body>
</html>
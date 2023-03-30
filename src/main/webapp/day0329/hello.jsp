<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
span{ font-size: 20px; font-weight: bold }
</style>
</head>
<body>
안녕하세요<br>
<%//scriptlet
String name = "윤상준";%>
내 이름은 <span><%= name %></span> 입니다.
</body>
</html>
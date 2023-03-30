<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
외부 jsp 파일
<div>
<!--  공통 기능이 필요한 jsp에서 include하여 공통 기능을 사용한다. -->
<%@ include file="include_b.jsp" %>
</div>
외부 jsp 파일<br>
내부 jsp 변수 : <%= msg %><!-- 변수가 공유가 된다. -->
</body>
</html>
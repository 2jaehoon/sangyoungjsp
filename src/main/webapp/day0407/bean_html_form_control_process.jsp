<%@page import="day0407.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "useBean 액션 태그를 사용한 web parameter 받기"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/main_v20230217.css"/> 
<style type="text/css">

#wrap{
width:1000px; height:1200px; margin:0px auto; /* background-color:#FF0000; */
}

#header{
height:200px; /* background-color:#00FF00; */
position:relative;
background:#FFF url(http://localhost/jsp_prj/common/images/header_bg.png) repeat-x;
}

#logo{
position:absolute; top:40px; left:100px; 
width:150px; font-weight:bold; font-size:40px; font-family:고딕; 
}

#naviBar{
position:absolute; top:140px; left:0px;
height:60px;
}

#container{
height:900px; /* background-color:#23A9FF; */
position:relative;
}

#footer{
height:100px; position:relative; /* background-color:#0766E6; */
}

#flogo{
position:absolute; left:600px; 
height:60px; font-weight:bold; font-size:20px; font-family:"맑은 고딕";
color:#d7d7d7;
} 


</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">

</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">container(w:1000 h:900)
<%
request.setCharacterEncoding("UTF-8");//GET 방식일 때에는 동작하지 않는다.
%>
<br>
<!-- web parameter을 받기 위한 useBean 액션태그를 선언 -->
<jsp:useBean id="pVO" class="day0407.ParamVO"/>
<!-- web parameter를 모든 setter method에 할당 -->
<jsp:setProperty property="*" name="pVO" />





<%
//입력된 값을 사용한 업무로직을 처리
String id = pVO.getId();//입력된 값을 얻기
//유효성 검증, 업무 로직 처리
if( id!= null&&!"".equals(id) ){
	MemberDAO mDAO = new MemberDAO();
	mDAO.insertMember(pVO);


%>


<%= id %>


 님 가입을 환영합니다.
가입 시 입력한 정보는 아래와 같습니다.
<br>
아이디 : <jsp:getProperty property="id" name="pVO"/><br>
비밀번호 : <jsp:getProperty property="password" name="pVO"/><br>
이름 : <jsp:getProperty property="name" name="pVO"/><br>
생일 : <jsp:getProperty property="birth" name="pVO"/><br>
전화번호 : <jsp:getProperty property="tel" name="pVO"/><br>
이메일 : <jsp:getProperty property="email" name="pVO"/><br>
성별 : <jsp:getProperty property="gender" name="pVO"/><br>
지역 : <jsp:getProperty property="location" name="pVO"/><br>
언어 : 배열의 주소<jsp:getProperty property="lang" name="pVO"/><br>
<%
//try catch로 처리하든 if로 처리한다.
	String[] lang = request.getParameterValues("lang");
if(lang!=null ){//배열이 존재하면 반복한다. 
for(int i=0; i<lang.length; i++){
%>
<%=lang[i] %>
<% 
}//end for
}else{%>
선택한 취미 없음
	<%
}//end else
%><br>
집 : <jsp:getProperty property="zipcode" name="pVO"/><br>
주소 : <jsp:getProperty property="addr" name="pVO"/><jsp:getProperty property="addr2" name="pVO"/><br> 

<%
}else{
	%>
	<h2>아이디는 필수 입력입니다.</h2>
	<%
}
%>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
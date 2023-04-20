<%@page import="day0410.CounterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="usebean 액션을 사용한 scope"
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


<div id="container">
<!--  1. 객체 생성 -->
<%--
page - 접속할 때마다 객체가 생성되기 때문에 값이 유지되지 않는다.
설정된 값은 현재 JSP에서만 사용된다.

request - 접속할 때마다 객체가 생성되기 때문에 값이 유지되지 않는다.
설정된 값은 현재 JSP와 forward로 이동한 JSP에서 사용된다.

session - 접속자마다 객체가 생성되기 때문에 값이 유지된다.
설정된 값은 접속자를 식별하며 모든 JSP에서 사용된다.(개인)

application - 최초 접속자에 의해 하나의 객체가 생성되고, 모든 접속자는 생성된 하나의 객체를 공유하여 사용한다.
설정된 값은 모든 JSP에서 사용된다.(전체)
--%>
<jsp:useBean id="cVO"  class="day0410.CounterVO" scope="session" />
<%
System.out.println(request.getRemoteAddr());
%>
<!--  2. setter method 호출 -->
<jsp:setProperty property="cnt" name="cVO" value="1"/>
<!--  3. getter method 호출 -->
<div>
당신은 이 페이지에 <strong><jsp:getProperty property="cnt" name="cVO"/></strong>번째 방문한 방문자입니다.
</div>

<div>
<!-- scriptlet과 expression을 사용하여 방문 횟수를 이미지로 보여주기!! -->
<%
//숫자를 문자열로 바꾼다.
String sCnt = Integer.toString(cVO.getCnt());
System.out.println(sCnt);
//모든 자리의 문자열을 잘라 이미지로 보여준다.
for(int i=0; i<sCnt.length(); i++){
	%>
<img alt="" src="image/num_<%=sCnt.charAt(i) %>.png">
	<%
}



%>
</div>
<a href="session_value.jsp">session 사용</a><br>
<a href="application_value.jsp">application 사용</a><br>




</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
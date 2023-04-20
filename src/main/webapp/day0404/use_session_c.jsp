<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="세션의 저장된 값을 얻는다."
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
//이름 사용 : 다른 jsp 파일의 값은 사용할 수 없다.
//해결하기 위해 : web parameter를 만들어서 보냄

//웹은 비연결성이기 때문에 이전 페이지의 web parameter는
//이동한 페이지에서 받을 수 없다. 이동한 모든 페이지에서 값을 사용할 때에는
//세션에 값을 저장하고 찾아서 사용한다.
String name = (String)session.getAttribute("user_name");
String addr = (String)session.getAttribute("user_addr");

if( name==null ){//세션에서 꺼내온 값이 없음.
	//redirect, location

%>
<script type="text/javascript">
alert('세션에서 꺼내온 값이 없음');
//location.href="use_session_a.jsp";
</script>
<%
//jsp코드는 자바스크립트보다 먼저 생성되어 실행된다.
//따라서 자바스크립트 코드는 실행되지 않는다.
response.sendRedirect("use_session_a.jsp");
}//end if
%>

<h2><%=name %>님의 작업 페이지</h2>
<%= name %>님의 주소는 <%= addr %>입니다.
<strong>${ sessionScope.user_name }</strong>님의 주소는 
<strong>${ sessionScope.user_addr }</strong>입니다.<br>
<a href="use_session_d.jsp">세션 삭제</a>

</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
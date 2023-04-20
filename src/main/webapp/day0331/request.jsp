<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="request 내장 객체를 사용한 접속자의 정보 얻기" %>
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
<ul>
<li><strong>요청방식</strong> : <%=request.getMethod() %></li>
<li><strong>요청방식</strong> : <%String method = request.getMethod(); %>
<%=method %></li>
<li><strong>접속자 ip 주소</strong> : <%=request.getRemoteAddr() %></li>
<li><strong>요청 url</strong> : <%=request.getRequestURL()%></li>
<li><strong>요청 프로토콜</strong> : <%=request.getProtocol()%></li>
<li><strong>요청 서버명</strong> : <%=request.getServerName()%></li>
<li><strong>요청 서버포트</strong> : <%=request.getServerPort()%></li>
<li><strong>요청 uri</strong> : <%=request.getRequestURI()%></li>
<li><strong>요청 서블릿 경로</strong> : <%=request.getServletPath()%></li>
<li><strong>요청 QueryString</strong> : <%=request.getQueryString()%></li>
<li><strong>요청 Parameter</strong> : <%=request.getParameter("name")%></li>
<li><strong>요청 Parameter</strong> : <%=request.getParameter("age")%></li>
<li>
<%
// 요청 Header의 이름을 받기
Enumeration<String> en = request.getHeaderNames();
String hName = "";
while(en.hasMoreElements()){//다음 요소가 존재하면 
	hName = en.nextElement();
	out.print( " 이름 " + hName + " , 값 : <strong>" +
	request.getHeader(hName) + "</strong><br>"  );// 값을 얻고 포인터를 다음으로 이동한다.
	
}//end while

%>
</li>
</ul>

<div style="font-size: 20px" >
<a href="/jsp_prj/day0331/request.jsp?name=yoonsanjun&age=20">요청</a>
<br>
<a href="request.jsp?name=yoonsanjun&age=20">요청</a>
</div>

</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
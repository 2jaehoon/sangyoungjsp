<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="업무로직을 처리한 결과를 받아 보여줄 목적으로 만드는 페이지"
    session = "true"
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
업무로직을 처리한 결과
<%
//request 객체에 저장된 결과를 받아서 화면을 만든다.
String name = (String)request.getAttribute("name"); //request.getAttribute("name");는 출력이 오브젝트로 나오기 때문에 스트링으로 캐스팅한다.
if(name==null){
	response.sendRedirect("forward_a.jsp");
	return;
}//end if


int[] value = (int [])request.getAttribute("selectValue");
List<String> list = (List<String>)request.getAttribute("subject");
%>
<marquee scrollamount="15"><h2><%=name %></h2></marquee>
<marquee scrollamount="15"><h2>${ requestScope.name  }</h2></marquee>
<marquee scrollamount="15"><h2>${ name  }</h2></marquee>

<input type="text" name="name"  class="inputBox" value="${  name }">
<br>


<label>score select</label>
<select>
<%for(int i=0; i<value.length; i++){ %>
<option><%=i %></option>
<%}//end for %>
</select>
<br>
<ul>
<%for(int i=0; i<list.size(); i++){ %>
<li><%=list.get(i) %> </li>
<%}//end for %>
</ul>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
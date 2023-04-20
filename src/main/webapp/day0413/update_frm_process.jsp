<%@page import="java.util.ArrayList"%>
<%@page import="day0413.InjectionVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day0413.InjectionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%
request.setCharacterEncoding("UTF-8");
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
<jsp:useBean id="iVO" class="day0413.InjectionVO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="iVO"/><!-- 모든 인풋으로 값을 넣어준다. -->
<%
InjectionDAO iDAO = new InjectionDAO();
try{
	List<InjectionVO> selectList = iDAO.selectInjectAll();
	session.setAttribute("selList", selectList);
	%>
	<c:forEach var="select" items=" ${ sessionScope.selList  }" varStatus="sNum">
<c:out value=" ${ sNum.count  }"/> <c:out value=" ${ select  }"/>
<c:if test="${ sNum.count%4==0 }">
<br>
</c:if>
</c:forEach>
	<% 
}catch(SQLException e){
	
}
%>
<hr>
<%
try{
InjectionVO selectVO = iDAO.selectInjectOne("이재훈");	
session.setAttribute("selOne", selectVO);	
%>
<c:forEach var="selectO" items=" ${ sessionScope.selOne  }" varStatus="sNumO">
<c:out value=" ${ sNumO.count  }"/> <c:out value=" ${ selectO  }"/>
</c:forEach>
<%
}catch(SQLException se){
	
}
%>
<hr>



<%
try{
int icnt = iDAO.updateInjection(iVO);
System.out.print(icnt);
if(icnt>0){
	%>
	업데이트 완료 ^ㅡ^
	<% 
}else{
	%>
	업데이트 실패
	<%
}
	
}catch(SQLException se){
	se.printStackTrace();
}
%>




</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
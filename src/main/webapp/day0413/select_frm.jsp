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

$(function() {
	$("#Ubtn").click(function(){
	    if ($("#id").val() == "") {
	        alert("아이디 필수 입력!!");
	        return;
	    }//end if
	    
	    if ($("#pass").val() == "") {
	        alert("비밀번호 필수 입력!!");
	        return;
	    }//end if
	   
	    if ($("#name").val() == "") {
	        alert("이름 필수 입력!!");
	        return;
	    }//end if
	    
	   if( $("#id").val().length > 19 ){
		   alert("아이디는 20자까지만 입력가능");
		   return;
	   }//end if
	    
	   if( $("#pass").val().length > 19 ){
		   alert("비밀번호는 20자까지만 입력가능");
		   return;
	   }//end if
	    
	    
	    $("#frm").submit();
	    
	});//click
	
	$("#Dbtn").click(function(){
	window.location.href="http://localhost/jsp_prj/day0413/delete_frm.jsp";
	    
	});//click
	

	
	});

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

<form action="http://localhost/jsp_prj/day0413/update_frm_process.jsp" method="post" id="frm" >
<table>
<tr>
<td style="width: 80px"><label>아이디</label></td>
<td style="width: 300px">
	<input type="text" name="id"  id ="id" class="inputBox" style="width: 240px"/> 
</td> 
</tr>
<tr>
<td style="width: 80px"><label>비밀번호</label></td>
<td style="width: 300px">
	<input type="password" name="pass" id ="pass" class="inputBox" style="width: 240px"/> 
</td> 
</tr>
<tr>
<td style="width: 80px"><label>이름</label></td>
<td style="width: 300px">
	<input type="text" name="name"  id ="name"   class="inputBox" style="width: 240px"/> 
</td> 
</tr>
<tr>
<td colspan="2">
<!--  .append(" update test_injection ")
			 .append(" set name=?, pass=? ")
			 .append(" where id=? "); -->
	<input type="button" value="업데이트" class="btnBorder" style="width: 100px" id="Ubtn"/> 
	<input type="button" value="삭제" class="btnBorder" style="width: 100px" id="Dbtn"/> 
</td> 
</tr>
</table> 

</form>






</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
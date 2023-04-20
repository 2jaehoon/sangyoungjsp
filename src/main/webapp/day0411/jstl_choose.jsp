<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL - choose 여러 조건을 비교할 때"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
$(function(){
	$("#btn").click(function(){
		$("form").submit();
	});
	
	
	var blood = "${ param.blood }";
	if(blood != ""){
	$("[name='blood']").each(function(ind, ele) {
		if( $(ele).val()  == blood){
			$(ele).prop("checked", true);
		}//end if
	});//each
	}//end if
});//ready
</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">container(w:1000 h:900)

<c:choose>
<c:when test="${ param.blood eq 'A' }">
<img alt="" src="images/a.png">
</c:when>
<c:when test="${ param.blood eq 'B' }">
<img alt="" src="images/	b.png">
</c:when>
<c:when test="${ param.blood eq 'AB' }">
<img alt="" src="images/ab.png">
</c:when>
<c:when test="${ param.blood eq 'O' }">
<img alt="" src="images/o.png">
</c:when>
<c:otherwise>
<strong>아래 혈액형을 선택하시고 요청을 클릭해주세요.</strong>
</c:otherwise>

</c:choose>

<%
boolean check = "A".equals(request.getParameter("blood"));
%>


<form action="jstl_choose.jsp" method="post">
<%-- <input type="radio" name = "blood" value="A"  ${ param.blood eq 'A'?"checked='checked'":""   }/>A형
<input type="radio" name = "blood" value="A"  <%=check ? "checked" : ""%>>A형
<input type="radio" name = "blood" value="B" ${ param.blood eq 'B'?"checked='checked'":""   }/>b형
<input type="radio" name = "blood" value="AB" ${ param.blood eq 'AB'?"checked='checked'":""   }/>ab형
<input type="radio" name = "blood" value="O" ${ param.blood eq 'O'?"checked='checked'":""   }/>o형
<input type="button" value = "요청" class="btnBorder" id = "btn" /> --%>

<input type="radio" name = "blood" value="A"  />A형
<input type="radio" name = "blood" value="B" />b형
<input type="radio" name = "blood" value="AB" />ab형
<input type="radio" name = "blood" value="O" />o형
<input type="button" value = "요청" class="btnBorder" id = "btn" />


</form>
</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
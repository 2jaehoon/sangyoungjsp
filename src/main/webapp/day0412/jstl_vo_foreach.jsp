<%@page import="day0412.TestVO"%>
<%@page import="java.util.List"%>
<%@page import="day0412.DataDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="EL에서 VO의 getter 호출"
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
table{ border:1px solid #333 }
th, td{ height: 20px; font-weight: normal; border: 1px solid #333; text-align: center; }

#numCol{ width:100px }
.nameCol{ width:300px }
.ageCol{ width:80px }

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
DataDAO dDAO = new DataDAO();
List<TestVO> list = dDAO.selectData();

//스콥 객체에 설정
pageContext.setAttribute( "dataList", list );
%>
<form>
<table>
<thead>
<tr>
<th id="numCol">번호</th>
<th class="nameCol">이름(수정x)</th>
<th class="ageCol">나이(수정x)</th>
<th class="nameCol">이름(수정O)</th>
<th class="ageCol">이름(수정O)</th>
</tr>
</thead>
<tbody>
<c:forEach varStatus="i" var = "data" items="${ dataList  }">
<tr>
<td><c:out value="${  i.count }"/> </td>
<td><a href="#void"><c:out value="${ data.name  }"/></a></td>
<td><c:out value="${ data.age  }"/></td>
<td><input type="text"  name="name" value="${data.name }" class="inputBox" />
<input type="hidden"  name="idNum" value="${data.idNum }"  />
</td>
<td><input type="text"  name="age" value="${data.age }" class="inputBox" /></td>
</tr>

</c:forEach>
</tbody>

</table>
</form>

</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
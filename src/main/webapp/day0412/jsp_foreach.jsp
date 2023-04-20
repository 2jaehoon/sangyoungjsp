<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "jstl - foreach"
    %>
    <!-- core taglib를 선언 -->
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

</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">container(w:1000 h:900)
<c:forEach var="i" begin="1" end = "100" step="1">
<c:out value="${  i }"></c:out>
</c:forEach>

<select>
<option value="none">--나이선택</option>
<c:forEach var="age" begin="10" end = "100" step="10">
<option value="${ age  }"><c:out value="${ age  }"/></option>
</c:forEach>
</select>


<br>
<!-- foreach를 사용한  -->
<table border="1">
<c:forEach var="i" begin="1" end = "9" step="1">

<tr>
<td>2 * <c:out value="${ i }"/> = <c:out value="${  2*i } "  /> </td>
</tr>

</c:forEach>
</table>

<%
String[] names = { "윤상준", "김경태", "황충연", "박진호", "김규미", "모민경" };

List<String> subjectList = new ArrayList<String>();
subjectList.add("Java SE");
subjectList.add("Oracle DBMS");
subjectList.add("JDBC");
subjectList.add("HTML");
subjectList.add("CSS");
subjectList.add("JavaScript");
subjectList.add("JSP");


//EL에서는 변수에 직접 접근할 수 없으므로 scope 객체에 배열이나 List를 할당한다.
pageContext.setAttribute("namesArr", names);
session.setAttribute("subList", subjectList);

//JSTL에서 scope 객체에 저장된 이름으로 사용
//<c:forEach var="변수명" items="스콥객체의 이름"/>
%>
<strong>배열 출력</strong><br>
<ul>
<c:forEach var="name" items="${ namesArr  }">
<c:set var="i" value="${ i+1  }" />
<li>
<c:out value=" ${ i  }"  />.
<strong><c:out value="${  name }" /></strong> </li>
</c:forEach>
</ul>

<strong>리스트 출력</strong><br>
<!-- varStatus 인덱스는 0번부터 카운트는 1번부터 시작
first는 처음번째방 last는 마지막 번째 방 값 -->
<ul>
<c:forEach var="subject" items=" ${ sessionScope.subList  }" varStatus="vNum">
<li><c:out value=" ${ vNum.index  }"/>,  <c:out value=" ${ vNum.count  }"/>, <c:out value=" ${ vNum.first  }"/>, <c:out value=" ${ vNum.last  }"/> <c:out value=" ${ subject  }"/>  </li>
</c:forEach>
</ul>



</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
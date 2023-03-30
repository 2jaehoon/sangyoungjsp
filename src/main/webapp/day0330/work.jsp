<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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


p{
text-align:center;
font-size:35px;
font-weight:bold;
}

table{
border: 1px solid #333;
border-collapse : collapse;
margin: 0px auto;
}





.tdCss{
border: 1px solid #333;
width:130px;
height:130px;
font-weight:normal;
vertical-align:top; 
padding-top:5px;
}
.todayTdCss{
border: 1px solid #183072;
background-color: #8995b2;
width:130px;
height:130px;
font-weight:normal;
vertical-align:top; 
padding-top:5px;
}

/* 요일별 글자 색깔 */
.satColor{
color:#0000FF;
}

.sunColor{
color:#FF0000;
}
.weekColor{
color:#333;
}

#sunTitle{ background-color: #e02828; font-weight: bold;color: #ffffff; height: 30px; width: 100px; border: 1px solid #333;}
#satTitle{ background-color: #183072; font-weight: bold;color: #ffffff; width: 100px; border: 1px solid #333; }
.weekTitle{ background-color: #ffffff; width: 100px; border: 1px solid #333; }
</style>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->


<script type="text/javascript">

</script>


</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container"><!-- container(w:1000 h:900)<br> -->


<%

Calendar cal = Calendar.getInstance();

//현재 년도, 월 구하기
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1;
int nowDay= cal.get(Calendar.DAY_OF_MONTH);

//현재 월의 마지막 날짜 구하기
int lastDay = cal.getActualMaximum(Calendar.DATE);

//현재 월의 1일로 cal 세팅
cal.set(nowYear,nowMonth-1,1);

//1일의 요일 구하기
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);


%>





<p>&lt;<%=nowYear%>-<%=nowMonth%>&gt;</p><br>

<table>
	<tr>
		<th id="sunTitle">일</th>
		<th class="weekTitle">월</th>
		<th class="weekTitle">화</th>
		<th class="weekTitle">수</th>
		<th class="weekTitle">목</th>
		<th class="weekTitle">금</th>
		<th id="satTitle">토</th>
	<tr>
	
<!--1일 시작 전 빈칸 -->	
<%for(int blackTd = 1 ; blackTd < dayOfWeek; blackTd++){ %>
		<td class="tdCss" ></td>
	<% }//end for %>
	
<!-- 1일~마지막일까지 채우기 -->	
<%
int setDate=0;
			String dateColorCss="";
			String tdCss="";
for(int tempDate=1 ; tempDate<33; tempDate++) { 
	//증가하는 임시 날짜를 달력 객체에 설정한다.
	cal.set(Calendar.DAY_OF_MONTH, tempDate);//달력은 현재 월애 없는 날짜가 설정되면 1로 적용
	//달력 객체에 설정된 현재 날짜를 얻는다.
	
	setDate = cal.get(Calendar.DAY_OF_MONTH);
	
	if(tempDate != setDate){//마지막 날이니?
			//나머지 빈 칸을 출력하고 cal객체는 다음 달 1일로 설정되어 있는 상태
			int startWeek=cal.get(Calendar.DAY_OF_WEEK);//1일의 요일
			for(int blankTd=startWeek; blankTd < Calendar.SATURDAY; blankTd++){
				%>
				<td class="tdCss"  ></td>
				<%
			}//end if
			
			break;//반복문을 빠져 나간다.
	}//end if
	
	//요일별 글자색
	switch(cal.get(Calendar.DAY_OF_WEEK)){
	case Calendar.SUNDAY: dateColorCss="sunColor"; break;
	case Calendar.SATURDAY: dateColorCss="satColor"; break;
	default: dateColorCss="weekColor";
	}
	
	//요일별 td의 색
	tdCss="tdCss";
	if(tempDate==nowDay){//오늘이니?
		tdCss="todayTdCss";
	}//end if
	
	//1일부터 <td>를 만들어서 출력
	%>
	<td class= "<%= tdCss %>" ><span class="<%= dateColorCss %>" ><%=tempDate %></span></td>
	<%
	//토요일이면 줄을 변경
	switch(cal.get(Calendar.DAY_OF_WEEK)){
	case Calendar.SATURDAY:%></tr><tr><%
	}
}//end for 

%>
</tr>
</table>
	


</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
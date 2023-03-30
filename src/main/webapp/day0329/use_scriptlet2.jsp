<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{ border:1px solid #333 }
td, th{ border:1px solid #333; width: 60px; height: 30px; text-align: center; font-weight: bold}
</style>
<!-- jQuery CDN start -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN end -->
<script type="text/javascript">
$(function(){
	$("tr:even").css("background","#C3e4EF");
});//ready

function resultValue(data1, data2){
	alert(data1 + "x" + data2 + " = " + data1*data2);
}
</script>

</head>
<body>
<%
for(int i = 1; i<7; i++){
	%>
	<h<%=i %>>안녕하세요</h<%=i %>>
	
	<%
}
%>
<br>

<select>
<option>1</option>
<option>2</option>
<option selected>3</option>
<option>4</option>
<option>5</option>
</select>

<select>
<%
	Calendar cal = Calendar.getInstance();
	int nowYear = cal.get(Calendar.YEAR);
for(int k = nowYear+2; k>nowYear-3; k--){
	 %>
	 <%
	 if(k==nowYear){
		 %>
		 <option selected value = "<%=k %>"><%=k %></option>
		 <%
	 }else{
	 %>
	<option value = "<%=k %>"><%=k %></option>
	 <%
	 }
}
	 %>
</select>

<select>
<option>---월---</option>
<%
	cal = Calendar.getInstance();
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	int lastDay = cal.get(Calendar.DATE);
for(int month = nowMonth-2; month<nowMonth+10; month++){
	 %>
	
	 <option <%=month==nowMonth?"selected='selected'":"" %>  ><%= month %></option>
	 <%
}
	 %>
</select>


<select>
<option>---일---</option>
<%
	
for(int day = 1; day<lastDay+1; day++){
	 %>
	
	 <option <%=day==nowDay?"selected='selected'":"" %>  ><%= day %></option>
	 <%
}
	 %>
</select>
<br>

<div>
<table>
<tbody>
<%for(int i=1; i<10; i++){ %>
<tr>
<%for(int j=2; j<10; j++){ %>
<td><a href ="#void" onclick="javascript:resultValue(<%= j %>,<%= i %>)"><%= j %> x <%=i %></a></td>
<%}//end for %>
</tr>
<%}//end for %>
</tbody>
</table>
</div>




</body>
</html>
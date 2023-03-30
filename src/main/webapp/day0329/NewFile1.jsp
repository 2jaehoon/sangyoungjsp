<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

int startDay = cal.getMinimum(Calendar.DATE);//1
int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
int start = cal.get(Calendar.DAY_OF_WEEK);//4
int newLine = 0;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String today = sdf.format(cal.getTime());//2023-03-29

%>
<div><h1><%=year%>-<%=month+1 %></h1></div>
<br>

<div>
<table>
	<thead>
		<tr>
			<td>
				<div id="sun">
					일
				</div>
			</td>
			<td >
				<div >월</div>
			</td>
			<td >
				<div >화</div>
			</td>
			<td >
				<div >수</div>
			</td>
			<td >
				<div >목</div>
			</td>
			<td >
				<div >금</div>
			</td>
			<td >
				<div id="sat">
					토
				</div>
			</td>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<%
			//처음 빈칸
			for (int index = 1; index < start; index++)
			{
				out.println("<td >&nbsp;</td>");
				newLine++;
			}
			for (int index = startDay; index <= endDay; index++)
			{
				String color = "";
				if (newLine == 0) {
					color = "red";
				} else if (newLine == 6) {
					color = "blue";
				} else {
					color = "black";
				};
				
				StringBuilder sb = new StringBuilder();
				String sYear = Integer.toString(year);
				String sMonth = Integer.toString(month+1).length()==1?"0" + Integer.toString(month + 1)
				: Integer.toString(month + 1);
				String sDay = Integer.toString(index).length()==1? "0" + Integer.toString(index) 
				: Integer.toString(index);
				sb.append(sYear).append("-").append(sMonth).append("-").append(sDay);
				
				String sSb = sb.toString(); //2023-03-29
	
				String backColor = "";

				if (sSb.equals(today)) { //2023-03-29랑 같을 경우에 백그라운드 바꾸기
					backColor = "#99ccff";
				}
				out.println("<td style='background-color: " + backColor + "; color: "+color+ "'>"+index);
			%>

			<%
			//out.println("<br>");
			//out.println(sb);
			//out.println("<br>");
			out.println("</td>");
			newLine++;
			if (newLine == 7)
			{
				out.println("</tr>");
				if (index <= endDay)
				{
					out.println("<tr>");
				}
				newLine = 0;
			}
			}//end for
		
//마지막 빈칸
			while (newLine > 0 && newLine < 7)
			{
			out.println("<td>&nbsp;</td>");
			newLine++;
			}
			%>
		</tr>
	</tbody>
</table>
</div>

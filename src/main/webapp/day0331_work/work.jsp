<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function openPop() {
		window.open("work2.jsp","popup","width=520, height=320,top="+(window.screenY+100)+", left="+(window.screenX+100));	
	};
</script>
</head>
<body>
<form name="frm" action="work2.jsp">
<label>아이디</label>
<input type="text" class="inputBox" readonly="readonly" id="id">
<input type="button" class="btnBorder" value="중복확인" onclick="openPop()">
</form>
</body>
</html>
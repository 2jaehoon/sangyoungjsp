<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
function dup() {
   var id=$('#id').val();
   var output="";
   
   if(id=="") {//JS의 유효성 검증
      alert("아이디를 입력해 주세요");
      $("#id").focus();
      return;      
   }//end if 
   
   //back-end로 전송( Web parameter )
   $("#frm").submit();
   
   
}//dup

function sendId(id) {
   opener.window.document.frm.id.value=id;
   self.close();
}//sendId
</script>
</head>
<body>

<form id="frm">
<label>아이디</label>
<input type="text" class="inputBox" id="id" name="id">
<input type="button" class="btnBorder" value="중복확인" onclick="dup()">
<% 
   //웹 파라메터가 존재하니? 
   String id=request.getParameter("id");
   //log("id : "+id); // log는 콘솔에 찍는 메소드이다.
   if( id != null && !"".equals(id) ){ //!"".equals(id) => NullPointerException이 발생x 코딩 / !id.equals("") => NullpinterException이 발생o
      String useId="kim,park,test_web,lee";
   
   //입력된 아이디가 사용 가능한지를 판단
   boolean flag=useId.contains(id);
%>
<div id="output">
<% 
   String msg="사용중인 아이디 입니다.";
   if(flag){
      msg="사용가능한 아이디 입니다.";
   }//end if
%>
<%= id %>는 <span style="color: <%= flag?"#000000":"#FF0000"%>"><%= msg %></span>
<%if(flag){ %>
<a href="javascript:sendId('<%= id%>')">사용</a>
<%}  %>
</div>
<% 
   }//end if
%>
</form>

</body>
</html>

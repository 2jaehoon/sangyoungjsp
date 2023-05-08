<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSONObject에 존재하는 값으로 지도 설정"
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

<!-- bootstrap 끝-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- bootstrap 끝-->


<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">

</script>
<!-- 다음 Map API 시작 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=485d89a2d18397a66e951d8680b90a96"></script>
<script type="text/javascript">
var map=null;
var mapContainer = null;
$(function(){
 mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}

$("#btnSist").click(function(){
	//JSONObject에 값 설정 : JSONObject 객체명.이름 = 값;
    mapOption.center= new kakao.maps.LatLng(37.499294, 127.0331883);  // 지도의 중심좌표


map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.499294, 127.0331883); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
 
});


$("#btnRest").click(function(){
	//인근 식당 정보를 AJAX를 사용하여 얻는다.
	$.ajax({
		url : "json_map_data.jsp",
		type : "GET",
		dataType : "json",
		error : function( xhr ){
			alert('죄송' + xhr.status + ' ' + xhr.statusText);
			
		},//error
		success : function( jsonObj ){
			if( !jsonObj.rest_result ){
				alert("인근 맛집은 존재하지 않습니다.");
				return;
			}
			//조회된 결과( JSONObject 내 JSONArray ) 로 배열 생성
			var positions = new Array();
			$.each( jsonObj.rest_data, function(i, ele) {
				positions[i] = { title : ele.name, latlng : new kakao.maps.LatLng(ele.lat, ele.lng) }
				
			});//end each
			
			//조회된 결과를 가지고마커 생성
			// 마커 이미지의 이미지 주소입니다
//var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
/* for (var i = 0; i < positions.length; i ++) {
    
   // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    }); 
}//end for */
	
$.each( jsonObj.rest_data, function(i, ele) {

				
var iwContent = '<div style="padding:5px;"><a href="#void" onclick="setInfo(\''+ele.info+'\')" style="color:blue">' + ele.name +  '</a> </div>',
// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	 iwPosition = new kakao.maps.LatLng(ele.lat+0.000020, ele.lng); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map); 
			
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

 for (var i = 0; i < positions.length; i ++) {
    
   // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    }); 
}//end for 		
			
			
marker.setMap(map);
});//end each

	
			
		}//success
	})//ajax
})//click

})//ready


function setInfo( info ){
	$("#divOut").html(info);
}
</script>
<!-- 다음 Map API 끝 -->

</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">
<div id="map" style="width:100%;height:350px;"></div>
<div>
<button type="button" class="btn btn-danger" id="btnSist">쌍용교육센터 위치</button>
<button type="button" class="btn btn-success" id="btnRest">인근 맛집</button>
</div>

<div id="divOut"></div>

</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>
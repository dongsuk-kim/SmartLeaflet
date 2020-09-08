<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>식자재마트 찾기</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!-- Import materialize.css -->
<link type="text/css" rel="stylesheet" href="/resources/css/materialize.min.css"  media="screen,projection"/>

<link rel="stylesheet" href="/resources/css/materialize.min.css"> 

<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<style>
	.info {
			border: 1px solid orange;
			margin: 5px;
			padding: 5px;
			
			height:110px;
			width:250px;
			line-height: 20px;
			font-size: 11pt;
	}
	
	/* 이미지 배너 슬라이드 */
	 .slider .indicators .indicator-item {
	  background-color: #666666;
	  border: 3px solid #ffffff;
	  -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	  -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	}
	.slider .indicators .indicator-item.active {
	  background-color: #ffffff;
	}
	.slider {
	  width: auto;
	  margin: 0 auto;
	}
	.slider .indicators {
	  bottom: 60px;
	  z-index: 100;
	  /* text-align: left; */
	}
	
	h2{
		color: orange;
	}
	h3{
		color: red;
	}
	.light grey-text text-lighten-3 {
		color: red;
	} 
	
	
</style>

<form>
<input type = 'hidden' class = ajaxTestArr value ="";>
</form>
<body>
   <!-- <div class = 'map'>
   	 <h4>
   		<img src = "/resources/img/logo/smartleaplet_logo.jpg" alt='' style="width: 50px; height: 20%;">
   			Smart Reaplet
     </h4>
   </div> -->
   <div id="map" style="width: 100%; height: 600px;"></div>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c4f8920783becb1367f5095717dcc9"></script>
   
   <script
     src="https://code.jquery.com/jquery-3.5.1.min.js"
     integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
     crossorigin="anonymous"></script>
     
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(37.570552, 126.985246), // 지도의 중심좌표 (서울 YMCA)
         level : 8
      // 지도의 확대 레벨 
      };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      const options = {
    		  enableHighAccuracy: true,
    		  maximumAge: 20000,
    		  timeout: 10000
      		};
      
      //GeoLocation을 이용해서 접속위치를 얻어오고 얻어온 접속위치를 지도의 센터로 맞추는 역활
      if (navigator.geolocation) {

         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         // 위치를 이동할 때 마다 알려주는 메소드 'watchPosition'
         navigator.geolocation.watchPosition(function(position) {
			console.log("position....");
			console.log(position);
			
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), 		// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            	message = '<div style="padding:5px;">현재위치!!</div>'; 	// 인포윈도우에 표시될 내용입니다

            	// 마커와 인포윈도우를 표시합니다
	            displayMarker(locPosition, message);
	            // 이동할 위도 경도 위치를 생성합니다 
	             var moveLatLon = new kakao.maps.LatLng(lat, lon);
	              // 지도 중심을 이동 시킵니다
	             map.setCenter(moveLatLon);
         
         },null,options);

      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

         var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

         displayMarker(locPosition,message);
      } 
      
      
      //displayMarker
      function displayMarker(locPosition, message) {

         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
            map : map,
            position : locPosition
         });

         var iwContent = message, // 인포윈도우에 표시할 내용
         iwRemoveable = true;

         // 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
            
         });

         // 인포윈도우를 마커위에 표시합니다 
         infowindow.open(map, marker);
         // 인포윈도우에 마우스를 올리면 메세지 출력(현재위치), 벗어나면 사라짐
         kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
         kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
      }
      // 인포윈도우를 표시하는 클로저를 만드는 함수입니다  //마우스 오버일때 표시
      function makeOverListener(map, marker, infowindow) {
         return function() {
            infowindow.open(map, marker);
         };
      }
      // 인포윈도우를 닫는 클로저를 만드는 함수입니다  //마우스 아웃일때
      function makeOutListener(infowindow) {
         return function() {
            infowindow.close();
         };
      }
      
      //ajax가 success일때 사용할 function    
         function ajaxTest(ajaxTestArr){
            
            $(ajaxTestArr).each(function(i, obj){
               console.log("mno==="+obj.mno);
               console.log("mlat=="+obj.mlat);
               console.log("mlng=="+obj.mlng);
               console.log("mlogo=="+obj.mlogo);
               
             var imageSrc = obj.mlogo, // 마커이미지의 주소입니다    
                 imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
                 imageOption = { offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
           
              // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
              var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption), 
                 markerPosition = new kakao.maps.LatLng(obj.mlat, obj.mlng);  // 마커가 표시될 위치입니다. 
              // 마커를 생성합니다
              var marker = new kakao.maps.Marker({
                 position : markerPosition,
                 image : markerImage // 마커이미지 설정 
              });
              // 마커가 지도 위에 표시되도록 설정합니다
              marker.setMap(map);
              // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
              var content = '<div class="customoverlay">';
              // 커스텀 오버레이가 표시될 위치입니다 
              var position = new kakao.maps.LatLng(obj.mlat, obj.mlng);
              // 커스텀 오버레이를 생성합니다
              var customOverlay = new kakao.maps.CustomOverlay({
                 map : map,
                 position :position,
                 content : content,
                 yAnchor : 1   
              });
              
              var iwContent = '<div class="info">마트이름 : '
              +obj.mname+' <br>마트주소 : '+obj.madd+'<br>전화번호 : '
              +obj.mtel+'<br><a href="#" onclick=gourl('+obj.mno+',"a");>'
              +obj.mname+'</a> <a href="https://map.kakao.com/link/to/'
              +obj.mname+','+obj.mlat+','+obj.mlng+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
               iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

              // 인포윈도우를 생성합니다
              var infowindow = new kakao.maps.InfoWindow({
                  position : iwPosition, 
                  content : iwContent 
              });
              //마커에 클릭이벤트를 등록합니다
            
              kakao.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다.
                    infowindow.open(map, marker);
                    setTimeout(function(){
                     //alert(3);
                       infowindow.open();
                    },2000)
              });        
                 
          });

         }

      function gourl(url,popName){
    	  //alert(popName);
    	  window.open(url,popName); // 새창 여는 구문
      }
      
      
      
      $.ajax({
         url:'/smart/mapAction',
         processData : false,
         contentType : false,   
         data : {},
            type : 'GET',
            dataType :'json',
            //성공시 이동
            success:function(result){   
               console.log(result);
               ajaxTest(result);
               //alert("result " + result);
         }
      });//ajax

</script>

<!-- 이미지 배너 슬라이드 -->

 <div class="slider" style="height:200px;">
    <ul class="slides">
      <li>
        <img src="/resources/img/sale/1-1.jpg"> random image
        <div class="caption center-align">
           <h2>웰빙마트</h2>
           <h3 class="light grey-text text-lighten-3">SUPER SALE!!</h3>
        </div>
      </li>
      <li>
        <img src="/resources/img/sale/2-1.jpg"> random image
        <div class="caption left-align">
           <h2>곰식자재마트</h2>
           <h3 class="light grey-text text-lighten-3">통큰파워 SALE!</h3>
        </div>
      </li>
      <li>
        <img src="/resources/img/sale/3-1.jpg"> random image
        <div class="caption right-align">
          <h2>모닝식자재마트</h2>
          <h3 class="light grey-text text-lighten-3">폭탄 SALE!!</h3>
        </div>
      </li>
      <li>
        <img src="/resources/img/sale/4-1.jpg"> random image
        <div class="caption center-align">
        <h2>고양하나로마트</h2>
        <h3 class="light grey-text text-lighten-3">창립19주년 초특가 감사제 SALE!</h3>
        </div>
      </li>
    </ul>
  </div> 

 <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
	$(document).ready(function() {
		$('.slider').slider();
	}); 
	
</script>  
  

</body>
</html>
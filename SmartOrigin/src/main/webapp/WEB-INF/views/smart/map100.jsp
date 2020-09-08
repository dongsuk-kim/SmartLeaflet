<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여러개 마커에 이벤트 등록하기1</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
   integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
   crossorigin="anonymous"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77889d0f01a7757dffeface0c08d54ba"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.570639, 126.985314), // 지도의 중심좌표 (서울 YMCA)  37.570639, 126.985314
			level : 8
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var imageSrc = '/resources/img/logo/1.jpg', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
			imageOption = { offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		var imageSrc2 = '/resources/img/logo/2.jpg',   
			imageSize2 = new kakao.maps.Size(64, 69),
			imageOption2 = { offset : new kakao.maps.Point(27, 69)}; 
			
		var imageSrc3 = '/resources/img/logo/3.jpg',
			imageSize3 = new kakao.maps.Size(64, 69), 
			imageOption3 = { offset : new kakao.maps.Point(27, 69)}; 	
		
		var imageSrc4 = '/resources/img/logo/4.jpg',    
			imageSize4 = new kakao.maps.Size(64, 69), 
			imageOption4 = { offset : new kakao.maps.Point(27, 69)}; 	
		
		var imageSrc5 = '/resources/img/logo/5.jpg',    
			imageSize5 = new kakao.maps.Size(64, 69), 
			imageOption5 = { offset : new kakao.maps.Point(27, 69)}; 
		
		var imageSrc6 = '/resources/img/logo/6.jpg',     
			imageSize6 = new kakao.maps.Size(64, 69), 
			imageOption6 = { offset : new kakao.maps.Point(27, 69)}; 	
		
		var imageSrc7 = '/resources/img/logo/7.jpg',     
			imageSize7 = new kakao.maps.Size(64, 69), 
			imageOption7 = { offset : new kakao.maps.Point(27, 69)}; 
			
			

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imageOption), markerPosition = new kakao.maps.LatLng(37.601536,127.032684);  // 마커가 표시될 위치입니다. 
		
		var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2,
				imageOption2), markerPosition2 = new kakao.maps.LatLng(37.640001,127.0363955); // 마커가 표시될 위치입니다		
		
		var markerImage3 = new kakao.maps.MarkerImage(imageSrc3, imageSize3,
				imageOption3), markerPosition3 = new kakao.maps.LatLng(37.6437544,126.7888473); // 마커가 표시될 위치입니다		
				
		var markerImage4 = new kakao.maps.MarkerImage(imageSrc4, imageSize4,
				imageOption4), markerPosition4 = new kakao.maps.LatLng(37.683461,126.746820); // 마커가 표시될 위치입니다	
				
		var markerImage5 = new kakao.maps.MarkerImage(imageSrc5, imageSize5,
				imageOption5), markerPosition5 = new kakao.maps.LatLng(37.648878,126.781076); // 마커가 표시될 위치입니다		
				
		var markerImage6 = new kakao.maps.MarkerImage(imageSrc6, imageSize6,
				imageOption6), markerPosition6 = new kakao.maps.LatLng(37.6202986,127.016731); // 마커가 표시될 위치입니다	
				
		var markerImage7 = new kakao.maps.MarkerImage(imageSrc7, imageSize7,
				imageOption7), markerPosition7 = new kakao.maps.LatLng(37.581447, 127.044408); // 마커가 표시될 위치입니다
				

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition,
			image : markerImage // 마커이미지 설정 
		});
		var marker2 = new kakao.maps.Marker({
			position : markerPosition2,
			image : markerImage2 // 마커이미지 설정 
		});		
		var marker3 = new kakao.maps.Marker({
			position : markerPosition3,
			image : markerImage3 // 마커이미지 설정 
		});		
		var marker4 = new kakao.maps.Marker({
			position : markerPosition4,
			image : markerImage4 // 마커이미지 설정 
		});
		var marker5 = new kakao.maps.Marker({
			position : markerPosition5,
			image : markerImage5 // 마커이미지 설정 
		});
		var marker6 = new kakao.maps.Marker({
			position : markerPosition6,
			image : markerImage6 // 마커이미지 설정 
		});
		var marker7 = new kakao.maps.Marker({
			position : markerPosition7,
			image : markerImage7 // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		marker2.setMap(map);
		marker3.setMap(map);
		marker4.setMap(map);
		marker5.setMap(map);
		marker6.setMap(map);
		marker7.setMap(map);

		// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var content = '<div class="customoverlay">'
				+ '  <a href="http://localhost:8088/smart/1" target="_blank">'
				+ '    <span class="title">웰빙마트</span>' + '</a>' + '</div>';
		
		var content2 = '<div class="customoverlay">'
				+ '  <a href="http://localhost:8088/smart/2" target="_blank">'
				+ '    <span class="title">곰식자재마트</span>' + '</a>' + '</div>';
				
		var content3 = '<div class="customoverlay">'
				+ '  <a href="http://localhost:8088/smart/3" target="_blank">'
				+ '    <span class="title">모닝식자재마트</span>' + '</a>' + '</div>';
				
		var content4 = '<div class="customoverlay">'
				+ '  <a href="http://localhost:8088/smart/4" target="_blank">'
				+ '    <span class="title">고양하나로마트</span>' + '</a>' + '</div>';
					
		var content5 = '<div class="customoverlay">'
				+ '  <a href="http://localhost:8088/smart/5" target="_blank">'
				+ '    <span class="title">오렌지식자재마트</span>' + '</a>' + '</div>';
				
		var content6 = '<div class="customoverlay">'
				+ '  <a href="http://localhost:8088/smart/6" target="_blank">'
				+ '    <span class="title">동북식자재마트</span>' + '</a>' + '</div>';
			
		var content7 = '<div class="customoverlay">'
				+ '  <a href="http://localhost:8088/smart/7" target="_blank">'
				+ '    <span class="title">현대코아식자재마트</span>' + '</a>' + '</div>';
				

		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(37.601536, 127.032684);
		var position2 = new kakao.maps.LatLng(37.640001, 127.0363955);
		var position3 = new kakao.maps.LatLng(37.6437544, 126.7888473);
		var position4 = new kakao.maps.LatLng(37.683461, 126.746820);
		var position5 = new kakao.maps.LatLng(37.648878, 126.781076);
		var position6 = new kakao.maps.LatLng(37.6202986, 127.016731);
		var position7 = new kakao.maps.LatLng(37.581447, 127.044408);  
		
		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
			map : map,
			position : position,
			content : content,
			yAnchor : 1
		});
		
		var customOverlay2 = new kakao.maps.CustomOverlay({
			map : map,
			position : position2,
			content : content2,
			yAnchor : 1
		});
		
		var customOverlay3 = new kakao.maps.CustomOverlay({
			map : map,
			position : position3,
			content : content3,
			yAnchor : 1
		});
		
		var customOverlay4 = new kakao.maps.CustomOverlay({
			map : map,
			position : position4,
			content : content4,
			yAnchor : 1
		});
		
		var customOverlay5 = new kakao.maps.CustomOverlay({
			map : map,
			position : position5,
			content : content5,
			yAnchor : 1
		});
		
		var customOverlay6 = new kakao.maps.CustomOverlay({
			map : map,
			position : position6,
			content : content6,
			yAnchor : 1
		});
		
		var customOverlay7 = new kakao.maps.CustomOverlay({
			map : map,
			position : position7,
			content : content7,
			yAnchor : 1
		});

		
		 if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다  , 126.985249
				message = '<div style="padding:5px;">현재위치?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(37.570681, 126.985249), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}  
		
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [{
			content : '<div>1번마트</div>',
			latlng : new kakao.maps.LatLng(37.569886, 126.986570)

		}, {
			content : '<div>2번마트</div>',
			latlng : new kakao.maps.LatLng(37.569924, 126.984501)
		}, {
			content : '<div>미진</div>',
			latlng : new kakao.maps.LatLng(37.570789, 126.979942)
		}, {
			content : '<div>이춘복참치</div>',
			latlng : new kakao.maps.LatLng(37.570002, 126.986845)
		}, {
			
		}];

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));

		}
		
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

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

	</script>



<script>
	/*  
	//10초마다 한번씩 동작하는 타이머
	setInterval(function(){
		
		//현재 위치를 조사하는 함수
		navigator.geolocation.getCurrentPosition(function(position){
		
			//전송해 줄 파라미터 만들기
			loc = position.coords.latitude + 
				"-" + position.coords.longitude;
			//ajax 요청하기
			$.ajax({
				url:"address",
				data:{"loc":loc},
				dataType:"json",
				success:function(data){
					document.getElementById("address").innerHTML = 
						"<h3>" + data.address + "</h3>";
				}
			});
			
		});	
	}, 3000); 
	*/   
</script>

<script>
	
	kakao.maps.event.addListener(marker,'click',function() {
		$.ajax({
			url: '/mapList',        // 클라이언트의 요청을 보낼 주소
			contentType: 'application/json; charset=UTF-8',
			data:JSON.stringify(data),	// 클라이언트 요청이나 데이터
				type: 'POST',	// 받아올 때의 형식:GET,POST
				dataType:'json', // 서버로 부터 받아오는 데이터 타입
				success:function(data){ // data는 서버로부터 받아온 데이터를 뜻하는 것.
					alert("Ajax success.....")
					console.log("통신성공 data.." + data);
				}
			,error : function(xhr,stat,err){
				alert("error....");
				console.log(err);
			}
		
			}); // $.ajax 끝  
	});
	
		
</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <link href="/resources/template/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/template/css/animate.min.css" rel="stylesheet"> 
  <link href="/resources/template/css/font-awesome.min.css" rel="stylesheet">
  <link href="/resources/template/css/lightbox.css" rel="stylesheet">
  <link href="/resources/template/css/main.css" rel="stylesheet">
  <link id="/resources/template/css-preset" href="/resources/template/css/presets/preset1.css" rel="stylesheet">
  <link href="/resources/template/css/responsive.css" rel="stylesheet">
  
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
  <![endif]-->
  
  <link rel="shortcut icon" href="/resources/template/images/favicon.ico">

  <!-- <script src="//code.jquery.com/jquery-2.2.0.min.js"></script>
  <script src="/resources/slideshow.js"></script> -->
  
  
  <!-- autosilde link,script 영역 -->
  <link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>
  <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

 <!-- cdn 중복오류 -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
 <script type="text/javascript" src="/resources/slick/slick.min.js"></script>

  
  
</head><!--/head-->
<style>

	.searchimg{
	
   		width: 250px;
   		height: 150px;
   }
   .martfont{
   		color:red;
   		font-size: large;
   		font-weight: bolder;
   }
   
   .searchDiv{
   	
	   width:300px;
	   height:250px;
	   padding:15px;
	   margin:15px;
	   border:solid; 2px; color:olive;
	   font-size: 1.5em;
   	
   }
	

	.autoimg {
		border: 5px solid orange;
		box-shadow: 10px 10px 20px red;
		
		
	}

	.img-responsive {
		
		width: 230px;
		height: 60px;
		margin-left: 30px;
	}
	
	/* 텍스트 테두리창 (말풍선처럼....하길 희망함)*/
	.info {
			border: 1px solid orange;
			margin: 5px;
			padding: 5px;
			
			height:110px;
			width:250px; 
			
			line-height: 20px;
			font-size: 11pt; 
			
	}
	

	
	/* 말머리 풍선 CSS */
	.oval-speech-border {
  position:relative;
  padding:5px 38px 13px;
  
  /* margin:1em auto 5px; */
  border:8px solid #f3961c;
  font-size: 11pt;
  text-align:center;
  color:#333;
  background:#fff;
  /* css3 */
  /*
  NOTES:
  -webkit-border-radius:240px 140px; // produces oval in safari 4 and chrome 4
  -webkit-border-radius:240px / 140px; // produces oval in chrome 4 (again!) but not supported in safari 4
  Not correct application of the current spec, therefore, using longhand to avoid future problems with webkit corrects this
  */
  -webkit-border-top-left-radius:240px 140px;
  -webkit-border-top-right-radius:240px 140px;
  -webkit-border-bottom-right-radius:240px 140px;
  -webkit-border-bottom-left-radius:240px 140px;
  -moz-border-radius:240px / 140px;
  border-radius:240px / 140px;
}

/* creates larger curve */
/* .oval-speech-border:before {
  content:"";
  position:absolute;
  z-index:2;
  bottom:-40px;
  right:50%;
  width:50px;
  height:30px;
  border-style:solid;
  border-width:0 10px 10px 0;
  border-color:#f3961c;
  margin-right:-10px;
  background:transparent;
  /* css3 */
  -webkit-border-bottom-right-radius:80px 50px;
  -moz-border-radius-bottomright:80px 50px;
  border-bottom-right-radius:80px 50px;
  /* reduce the damage in FF3.0 */
  display:block;
} */

/* creates smaller curve */
.oval-speech-border:after {
  content:"";
  position:absolute;
  z-index:2;
  bottom:-40px;
  right:50%;
  width:20px;
  height:31px;
  border-style:solid;
  border-width:0 10px 10px 0;
  border-color:#f3961c;
  margin-right:20px;
  background:transparent;
  /* css3 */
  -webkit-border-bottom-right-radius:40px 50px;
  -moz-border-radius-bottomright:40px 50px;
  border-bottom-right-radius:40px 50px;
  /* reduce the damage in FF3.0 */
  display:block;
}

/* creates a small circle to produce a rounded point where the two curves meet */
.oval-speech-border > :first-child:before {
  content:"";
  position:absolute;
  z-index:1;
  bottom:-40px;
  right:50%;
  width:10px;
  height:10px;
  margin-right:45px;
  background:#f3961c;
  /* css3 */
  -webkit-border-radius:10px;
  -moz-border-radius:10px;
  border-radius:10px;
}

/* creates a white rectangle to cover part of the oval border*/
.oval-speech-border > :first-child:after {
  content:"";
  position:absolute;
  z-index:1;
  bottom:-10px;
  right:50%;
  width:30px;
  height:15px;
  background:#fff;
  
}

	
	
	
</style>

<body>

  <!--.preloader-->
  <div class="preloader"> <i class="fa fa-circle-o-notch fa-spin"></i></div>
  <!--/.preloader-->

  <header id="home">
    <div id="home-slider" class="carousel slide carousel-fade" data-ride="carousel">
      <div class="carousel-inner">
        <div class="item active" style="background-image: url(/resources/template/images/slider/4-1.jpg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Smart Leaflet<br><span>스마트 전단지</span></h1>
            <p class="animated fadeInRightBig">고객님을 위한 실시간 프리미엄 전단지 서비스</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#contact">Click mart</a>
          </div>
        </div>
        <div class="item" style="background-image: url(/resources/template/images/slider/4-2.jpg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Smart Leaflet <br><span> 지역마트 <br>전단지</span></h1>
            <p class="animated fadeInRightBig">Customers real-time receive a leaflets service.</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#contact">Click mart</a>
          </div>
        </div>
        <div class="item" style="background-image: url(/resources/template/images/slider/6-1.jpg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Smart Leaflet <br><span>이젠 멀리찾지 마세요</span></h1>
            <p class="animated fadeInRightBig">Let's do this together. </p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#contact">Click mart</a>
          </div>
        </div>
      </div>
      <a class="left-control" href="#home-slider" data-slide="prev"><i class="fa fa-angle-left"></i></a>
      <a class="right-control" href="#home-slider" data-slide="next"><i class="fa fa-angle-right"></i></a>

      <a id="tohash" href="#contact"><i class="fa fa-angle-down"></i></a>

    </div><!--/#home-slider-->
    <div class="main-nav" style="height: 60px;">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          	<img class="img-responsive" src="/resources/img/logo/smartlogo.jpg" alt="logo" >
          	
        </div>
        
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right" style="display: block;">
            <li class="scroll active"><a href="#home">홈 화면</a></li>
            <li class="scroll"><a href="#contact">마트지도</a></li>       
            <li class="scroll"><a href="#blog">고객센터</a></li>
            <li class="scroll"><a href="#services">관리자 게시판</a></li>
            <li class="scroll"><br><input id="typekey" type="text" style="color: black;" maxlength="10">&nbsp;&nbsp;&nbsp;<i class="fa fa-search-plus" style="color: white" ></i></li> 
            <!-- <li class="scroll"><a href="#team">Team</a></li>
            <li class="scroll"><a href="#blog">Blog</a></li> -->
          </ul>
        </div>
      </div>
     
    </div><!--/#main-nav-->
  </header><!--/#home-->
  
	<!-- contact -->
    <!-- <section id="contact">
    <div id="google-map" class="wow fadeIn" data-latitude="52.365629" data-longitude="4.871331" data-wow-duration="1000ms" data-wow-delay="400ms" style="height: 750px"></div>
    <div id="contact-us" class="parallax">
      <div class="container">
        <div class="row">
          <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
            <h2>Contact Us</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam</p>
          </div>
        </div> -->
      <!-- contact us Name,Email Address,Subject... -->
   
   <!-- contact -->
   <section id="contact">   
   
    
   <div id="map" style="width: 100%; height: 600px;"></div>
   <div id="LR"></div>
   <div id="FB"></div>
   <div id="DIR"></div>
   <div class="autoplay" >
	    <img class="autoimg" src="/resources/img/banner/1-1.jpg" >
	    <img class="autoimg" src="/resources/img/banner/2-1.jpg" >
	    <img class="autoimg" src="/resources/img/banner/3-1.jpg" >
	    <img class="autoimg" src="/resources/img/banner/4-1.jpg" >
	    <img class="autoimg" src="/resources/img/banner/5-1.jpg" >
	    <img class="autoimg" src="/resources/img/banner/6-1.jpg" >
   </div>


<!-- 이미지 오토 슬라이드 스크립트 부분 -->
	<script>
	  $('.autoplay').slick({
	  slidesToShow: 4,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 2000,
	});
  </script>   
   
    			    
    <!-- Modal 추가 -->
	<div class="modal fade" id="MyModal" tabindex="-1" role="dialog"
	   aria-labelledby="mymodalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content" align="center">
	         
	         <div class="modal-body">
	         
	         </div>
	         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <button type="button" class="searchclose" data-dismiss="modal">Close</button>
	         </div>
	      </div>
	      <!-- /.modal-content -->
	   </div>
	   <!-- /.modal-dialog -->
   
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5e06cbe6921e3a1943ee89d9bddcd10"></script>
   
   <script
     src="https://code.jquery.com/jquery-3.5.1.min.js"
     integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
     crossorigin="anonymous"></script>
   
   
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(37.570552, 126.985246), // 지도의 중심좌표 (서울 YMCA)
         level : 5 // 지도의 확대 레벨 
      
      };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
     /*  // 지형도 타일 이미지 추가
      map.addOverlayMayTypeId(kakao.maps.MapTypeId.TERRAIN);
      // 로드뷰 타일 이미지 추가
      map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW); */
      
      /* const options = {
    		  enableHighAccuracy: true,
    		  maximumAge: 25000,
    		  timeout: 10000
      		}; */
      
      //GeoLocation을 이용해서 접속위치를 얻어오고 얻어온 접속위치를 지도의 센터로 맞추는 역활
      if (navigator.geolocation) {

         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         // 위치를 이동할 때 마다 알려주는 메소드 'watchPosition'
         navigator.geolocation.getCurrentPosition(function(position) {
			console.log("position....." + position);
			
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), 		// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            	message = '<div style="padding:5px;">현재위치 입니다.</div>'; 	// 인포윈도우에 표시될 내용입니다

            	// 마커와 인포윈도우를 표시합니다
	            displayMarker(locPosition, message);
	            // 이동할 위도 경도 위치를 생성합니다 
	             var moveLatLon = new kakao.maps.LatLng(lat, lon);
	              // 지도 중심을 이동 시킵니다
	             map.setCenter(moveLatLon);
	             
         }); // ,null,options

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
    	  
        	 var selectOveray = null; // 선택했을때 초기화 
            
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
              marker.setMap(map); // 마트 이미지가 나오는 곳
              // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
              
          	  var iwContent = '<div class="oval-speech-border">마트이름:'
                    +obj.mname+'<br>마트주소:'+obj.madd+'<br>전화번호: '
                    +obj.mtel+'<br><a href="#content" onclick=gourl('+obj.mno+',"a");>'
                    +obj.mname+'</a> <a href="https://map.kakao.com/link/to/'
                    +obj.mname+','+obj.mlat+','+obj.mlng+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //커스텀 오버레이 표시 위치입니다
          	  
          		// 커스텀 오버레이가 표시될 위치입니다 
                var iwPosition = new kakao.maps.LatLng(obj.mlat, obj.mlng);
                // 커스텀 오버레이를 생성합니다
                
              kakao.maps.event.addListener(marker, 'click', function() {
            	  var customOverlay = new kakao.maps.CustomOverlay({
                      map : map, // 맵에 표시
                      position : iwPosition,
                      content : iwContent,
                      yAnchor : 1   
                   });
            	  
                    setTimeout(function(){
					customOverlay.setMap(null);
                    	
                    },2000);
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
      });//ajax end
      
	
	// ajax 검색기능 영역... 
   	 var search = $(".fa");
   
     search.click(function(e){
        e.preventDefault();  
        
        var cat = $("#typekey").val();
         
        console.log("cat: " + cat);
        
           $.get('/smart/searchAction',{type: cat},function(result){   
               console.log(result);
               
           	setSearchForm(result);
           	
         });
     });

     if (window.DeviceOrientationEvent) {
         
         window.addEventListener('deviceorientation', function(eventData) {
             
       	   var LR = eventData.gamma;
             var FB = eventData.beta;
             var DIR = eventData.alpha;
             
             deviceOrientationHandler(LR, FB, DIR);
             
         }, false);
         
      } else {
         alert("지원하지 않는 브라우저 입니다.");
      }
      
      function deviceOrientationHandler(LR, FB, DIR) {
 		     
      	
      	document.getElementById("map").style.webkitTransform = "rotate(" + LR + "deg) rotate3d(1,0,0, " + (FB * -1) + "deg)";
      	document.getElementById("map").style.transform = "rotate(" + LR + "deg) rotate3d(1,0,0, " + (FB * -1) + "deg)";
      	document.getElementById("map").style.transform = "rotate(" + DIR + "deg) rotate3d(1,0,0, " + (FB * -1) + "deg)";
 		    
 		    /* document.querySelector("#LR").innerHTML = "gamma : " + Math.round(LR);
 		    document.querySelector("#FB").innerHTML = "beta : " + Math.round(FB);
 		    document.querySelector("#DIR").innerHTML = "alpha : " + Math.round(DIR); */
 			
 		}
     var str = ""; 
     
     //modal-body안에 append를 해줘서 값을 넣어준다.
     var mymodal=$(".modal-body");
	
     function setSearchForm(result) {
       
        $(result).each(function(){
           str+= "<div class='searchDiv'>"
           +"<div class='martfont'>마트이름: " + this.mname+"</div>"
           +"<div>상품이름: " + this.mp_name+"</div>"
           +"<div>상품가격: " + this.price+"</div>"
           +"<div><img class='searchimg' src="+this.mp_img+"></div></div>";
           
        });
        // 만들어진 str을 mymodal에 append 시켜준다.
        mymodal.append(str);
        $("#MyModal").modal("show");
        
		// alert(result.mp_name);
        
        
     }
     
     $(".searchclose").click(function(){
    	 str="";
    	 $(".searchDiv").remove();
    	
         
       });  



     
	</script>
</section><!--/#contact-->





<section id="blog">
    <div class="container">
      <div class="row">
        <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1200ms" data-wow-delay="300ms">
          <!-- <h2>여기부터 관리자 게시판...</h2> -->
          
        </div>
      </div>
      
      <div class="blog-posts">
        <div class="row">
          <div class="col-sm-4 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="400ms">
            <div class="post-thumb">
              <a href="#"><img class="img-responsive" src="/resources/template/images/blog/1.jpg" alt=""></a> 
              <div class="post-meta">
                <!-- <span><i class="fa fa-comments-o"></i> 3 Comments</span>
                <span><i class="fa fa-heart"></i> 0 Likes</span>  -->
              </div>
              <div class="post-icon">
                <i class="fa fa-pencil"></i>
              </div>
            </div>
            <div class="entry-header">
              <!-- <h3><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h3>
              <span class="date">June 26, 2014</span>
              <span class="cetagory">in <strong>Photography</strong></span> -->
            </div>
            <div class="entry-content">
              <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> -->
            </div>
          </div>
          
          <div class="col-sm-4 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="post-thumb">
              <div id="post-carousel"  class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#post-carousel" data-slide-to="0" class="active"></li>
                  <li data-target="#post-carousel" data-slide-to="1"></li>
                  <li data-target="#post-carousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <a href="#"><img class="img-responsive" src="/resources/template/images/blog/2.jpg" alt=""></a>
                  </div>
                  <div class="item">
                    <a href="#"><img class="img-responsive" src="/resources/template/images/blog/1.jpg" alt=""></a>
                  </div>
                  <div class="item">
                    <a href="#"><img class="img-responsive" src="/resources/template/images/blog/3.jpg" alt=""></a>
                  </div>
                </div>                               
                <a class="blog-left-control" href="#post-carousel" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                <a class="blog-right-control" href="#post-carousel" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a>
              </div>                            
              <div class="post-meta">
                <!-- <span><i class="fa fa-comments-o"></i> 3 Comments</span>
                <span><i class="fa fa-heart"></i> 0 Likes</span>  -->
              </div>
              <div class="post-icon">
                <i class="fa fa-picture-o"></i>
              </div>
            </div>
            <div class="entry-header">
              <!-- <h3><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h3>
              <span class="date">June 26, 2014</span>
              <span class="cetagory">in <strong>Photography</strong></span> -->
            </div>
            <div class="entry-content">
              <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> -->
            </div>
          </div>
          <div class="col-sm-4 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="800ms">
            <div class="post-thumb">
              <a href="#"><img class="img-responsive" src="/resources/template/images/blog/3.jpg" alt=""></a>
              <div class="post-meta">
                <!-- <span><i class="fa fa-comments-o"></i> 3 Comments</span>
                <span><i class="fa fa-heart"></i> 0 Likes</span>  -->
              </div>
              <div class="post-icon">
                <i class="fa fa-video-camera"></i>
              </div>
            </div>
            <div class="entry-header">
              <!-- <h3><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h3>
              <span class="date">June 26, 2014</span>
              <span class="cetagory">in <strong>Photography</strong></span> -->
            </div>
            <div class="entry-content">
              <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> -->
            </div>
          </div>                    
        </div>
        
        <!-- <div class="load-more wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
          <a href="#" class="btn-loadmore"><i class="fa fa-repeat"></i> Load More</a>
        </div>  -->
                       
      </div>
    </div>
  </section><!--/#blog-->





<!-- 관리자 게시판 -->
  <section id="services">
    <div class="container">
      <div class="heading wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
        
      </div>
      <div class="text-center our-services">
        <div class="row">
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="service-icon">
              <i class="fa fa-cloud"></i>
            </div>
            
            <div class="service-info">
            <a href=""></a>
              <h3>Brand Identity</h3>
             
            </div>
          </div>
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="450ms">
            <div class="service-icon">
              <i class="fa fa-umbrella"></i>
            </div>
            
            <div class="service-info">
            <a href=""></a>
              <h3>Creative Idea</h3>
             
            </div>
          </div>
          
          <!-- 관리자 게시판으로 연결함... -->
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="550ms">
            <div class="service-icon">
             <a href = "/board/list" target="_blank"> <i class="fa fa-cloud"></i></a>
            </div>
            
            <div class="service-info">
              <h3>관리자 게시판</h3>
            </div>
          </div>
         
          
          
        </div>
      </div>
    </div>
  </section><!--/#services-->
  
  <!-- 검색 -->
  <input type="text">

  

  <script type="text/javascript" src="/resources/template/js/jquery.js"></script>
  <script type="text/javascript" src="/resources/template/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/resources/template/js/jquery.inview.min.js"></script>
  <script type="text/javascript" src="/resources/template/js/wow.min.js"></script>
  <script type="text/javascript" src="/resources/template/js/mousescroll.js"></script>
  <script type="text/javascript" src="/resources/template/js/smoothscroll.js"></script>
  <script type="text/javascript" src="/resources/template/js/jquery.countTo.js"></script>
  <script type="text/javascript" src="/resources/template/js/lightbox.min.js"></script>
  <script type="text/javascript" src="/resources/template/js/main.js"></script>

</body>
</html>

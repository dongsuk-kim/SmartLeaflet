<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인트로 화면</title>

<META HTTP-EQUIV="Refresh" CONTENT="3;URL=./map"> 

<style>
	body {
	margin : 0;
	padding : 0;
	background : url (/resource/img/sale/2-1.jpg) center center fixed no-repeat;
}
video {
	position : fixed;
	top : 0; 
	left : 0;
	min-width : 100 %;
	min-height : 100 %;
	width : auto;
	height : auto;
	z-index : -1;
}
</style>

</head>
<body>
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script> 
	<!-- <img id = "loadingimg" style="display:none;" src="/resources/img/sale/2-1.jpg" alt="" width="100%" > -->
	<video id="loadingimg" style="display: none;" src="/resources/video/cat.mp4" width="80%" height="50%"></video>
	
	<!-- <video id="loadingimg" autoplay loop poster = "">
		<source src="/resources/video/cat.mp4" type="video / mp4">
	</video> -->
	
<script> 

  $(document).ready(function () {
       setTimeout(function() { 
			$("#loadingimg").fadeIn(3000); 
       }); 
  }); 
</script> 

</body>
</html>
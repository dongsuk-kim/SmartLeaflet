<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>

</head>
<body>

	<div class="autoplay">
		
	    <img alt="" src="/resources/img/banner/1-1.jpg" style="width: 120px"height="120px">
	    <img alt="" src="/resources/img/banner/2-1.jpg" style="width: 120px"height="120px">
	    <img alt="" src="/resources/img/banner/3-1.jpg" style="width: 120px"height="120px">
	    <img alt="" src="/resources/img/banner/4-1.jpg" style="width: 120px"height="120px">
	    <img alt="" src="/resources/img/banner/5-1.jpg" style="width: 120px"height="120px">
	    <img alt="" src="/resources/img/banner/6-1.jpg" style="width: 120px"height="120px">
   </div>

  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="/resources/slick/slick.min.js"></script>
  
  


  <script>
	  $('.autoplay').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 2000,
	});
  </script>
	
</body>
</html>
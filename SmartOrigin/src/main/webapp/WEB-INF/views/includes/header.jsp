<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
<!-- Character set configuration -->
<meta charset="UTF-8">
<title>PList - Bootstrap Product Layout Pack</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Viewport configuration, scaling options -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS Stylesheet -->
<link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="/resources/css/product-5.css" rel="stylesheet" type="text/css">
<link href="/resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="/resources/css/animations.css" rel="stylesheet" type="text/css">
<!-- Font Awesome icon -->
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<!-- Google web font  -->
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic|Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>

<body>
   <c:forEach items="${martlist }" var="mart">
      
      <div class="space-top" style="background-color: white;"> 
         <p class= "vw"><img src='${mart.mlogo }' width="100px" height="80px" >${mart.mname }</p>
      </div>
   </c:forEach>

 


          
 
        
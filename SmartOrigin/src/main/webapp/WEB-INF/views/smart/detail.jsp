<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      
      <meta name="description" content="">
      <meta name="author" content="">
      <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />
      <!-- Mobile Specific Meta -->
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="/resources/css/bootstrap.css">
      <!-- Main Stylesheets -->
      <link href="/resources/css/product-detail.css" rel="stylesheet"  id="menucss">
      <link href="/resources/css/product-2.css"  rel="stylesheet" type="text/css">
      <!-- Favicon Icon -->
      <link rel="shortcut icon" href="img/icons/favicon.ico">
      <!-- Google web font ---->
      <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
      <!-- Awesome font icon ---->
      <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <style>
	.space-top {
		background-color: #FFFFFF; #FFE400
		
	}
	
	.imgSrcArea {
		margin-top: -40px;
	}
	</style>
   
   
   <body>
      <!-- Space top -->
      <c:forEach items="${martlist }" var="mart"> 
      <div class="space-top" style="background-color: white;"> <img src='${mart.mlogo }' width="100px" height="120px"> ${mart.mname} </div>
      </c:forEach> 
      
      <div class="pld">
         <!--[if lt IE 8]>
         <!-- Product Simple Area Start -->
         <div class="product-simple-area">
            <div class="container">
               <div class="row">
               	<c:forEach items="${detail }" var="detail">
                  <div class="col-md-6 col-sm-6" >
                     
                        <div class="tab-content">
								<img src='${detail.mp_img }' class="imgSrcArea">
                        </div>
                        
                         <!-- Nav tabs -->
                        <!-- <ul class="product-tabs" role="tablist">
                           <li role="presentation" class="active"><a href="#one" aria-controls="one" role="tab" data-toggle="tab"><img src="https://placehold.it/170x150" alt=""></a></li>
                           <li role="presentation"><a href="#two" aria-controls="two" role="tab" data-toggle="tab"><img src="https://placehold.it/170x150" alt=""></a></li>
                           <li role="presentation"><a href="#three" aria-controls="three" role="tab" data-toggle="tab"><img src="https://placehold.it/170x150" alt=""></a></li>
                        </ul>  -->
                 
                  </div>
                  <div class="clearfix visible-xs"></div>
                  <div class="col-md-offset-1 col-md-5 col-sm-6">
                     <div class="single-product-details">
                        
                        <h3>${detail.mp_name }</h3>
                        <br>
                        <h3>원산지: ${detail.mp_origin }</h3>
                        <br>
                        <h3>유통기한: ${detail.mp_expire }</h3>
                        <br>
                        
                        <div class="single-product-price">
                           <h2>${detail.mp_price }</h2>
                           
                        </div>
                        
                        <!-- 수량 증가,감소 부분 -->
                        <div class="product-attributes clearfix">
                           <span class="pull-left" id="quantity-wanted-p">
                           <span class="dec qtybutton">-</span>
                           <input type="text" value="1" class="cart-plus-minus-box">
                           <span class="inc qtybutton">+</span>	
                           </span>
                       
                           <span>
                           <a class="cart-btn btn-danger" href="/smart/cart">
                           <span><i class="fa fa-cart-plus"></i> Add to Cart</span></a>
                           </span>
                          
                        </div>
                        
                        <!-- <div class="single-product-categories">
                           <label>Categories:</label>
                           <span>FootwearMen's > FootwearCasual > ShoesClarks > Casual</span>
                           <div class="clear"></div>
                           <label>Services:</label>
                           <span>Cash On Delivery available?</span>
                           <div class="clear"></div>
                           <label>Categories:</label>
                           <span>30 Days Exchange Policy?</span>
                           <div class="clear"></div>
                           <label>Payment Method</label>
                           <span>Safe and Secure Payments. Easy returns.</span>
                        </div> -->
                     </div>
                  </div>
                </c:forEach>
                
               </div>

            </div>
         </div>
         <!-- Product Simple Area End -->
         <!--Related Product Area Start-->
         
      </div>
    
    
   </body>
</html>

<%@ include file="../includes/footer.jsp" %>
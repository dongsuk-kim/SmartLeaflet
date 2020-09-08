<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%
	
	String cookieVal ="";
	//쿠키리스트를 불러온다.
	Cookie[] cookies = request.getCookies();
	//쿠키리스트를 돌면서 cart쿠키의 값을 꺼내온다.
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("cart")){
			cookieVal = cookies[i].getValue();
		}
	}
	
%>



<script src="https://code.jquery.com/jquery-3.5.0.min.js"
   integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
   crossorigin="anonymous"></script>

<script>

	var cookieVal = "<%=cookieVal%>";
	console.log("cookieVal==="+cookieVal);

</script>

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
   
	   	td,th {
	   		border: 1px solid gray;
	   	}
   	
   </style>
   
   <body>

      <!-- Space top -->
  
      <div class="pld">
         <!--Cart Page Area Start-->
         <div class="shopping-cart-area section-padding">
       
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     
                     
                     <div class="wishlist-table-area table-responsive">
                        
                        
                        <c:forEach items="${cart}" var="cart" >
                        <table class="table-bordered">
                           <thead>
                              <tr>
                                 <th class="product-remove">삭제</th>
                                 <th class="product-image">상품이미지</th>
                                 <th class="t-product-name">상품이름</th>
                                 <th class="product-unit-price">가격</th>
                                 <th class="product-quantity">수량</th>
                     
                              </tr>
                           </thead>
                           
                           
                           <tbody>

	
                              <tr>
                                 <td class="product-remove">
                                    <a href="#">
                                    <i class="fa fa-trash-o"></i>
                                    </a>
                                 </td>
                                 <td class="product-image">
                                    <a href="#">
                                    <img src="${cart.mp_img}" style="width:150px;height: 100px;">
                                    </a>
                                 </td>
                                 <td class="t-product-name">
                                    <h3>
                                       ${cart.mp_name}
                                    </h3>
                                 </td>
                                
                                 <td class="product-unit-price">
                                    <p>${cart.price }</p>
                                 </td>
                                 <td class="product-quantity product-cart-details">
                                    <input type="number" value="1">
                                 </td>

                              </tr>
                           </tbody>
                        </table>
                        
                        </c:forEach>
                        
                        
                     </div>
                     
	                     <div class="shopingcart-bottom-area">
	                       
	                       <table> 
	                       	<tr>
	                       		<th>합계 : </th>
	                       		<td><h2>₩${total}</h2></td>
	                       	</tr>
	
	                       </table>

                       
                        <div class="shopingcart-bottom-area pull-right">
                           
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <!-- Cart Page Area End  -->
      </div>
   </body>
</html>


<%@ include file="../includes/footer.jsp" %>

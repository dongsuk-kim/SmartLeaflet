<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>
      <!-- Space top -->

<head>
   <style>
   
      .sale-term {
         width: 100%;
         height: 250px;
         background-color: white;
      }
   
      table{
         width: 100%;
         
         border-collapse: collapse; /* 테두리 사이의 간격을 없애고 싶다면 */
         
      }
      
      
      td {
         background-color: white;
         
      }
      th {
         /* background-color: white; */
      }
      
      .sale {
         width: 100%;
      }
      
      .sale-image{
    
      font-size:2.1rem;
      width: 65%;
      height:50%;
      vertical-align: middle;
      border:1px solid black;
      border-radius: 1rem;
      }
   
      
      /* ////////////////////////////////////////////////////////////////////////////////////// */
      
      .banner {position: relative; width: 340px; height: 210px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
      .banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
      .banner ul li {float: left; width: 340px; height: 210px; margin:0; padding:0;}
      
      
      
   </style>
</head>


<div class="pld">
<!-- shop start -->
<div class="leftsidebar">
   <c:forEach items="${martlist}" var="product">
   <%-- <div class="sale-img" style="background: ${product.mbackground}">      --%>                                                                                    
         <center><div class="sale-image" >
            행사기간: <fmt:formatDate pattern="yyyy-MM-dd" value="${product.mstartdate }"/> ~ 
         <fmt:formatDate pattern="yyyy-MM-dd" value="${product.mlastdate }"/>
         </div></center>
      <img src="${product.msale }" class="sale"/>

   </div>
   </c:forEach>
   

  <!-- container start -->
  <div class="container">
    <div class="animatedParent">
      <!-- Row start -->
      <div class="row">
        <div class="col-xs-12 col-md-3 col-sm-4 col-lg-3">
          <div class="shop-left-sidebar">
            <!-- left widget start -->
            <div class="single-left-widget"> <!-- 카테고리 배경색 부분! -->
              <!-- Title Section Start -->
              <div class="section-title" align="center">
                <h4><i class="fa fa-tasks" aria-hidden="true" ></i> 카테고리</h4>
                <ul>
                  <!-- data-type은 커스텀타입으로 type로 인식함. 해서 이것에 대해 script로 넣을 수 있다. -->
                  <li><a href="" class="move" data-type="meat"> <i class="fa fa-shopping-cart"></i>육류</a></li>
                  <li><a href="" class="move" data-type="vegetable"><i class="fa fa-shopping-cart"></i>야채</a></li>
                  <li><a href="" class="move" data-type="aquatic"><i class="fa fa-shopping-cart"></i>수산물</a></li>
                  <li><a href="" class="move" data-type="fruit"><i class="fa fa-shopping-cart"></i>과일</a></li>
                  <li><a href="" class="move" data-type="industrial"><i class="fa fa-shopping-cart"></i>공산품</a></li>
                  <li><a href="" class="move" data-type="dairy"><i class="fa fa-shopping-cart"></i>유제품</a></li>
                  <li><a href="" class="move" data-type=""><i class="fa fa-shopping-cart"></i>모든제품</a></li>
                </ul>
              </div>
            </div>

            <!-- left widget start -->
            <div class="single-left-widget">
              <!-- Title Section Start -->
              
              <center><h4 style="color: white;"><a href= "/smart/cart"> <i class="fa fa-shopping-bag"></i> &nbsp;장바구니 </a></h4></center>
              
              <div class="section-title" align="center">
              
              
              
              <div class='row'>
                   <div class="col-lg-12">
                      <form id='smartsearch' action="/smart/${mno}" method="get">
                       
                        
                         <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>' />
                		 <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>
                         
                         
                      </form>
                   </div>
                </div>
              
              
              </div>
            
            
            </div>
            <!-- left widget start -->
           
 
           
          </div>
        </div>
        <div class="col-xs-12 col-md-9 col-sm-8 col-lg-9">
        
          <div class="row">
          <form id = 'actionForm' action = "/smart/${mno}" method='get'>
             <input type = 'hidden' name = 'pageNum' value = '${pageMaker.cri.pageNum }'>
             <input type = 'hidden' name = 'amount' value = '${pageMaker.cri.amount }'>
             <%-- <input type = "hidden" name ='type' id ='searchType' value ='${pageMaker.cri.type }' /> --%>
             <input type="hidden" name='type' id='searchType' value = '<c:out value="${pageMaker.cri.type }"/>'>
             <input type="hidden" name='keyword' value = '<c:out value="${pageMaker.cri.keyword }"/>'>
          </form>

          <div class="pull-right">
            <div class="shop-item-filter">
          <ul class="pagination">
              
                 <c:if test="${pageMaker.prev}">
                    <li class="paginate_button previous">
                       <a href="${pageMaker.startPage-1}"> Previous</a>
                    </li>
                 </c:if>
                 
                 <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                    <li class="paginate_button ${pageMaker.cri.pageNum==num?"active":""}"> 
                    <a href="${num}">${num}</a></li>      
                 </c:forEach>
                 
                 <c:if test="${pageMaker.next }">
                    <li class="paginate_button next">
                       <a href="${pageMaker.endPage+1}">Next</a>
                    </li>
                 </c:if>
                </ul>
             </div>
            </div>
            
            
            
          <div class="clearfix"></div>
          <div class="tab-content">
         
         
            <div id="grid" class="tab-pane active" role="tabpanel" align="center">
              <!-- Row start -->
              <div class="row" >
              
              <c:forEach items="${list}" var="product">
                <div class="col-xs-12 col-md-3 col-sm-6 col-lg-3" >
                  <!-- Shop Product -->
                  <div class="shop-single-products">
                    <div class="single-product" >
                      <div class="single-product-item" >
                        <div class="single-product-img clearfix hover-effect">
                          
                            <!-- 코드 수정한 부분! (파라미터값 가져오는 부분)-->
                            
                            <a href="detail?mp_no=${product.mp_no}&mno=${product.mno}" class="animated flipInY"> 
                            <div class="new-sale"> <span class="red">SALE</span> </div>
                           <img class="primary-image" src="${product.mp_img }"> </a> </div>
                           
                        <div class="single-product-info clearfix">
                        
                          <div class="pro-rating"> 
                             <i class="fa fa-star"></i> 
                             <i class="fa fa-star"></i> 
                             <i class="fa fa-star"></i> 
                             <i class="fa fa-star-o"></i> 
                             <i class="fa fa-star-o"></i> 
                          </div>
                          
                          <!-- Product Price -->
                          <div class="pro-price"><span class="new-price">${product.price }</span> </div>
                          <h3><center><a href="product-detail.html" class="animated flipInY">${product.mp_name }</a></center></h3>
                        </div>
                        <!-- Fontawesome Icon -->
                        <div class="wish-icon-hover text-center">
                          <ul>
                            <li ><a rel="tooltip" title="장바구니" ><i class="fa fa-shopping-cart" title=${product.mp_no}></i></a></li>
                            <li><a href="detail?mp_no=${product.mp_no}&mno=${product.mno}" rel="tooltip" title="View Detail"><i class="fa fa-eye"></i></a></li>
                            <li><a href="#" rel="tooltip" title="좋아요"><i class="fa fa-heart"></i></a></li>
                            
                            <!-- 코드 수정한 부분! (파라미터값 가져오는 부분)-->
                            <!-- 이모티콘 주석으로 안보이게함! -->
                            <!-- <li><a href="#" rel="tooltip" title="Share it!"><i class="fa fa-shopping-cart-alt" aria-hidden="true"></i></a></li> -->
                          </ul>
                              <input class="cartdata" type='hidden' value=${product.mp_no}>
                        </div>
                        
                      </div>
                    </div>
                  </div>
                </div>
                </c:forEach>
          </div>
          
          </div>
              <!-- Row End -->   
        </div><!-- End <div id="grid" class="tab-pane active" role="tabpanel"> -->
            
          </div>
          
        </div>
      </div>
      <!-- Row End -->
    </div>
  </div>
  <!-- container end -->
</div>
</div>


<script src="https://code.jquery.com/jquery-3.5.0.min.js"
   integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
   crossorigin="anonymous"></script>
   
   
<script>
   $(document).ready(function () {
   
    /* paging */ 
         var actionForm = $("#actionForm");
         
         $(".paginate_button a").on("click", function (e) {
            
            e.preventDefault(); // 페이지 이동이 없도록 기본적인 이벤트 막는것! 
            
            console.log('click');
            
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
         });
         
         var $banner = $(".banner").find("ul");  
         
         
   });
   
   /* search */
   var searchForm = $("#actionForm"); // 객체를 생성해줘야 함. searhForm id에 대한...
   
   $(".move").on("click",function(e) {
         
      e.preventDefault(); // 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드!
      
      var cat = $(this).data("type"); // cat은 카테고리!
      
      /* alert(cat); */ // cat으로 모든 type들을 확인 할 수 있다.
      
      $("#searchType").val(cat) // searchType에 대한 val에 객체 cat을 호출.
      
      searchForm.find("input[name='pageNum']").val(1);
      searchForm.attr("search","/smart/paper");
      searchForm.submit(); // submit으로 searchForm을 실행시킴
      
   });
   
   var smartsearch=$("#smartsearch");
   
   $("#smartsearch button").click(function(e){
   
      if(!smartsearch.find("option:selected").val()){
         
      alert("검색종류를 확인하세요");
      return false;
      }
      
      if(!smartsearch.find("input[name='keyword']").val()){
      alert("키워드를 입력하세요");
      return false;
      }
      
      smartsearch.find("input[]").val("1");
      e.preventDefault();
      
      smartsearch.submit();
   });

 

   $(".fa-shopping-cart").click(function(){
	  
	   // 장바구니 클릭시 알림창으로 값이 들어갔는지 확인.
	   // alert("aaa"); 
	  
	   
	  var popupcookie = window.open("popup?cart="+this.title,"popup","width:300px,height:300px");
	   
	
	  
	   
	   
   });
   

</script>   
   


<%@ include file="../includes/footer.jsp" %>
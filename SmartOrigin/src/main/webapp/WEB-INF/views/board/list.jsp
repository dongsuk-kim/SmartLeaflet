<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="../include/header.jsp" %>    
<head>
	<style>
		th,td {
			text-align: center;
		}
	</style>
</head>

        <!-- Begin Page Content -->
        <div class="container-fluid">
        

          <!-- Page Heading -->
			<br>
          <h1 class="h3 mb-2 text-gray-800">관리자 게시판</h1>
      
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            <!-- 상품등록,수정,삭제할때 결과 값이 나와서 안보이게 히든으로 처리함. -->
              <h6 class="m-0 font-weight-bold text-primary" style="visibility: hidden;">${result }</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
				<tr>
					<th>게시물번호</th>
					<th>마트이름</th>
					<th>마트관리자</th>
					
					<!-- <th>내용</th> --> <!-- 내용 문단까지 지워야함 -->
					<th>할인시작</th>
					<th>할인종료</th>
					<th>등록날짜</th>
					<th>수정날짜</th>
					
				</tr>
				</thead>
					
                    <c:forEach items="${list }" var="board">
                    <tbody>
                    	<tr>
                    		<!-- bno 번호창에 a class='move'를 넣어줘야지 스크립트에서 값을 가져올 수 있다. -->
                   			<td><a class='move' href='<c:out value="${board.ano }"/>'>  <!-- bno에 값을 빼서 에러가 나옴 -->
                   			<c:out value="${board.ano }"/></a></td>
                   			
                    		<td><a class='move' href='<c:out value="${board.ano }"/>'>
                    		<c:out value="${board.mname }" /> <%-- <b>[  <c:out value="${board.replyCnt }" />  ] </b> --%></a>
                    		</td>
                    		<td><c:out value="${board.ad_writer}" /></td>
                    		<td><c:out value="${board.start_date }" /></td>
                    		<td><c:out value="${board.end_date }" /></td>
                    		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                    		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.moddate }"/></td>
                    		

                    	</tr>
                    </c:forEach>
                  </tbody>
                  <button id="regBtn" class='btn btn-primary'>상품등록</button>
                </table>
                
                <!-- 검색 조건과 키워드 보여주는 부분 -->
                <div class='row'>
                	<div class="col-lg-12">
                		<form id='searchForm' action="/board/list" method="get">
                			<select name='type'>
                				<option value="" 
                				<c:out value="${pageMaker.cri.type == null?' selected':'' }"/>>--</option>
                					<option value="t"
                					<c:out value="${pageMaker.cri.type eq 't'?'selected':'' }"/>>제목</option>
                					<option value="c"
                					<c:out value="${pageMaker.cri.type eq 'c'?'selected':'' }"/>>내용</option>
                					<option value="w"
                					<c:out value="${pageMaker.cri.type eq 'w'?'selected':'' }"/>>작성자</option>
                					<option value="tc"
                					<c:out value="${pageMaker.cri.type eq 'tc'?'selected':'' }"/>>제목 or 내용</option>
                					<option value="tw"
                					<c:out value="${pageMaker.cri.type eq 'tw'?'selected':'' }"/>>제목 or 작성자</option>
                					<option value="twc"
                					<c:out value="${pageMaker.cri.type eq 'twc'?'selected':'' }"/>>제목 or 내용 or 작성자</option>
                			</select>
                			<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
                			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>' />
                			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>
                			<button class='btn btn-primary'>Search</button>
                		</form>
                	</div>
                </div>
                
                
                
				<div class='pull-right'>
                 <div>
						<nav aria-label="Page navigation example">
							<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" var="num" end="${pageMaker.endPage }">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}" >
									<a class="page-link" href="${num}">${num }</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next">
									<a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
								</li>
							</c:if>

							</ul>
						</nav>
					</div>
				</div>
                
                
                <!-- Modal 추가 -->
				 <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel"></h4>
								</div>
							  	<div class="modal-body">상품이 등록되었습니다.</div> 
								<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
								<!-- <button type="button" class="btn btn-secondary"></button> -->
							</div>
						</div>
					</div>
				</div> 
               </div>
            </div>
          </div>
          
          <!-- bno에 주석처리한 부분이 문제였음! -->
          <form id='actionForm' action="/board/list" method='get'>
   		 	<%-- <input type="hidden" name="bno" value="${board.bno }"> --%> 
          	<input type="hidden" name='pageNum' value = '${pageMaker.cri.pageNum }'>
          	<input type="hidden" name='amount' value = '${pageMaker.cri.amount }'>
          	<!-- 검색 조건과 키워드에 대한 처리가 되면 검색 후 페이지를 이동해서 동일한 검색 사항들이 계속 유지되는 것을 확인! -->
          	<input type="hidden" name='type' value = '<c:out value="${pageMaker.cri.type }"/>'>
          	<input type="hidden" name='keyword' value = '<c:out value="${pageMaker.cri.keyword }"/>'>
          </form>
          
 <!-- SweetAlert CDN-->
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>         
          
    <script>
		 $(document).ready(function() {
			console.log("Ready...................");
			
			var result = '<c:out value="${result}"/>';
			
			console.log(result);
			
			checkModal(result);
			 
/* 			history.replaceState({},null,null); */
			 	
			function checkModal(result) {
				
				// result 값이 아무것도 없다면... list.jsp에서 result를 확인!
				
				if(result === '') { 
					return;
				} else if('success' === result){
					$(".modal-body").html("상품이 등록되었습니다.");
				} else if('modify' === result) {
					$(".modal-body").html("상품이 수정되었습니다.");
				} else if('remove' === result) {
					$(".modal-body").html("상품이 삭제되었습니다.");
				}
				$("#myModal").modal("show");
			} 
			// regBtn 이벤트 함수
			// button id 값을 안넣었음!
			$("#regBtn").on("click", function() {
				self.location = "/board/register";
			});
			
			var actionForm = $("#actionForm");
			
			$(".page-link").on("click",function(e) {
				e.preventDefault(); // 이벤트 안걸리게 설정
				
				console.log('click');
				
				// find : 하위로 내려가는 것
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click",function(e) {
				console.log("event check");
				
				e.preventDefault();
				
				actionForm.append("<input type='text' name='ano' value='" + $(this).attr("href") + "'>"); 
				actionForm.attr("action","/board/read");
				actionForm.submit();
			});
			
		});
		 
		// 검색 버튼의 이벤트 처리 
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click",function(e) {
			
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
	</script>
</div>

	

<!-- /.container-fluid -->
      
<%@include file="../include/footer.jsp" %> 

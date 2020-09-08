<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/header.jsp" %> 
<div class="container-fluid">

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class='panel-heading'><h1>상품조회</h1></div>
			<div class="panel-body">
			
				<div class="form-group">
				<label>상품번호</label> <input class="form-control" name='ano' value='<c:out value="${board.ano }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>마트이름</label> <input class="form-control" name='ano' value='<c:out value="${board.mname }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>마트관리자</label>
					<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.ad_writer }"/></textarea>
				</div>
				
				<div class="form-group">
					<label>할인시작날짜</label> <input class="form-control" name='writer' readonly="readonly" value='<c:out value="${board.start_date }"/>'>
				</div>
				<div class="form-group">
					<label>할인종료날짜</label> <input class="form-control" name='writer' readonly="readonly" value='<c:out value="${board.end_date }"/>'>
				</div>
			
				
				<button data-oper='modify' class="btn btn-info" >수정</button>
				<button data-oper='list' class="btn btn-info" >목록</button>
				
				<!-- 조회 페이지에서 검색 처리 -->
				<form id='operForm' action="/board/modify" method="get">
					<input type="hidden" id='ano' name='ano' value='<c:out value="${board.ano }"/>'>
					<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
					<input type="hidden" name='keyword' value='<c:out value="${cri.keyword }"/>'>
					<input type="hidden" name='type' value='<c:out value="${cri.type }"/>'>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 첨부 파일이 보여질 영역 -->
<div class='row'>
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>
</div>


<style>
	.uploadResult {
		width:100%;
		background-color: gray;
	}
	.uploadResult ul{
		display:flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align: center;
	}
	
	.uploadResult ul li img{
		width: 150px;
		height: 200px;
	}
	
	.uploadResult ul li span{
		color:white;
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top:0%;
		width: 100%;
		height:100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255,255,255,0.5);
	}
	
	.bigPicture {
		position: relative;
		display:flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img {
		width: 600px;
	}
	
</style>

<!-- 파일첨부 영역 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<div class="panel-heading">파일첨부</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div class='uploadResult'>
					<ul>
					</ul>
				</div>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->	
	</div>
	<!-- end panel -->
</div>
<!-- /.rows -->


<!-- 관리자 게시판은 댓글이 필요없으니까 주석으로 처리함 -->
<!-- 댓글 목록 -->
<!-- <br>
<div class='row'>

  <div class="col-lg-12">

    /.panel
    <div class="panel panel-default">
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> 댓글 목록
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 작성</button>
      </div>
      
      /.panel-heading
      <div class="panel-body">
      
        <ul class="chat">
			
        </ul>
        ./ end ul
      </div>
      /.panel .chat-panel
		<div class="panel-footer"></div>

		</div>
  </div>
  ./ end row
</div> -->

<!-- 댓글 목록 표시 영역 -->
</div>

<!-- 모달 추가 -->
<!-- Modal -->
<div class="modal readModal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>내용</label>
					<input class="form-control" name='reply' value='New Reply!!!'>
				</div>
				<div class="form-group">
					<label>글쓴이</label>
					<input class="form-control" name='replyer' value='replyer'>
				</div>
				<div class="form-group">
					<label>날짜</label>
					<input class="form-control" name='replyDate' value=''>
				</div>
				
			</div>
		<div class="modal-footer">
			<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
			<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
			<button id='modalRegisterBtn' type="button" class="btn btn-primary">생성</button>
			<button id='modalCloseBtn' type='button' class='btn btn-default'>닫기</button>
		</div>
		<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- 모달추가 끝! -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(e){
			
			operForm.attr("action","/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click",function(e){
			
			operForm.find("#ano").remove();
			operForm.attr("action","/board/list")
			operForm.submit();
		});
	});
	
</script>



<script type="text/javascript" src="/resources/js/reply.js"></script>


<!-- 댓글 이벤트 처리 -->

<script>

/* 댓글 시간 */
$(document).ready(function() {
	
	
	var anoValue = '<c:out value="${board.ano}"/>';
	var replyUL = $(".chat");
	
	showList(1); // 최근 댓글이 첫 페이지의 상단부터 정렬되서 showList(1)로 처리함.
	
	// 댓글의 페이지를 호출하는 부분!
	// page 변수를 이용해서 원하는 댓글 페이지를 갖고오게 된다. 만약 page 번호가 -1로 전달되면 마지막 페이지로 찾아서 다시 호출한다.
	// 사용자가 새로운 댓글을 추가하면 showList(-1);를 호출해서 우선 전체 댓글의 숫자를 파악하고 이후에 다시 마지막 페이지를 호출해서 이동시키는 방식으로 동작시킴
	function showList(page) { 
		
		console.log("show list" + page); 
		
		replyService.getList({ano:anoValue,page: page|| 1}, function(replyCnt,list) {
			
			console.log("replyCnt: " + replyCnt); 
			console.log("list: " + list);
			console.log(list);  
			
			   if(page == -1) {
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				console.log(pageNum + "1111111");
				return;
			}     
		
			console.log("--------------------------");
			
			console.log(list);
			console.log("==========================");
			
			var str = "";
			
			if(list == null || list.length == 0) {
				replyUL.html(""); // 댓글 페이징에서 다음버튼을 눌렀을때 비어져있는 화면을 말해줌.
				console.log("00000000000");
				return;
			}
			
			for(var i=0, len = list.length || 0; i < len; i++) {
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="    <div><div class='header'><strong class='primary-font'>" + list[i].replyer+"</strong>";
				str +="    <small calss='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
				str +="    <p>" + list[i].reply+"</p></div></li>"; 
			}
			console.log(str);
			
			replyUL.html(str);
			// showReplyPage()의 추가
			showReplyPage(replyCnt);
			
		}); // end function
		
	}// end showList
	
	
	// 댓글 페이지 보이기 화면처리
	 var pageNum=1;
	   var replyPageFooter=$(".panel-footer");
	   
	   function showReplyPage(replyCnt){
	     /*  console.log("replyCnt: " + replyCnt);  */
		   
	      var endNum = Math.ceil(pageNum/10.0)*10;
	      console.log("EndNum="+endNum);
	      var startNum = endNum-9;
	      
	      var prev = startNum !=1;
	      var next = false;
	      
	      if(endNum*10 >= replyCnt){
	         endNum = Math.ceil(replyCnt/10.0);
	      }
	      
	      if(endNum * 10 < replyCnt){
	         next = true;
	      }
	      
	      var str = "<ul class ='pagination pull-right'>";
	      
	      if(prev){
	         str += "<li class = 'page-item'><a class ='page-link'href ='"+(startNum-1)+"'>Previous</a></li>";
	      }
	      for(var i =startNum; i<=endNum; i++){
	         var active = pageNum ==i?"active":"";
	         
	         str+="<li class = 'page-item"+active+" '><a class ='page-link'href ='"+i+"'>"+i+"</a></li>";
	      }
	      
	      if(next){
	         str+="<li class = 'page-item'><a class ='page-link'href ='"+(endNum+1)+"'>Next</a></li>";
	      }
	      str+="</ul></div>";
	      console.log(str);
	      
	      replyPageFooter.html(str);
	   }
	
	// replyPageFooter 이벤트 메서드 생성
	// 마지막 처리는 페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 하는 부분.
	replyPageFooter.on("click","li a", function(e) {
		e.preventDefault(); // 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드!
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
		
	}); 
	
	
	var modal = $(".readModal"); // $(".readModal")로 모달이름 변경! -> 모달창 띄울때 중복되지 않을려고
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#modalCloseBtn").on("click",function(e) {
		modal.modal('hide');
	});
	
	$("#addReplyBtn").on("click",function(e){
		
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide(); // 버튼 숨김
		
		modalRegisterBtn.show();
		
		$(".readModal").modal("show"); // 에러 났던 부분!(modal.)으로 해야했는데 $(".modal")로 입력해서 모달창이 두번이나 나왔었다. 다시 $(".readModal")로 변경
		
	});
	
	/* 새로운 댓글 추가 처리 */

	modalRegisterBtn.on("click",function(e) {
		
		var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				ano:anoValue
			};
		replyService.add(reply, function(result) {
			
			alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(1); // 댓글 추가 후 다시 댓글의 목록을 갱신할 필요!(showList(1)) */	
			 /* showList(-1); */ 
			
		});
		
	});
	
	/* 댓글 조회 클릭 이벤트 처리 */
	$(".chat").on("click","li", function(e) {
		
		var rno = $(this).data("rno");
		
		console.log(rno); // 103으로 찍혔음 번호:96378 쪽에서
		
	    replyService.read(rno, function(reply){
	    	
	    	modalInputReply.val(reply.reply);
	    	modalInputReplyer.val(reply.replyer);
	    	modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
	    	.attr("readonly","readonly");
	    	modal.data("rno",reply.rno);
	    	
	   		modal.find("button[id !='modalCloseBtn']").hide();
	   		modalModBtn.show();
	   		modalRemoveBtn.show();
	   		
	   		$(".readModal").modal("show");
	    	
	    });
		
	});
	
	/* 댓글 수정 */
	 modalModBtn.on("click",function(e){
		
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		
		replyService.update(reply, function(result){
			
			alert(result);
			modal.modal("hide");
			/* showList(1); */
			showList(pageNum); // 댓글의 수정
			
		});
		
	}); 
	
	/* 댓글 삭제 */
	/* data-rno 값을 이용해서 처리 */
	 modalRemoveBtn.on("click", function (e) {
		
		var rno = modal.data("rno");
		
		replyService.remove(rno, function(result) {
			
			alert(result);
			modal.modal("hide");
			/* showList(1); */
			showList(pageNum); // 댓글의 삭제
			
		});
		
	});
	
});

</script>

<script>
/* 게시물 조회 화면 처리 */
$(document).ready(function(){
	(function(){
		
		var ano = '<c:out value="${board.ano}"/>';
		
		/* 화면을 보여주는 부분! */
		$.getJSON("/board/getAttachList", {ano: ano}, function(arr){
			
			console.log("ano: " + ano);
		   
			console.log("arr: " + arr);
			
			var str = "";
			
			$(arr).each(function(i, attach) {	
				
				// image type
				if(attach.fileType) {
					var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_" +attach.uuid +"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename= '"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else {
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<span> " + attach.fileName+"</span><br/>";
					str += "<img src='/resources/img/attach.jpeg'>";
					str += "</div>";
					str + "</li>";
				}
			});
			
			console.log("----------------------------------");
			console.log(str);
			
			$(".uploadResult ul").html(str); // 화면에 뿌려주는 소스코드
			
		}); // end getjson
		
	})(); // end function
	
	$(".uploadResult").on("click","li", function(e) {
		console.log("view image");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		
		/* 코딩 수정.................. */
		if(liObj.data("type")){
			
			// 특별히 관리자 게시판에는 상품이미지를 구지 클릭해서 크게 보여줄 필요가 없다고 생각해서 일단 주석으로 처리했음!
			// showImage(path.replace(new RegExp(/\\/g),"/"));
		}else {
			//download
			self.location = "/download?fileName=" + path
		}
		
	});
	
	function showImage(fileCallPath) {
		// alert(fileCallPath); // 경고창 (fileCallPath) 경로설정
		
		$(".bigPictureWrapper").css("display","flex").show();
		
		$(".bigPicture")
		.html("<img src='/display?fileName="+fileCallPath+"'>")
		.animate({width:'100%', height: '100%'}, 1000);
		
	}
	
	/* 원본 이미지 창 닫기 */
	$(".bigPictureWrapper").on("click",function(e) {
		$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		setTimeout(function() {
			$('.bigPictureWrapper').hide();
		}, 1000);
	});
	
});

</script>



<%@include file="../include/footer.jsp" %> 
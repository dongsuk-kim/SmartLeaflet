<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/header.jsp"%>
<div class="container-fluid">
	

<form role="form" action="/board/modify" method="post">
<h1>상품수정 </h1>

<div class="panel-body">

<div class="form-group">
	<label>상품번호</label> <!-- ano -->
	<input class="form-control" name='ano' value='<c:out value="${board.ano }" />' readonly="readonly">
</div>

<div class="form-group">
	<label>마트이름</label>
	<input class="form-control" name='mname' value='<c:out value="${board.mname }" />'>
</div>
<div class="form-group">
	<label>마트관리자</label>
	<input class="form-control" name='ad_writer' value='<c:out value="${board.ad_writer }" />'>
</div>

<div class="form-group">
	<label>할인시작날짜</label>
	<input class="form-control" name='start_date' value='<c:out value="${board.start_date }"/>'>
</div>

<div class="form-group">
	<label>할인종료날짜</label>
	<input class="form-control" name='end_date' value='<c:out value="${board.end_date }"/>'>
</div>

<div class="form-group">
	<label>현재날짜</label>
	<input class="form-control" name='regDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/>' readonly="readonly">
</div>

<div class="form-group">
	<label>수정날짜</label>
	<input class="form-control" name='modDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.moddate }"/>' readonly="readonly">
													
</div>

<button type="submit" data-oper='modify' class="btn btn-default">수정하기</button>
<button type="submit" data-oper='remove' class="btn btn-danger">삭제하기</button>
<button type="submit" data-oper='list' class="btn btn-info">목록가기</button>

<!-- 추가 -->
<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
<!-- 수정/삭제 페이지에서 검색 처리 추가 -->
<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>

</div>

<div class="bigPictureWrapper">
	<div class="bigPicture">
	</div>
</div>

<!-- 첨부 파일 데이터 보여주기 -->
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
		width: 100px
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
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple="multiple">
				</div>
				
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

</form>


				<!-- Modal 추가 -->
				 <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">상품수정</h4>
								</div>
							  	<div class="modal-body">상품이 수정되었습니다.</div> 
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



<script>
/* 게시물 수정 이벤트 처리 */
$(document).ready(function () {
	
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		
		e.preventDefault(); // <a>,<submit>태그는 고유의 동작이 있다. 페이지를 이동시킨다거나 form 안에 있는 input 등을 전송한다던가 그러한 동작이 있는데 e.preventDefault 는 그 동작을 중단시킨다.
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove') {
			formObj.attr("action","/board/remove");
			
		}else if(operation === 'list'){
			// move to list
			formObj.attr("action","/board/list").attr("method","get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			
		}else if(operation === 'modify'){
			
			console.log("submit clicked!!");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i,obj){
				
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				
				console.log("str!!!: " + str);
				
			});
			formObj.append(str).submit();
		}
		
		formObj.submit();
		
	});
});

</script>

<!-- 첨부 파일 보여주는 작업 JS -->
<script>

$(document).ready(function() {
	
	(function() {
		
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
					str += "<span> " + attach.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else {
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
					str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<span> " + attach.fileName+"</span><br/>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
					str += " class='btn btn-warning btn-circle'><i class='fa fa-time'></i></button><br>";
					str += "<img src='/resources/img/attach.jpeg'>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			console.log("----------------------------------");
			console.log(str);
			
			$(".uploadResult ul").html(str); // 화면에 뿌려주는 소스코드
			
		}); // end getjson
	})(); //end function 
	
	/* 첨부파일 삭제 클릭 이벤트 -1- */
	$(".uploadResult").on("click","button",function(e) {
		
		console.log("delete file");
		
		if(confirm("파일을 삭제 하시겠습니까? ")){
			
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	
	
	var result = '<c:out value="${result}"/>';
	
	console.log(result);
	
	checkModal(result);
	
	function checkModal(result) {
		
		// result 값이 아무것도 없다면... list.jsp에서 result를 확인!
		
		if(result === '') { 
			return;
		} else if('modify' === result){
			$(".modal-body").html("게시글 수정되었습니다.");
		}
		$("#myModal").modal("show");
	} 
	
	
});

</script>

<script>
var regex = new RegExp("(.*?)\(exe|sh|zip|alz)$");
var maxSize = 2042880 * 4; // 80MB

function checkExtension(fileName, fileSize) {
	
	if(fileSize >= maxSize) {
		alert("파일 사이즈 초과");
		return false;
	}
	
	if(regex.test(fileName)) {
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
		return true;
}

$("input[type='file']").change(function(e) {
	
	var formData = new FormData();
	
	var inputFile = $("input[name='uploadFile']");
	
	var files = inputFile[0].files;
	
	for(var i =0; i < files.length; i++) {
		
		if(!checkExtension(files[i].name, files[i].size) ){
			return false;
		}
		formData.append("uploadFile",files[i]);
		
	}
	
	$.ajax({
		url: '/uploadAjaxAction',
		processData: false,
		contentType: false,
		data:formData,
		type: 'POST',
		dataType:'json',
		success: function(result){
			console.log(result);
			showUploadResult(result); //업로드 결과 처리 함수 
		}
	}); // $.ajax
	
});

function showUploadResult(arr) {
	if(!arr || arr.length == 0) {return;}
	
	var uploadUL = $(".uploadResult ul");
	
	var str = "";
	
	$(arr).each(function(i,obj) {
		
		// image type
		if(obj.image){
			var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_" + obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str += " data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"'data-type='"+obj.image+"'";
			str += " ><div>";
			str += "<span> " + obj.fileName + "</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>"
			str += "</li>";
			console.log("str : " + str);
		}else{
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			
			str += "<li ";
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> " + obj.fileName +"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.jpeg'></a>";
			str += "</div>";
			str += "</li>";
			
		}
		
	});
	
	/* 첨부파일 삭제 클릭 이벤트  -2- */
	$(".uploadResult").on("click","button", function(e) {
		
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		/* if(confirm("파일을 삭제 하시겠습니까? ")) {
			var targetLi = $(this).closest("li");
			targetLi.remove;
		} */
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType:'text',
			type: 'POST',
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
		}); // $.ajax
		
	});
	uploadUL.append(str);
}


</script>

</div>




<%@ include file="../include/footer.jsp"%>
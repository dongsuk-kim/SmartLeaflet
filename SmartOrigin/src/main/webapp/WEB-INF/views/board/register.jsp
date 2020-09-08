<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h3 class="m-0 font-weight-bold text-primary">상품등록</h3>
		</div>
		<div class="card-body">
			<form role="form" action="/board/register" method="post">
				
				<div class="form-group">
					<label>마트이름</label>
					<input class="form-control" name='mname'>
				</div>

				<div class="form-group">
					<label>마트관리자</label>
					<input class="form-control" name='ad_writer'>
				</div>

				<div class="form-group">
					<label>할인시작</label>
					<input class="form-control" rows="3" name='start_date'>
				</div>

				<div class="form-group">
					<label>할인종료</label>
					<input class="form-control" name='end_date' >
				</div>

				<button type='submit' class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-primary">초기화 </button>
			</form>
		</div>
	</div>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="row">
	 			<div class="col-lg-12">
	 				<div class="panel panel-default">
	 			
	 					<div class="panel-heading">파일첨부</div>
	 					<!-- /.panel-heading -->
	 						<div class="panel-body">
	 							<div class="form-group uploadDiv">
	 								<input type="file" name='uploadFile' multiple>
	 							</div>
	 					
	 							<div class="uploadResult">
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
			<!-- /.row  -->
		</div> 
		<!-- card-header py-3 -->
  	</div>
  	<!-- card shadow mb-4 -->

</div>
<!-- /.container-fluid -->

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



<script>

$(document).ready(function(e) {
	
	var formObj = $("form[role='form']");
	
 	$("button[type='submit']").on("click",function(e){
		
		e.preventDefault(); // 기본 동작을 중단시킨다.
		
		console.log("submit clicked");
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i,obj){
			
			var jobj = $(obj);
			
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";			
		});
		formObj.append(str).submit();
		
	}); 
	
	
	/* 파일의 업로드는 별도의 업로드 버튼을 두지 않고, <input type='file'>의 내용이 변경되는 것을 감지해서 처리 */
	var regex = new RegExp("(.*?)\(exe|sh|zip|alz)$");
		var maxSize = 2042880 * 4; // MB
		
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
				contentType: false,data:
				formData,type: 'POST',
				dataType:'json',
				success: function(result){
					console.log(result);
					showUploadResult(result); //업로드 결과 처리 함수 
				}
			}); // $.ajax
			
		});
		
		function showUploadResult(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length == 0) {return;}
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i,obj) {
				
				// image type
				if(obj.image){
					var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_" + obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"'data-type='"+obj.image+"'"
					str += " ><div>";
					str += "<span> " + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>"
					str += "</li>";
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
			
			$(".uploadResult").on("click","button", function(e) {
				
				console.log("delete file");
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li");
				
				$.ajax({ // $가 있으면 jQuery가 갖고있는 메서드
					url: '/deleteFile',
					data: {fileName:targetFile, type:type}, // k,v를 의미
					dataType:'text',
					type: 'POST',
						success: function(result) {
							alert(result);
							targetLi.remove(); // remove는 jquery가 갖고있는 메서드다.
						}
				}); // $.ajax
				
			});
			
			uploadUL.append(str);
		} 
		
	
});

</script>


<%@ include file="../include/footer.jsp"%>

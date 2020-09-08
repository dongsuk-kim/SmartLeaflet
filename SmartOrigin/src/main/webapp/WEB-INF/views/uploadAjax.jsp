<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<style>

	.uploadResult {
		
		width:100%;
		background-color: gray;
	}
	
	.uploadResult ul{
		display:flex; /* 회색영역부분 */
		flex-flow: row; /* row:가로, column:세로 */
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
		width: 200px;
	}
	
	.uploadResult ul li span {
		color:white;
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top:0%;
		width:100%;
		height:100%;
		background-color: gray;
		z-index: 100;
		background:rgba(255,255,255,0.5);
	}
	
	/* 실제 이미지는 여기안에 <img>태그를 생성해서 넣게 된다. */
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


<h1>Upload with Ajax</h1>

<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>

<!-- JavaScript를 추가해서 특정한 <ul> 태그 내에 업로드된 파일의 이름을 보여주도록 한다. -->
<div class="uploadResult">
	<ul>
	
	</ul>
</div>

<button id="uploadBtn">Upload</button>


<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  
<script>
	function showImage(fileCallPath) {
		/* alert(fileCallPath); */
		
		$(".bigPictureWrapper").css("display","flex").show();
		
		$(".bigPicture")
		.html("<img src='/display?fileName=" + encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height: '100%'}, 1000);
		
	}

</script>
  

<script>
$(document).ready(function() {
	$(".bigPictureWrapper").on("click",function(e) {
		$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		setTimeout(() => {
			$(this).hide();
		}, 1000);
	});
	
	var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click",function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		// add filedate to formdata
		for(var i = 0; i < files.length; i++){
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType:'json',
			success: function(result){
				console.log(result);
				
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
			}
		}); // $.ajax
	});
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	
	var maxSize = 5242880; // 5MB 이미지 최대크기 
	
	function checkExtension(fileName, fileSize) {
		
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("#uploadBtn").on("click",function(e) {
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i = 0; i < files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData: false,
			contentType: false,
			data:formData,
				 type:'POST',
				 success:function(result) {
						alert("업로드 완료");
					}
		}); // $.ajax
	});
	
	
	var uploadResult = $(".uploadResult ul");
	
		function showUploadedFile(uploadResultArr) {
			
			var str = "";
			
			$(uploadResultArr).each(
					function(i,obj) {
					
						if(!obj.image){
							var fileCallPath = encodeURIComponent(obj.uploadPath+"/" + obj.uuid+"_"+obj.fileName);
							
							var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
							
							str += "<li><a href='/download?fileName="+fileCallPath+"'>"
									+"<img src='/resources/img/attach.jpeg'>" + obj.fileName + "</a>" 
									+ "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>" + "<div></li>"
						} else {
							var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_" + obj.uuid+"_" + obj.fileName);
							
							var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
							
							originPath = originPath.replace(new RegExp(/\\/g),"/");
							
							str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
								"<img src='/display?fileName=" + fileCallPath+ "'></a>"+
										"<span data-file=\'" +fileCallPath+"\' data-type='image'> x </span>" + "<li>";
						}
					});
			
				uploadResult.append(str);
			
			}
		
		// x 표시에 대한 이벤트 처리하는 함수부분!
		$(".uploadResult").on("click","span", function(e) {
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
		    
			// 가장 가까운 쪽으로 찾아가서 지워줘야 함. jQuery 기초부분...
			// closest는 태그 위에를 말하는 것.
			// find는 태그 안쪽을 말하는 것.
			var targetLi = $(this).closest("li"); // $(this).closest("li")를 하면 li쪽에 가까운쪽을 찾아가서 $.ajax 부분에 targetLi.remove();를 넣어주면 브라우저에서 삭제가 된다. 
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType:'text',
				type: 'POST',
					success: function(result) {
						alert(result);
						targetLi.remove(); // 삭제 부분!
					}
			}); // $.ajax
			
			
			
		});
	
	
});

</script>

</body>
</html>
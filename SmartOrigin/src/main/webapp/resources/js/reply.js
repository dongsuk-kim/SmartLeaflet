console.log("Reply Module..........");

// Ajax로 가져오는 데이터가 replyCnt와 list라는 데이터로 구성.
// 이를 처리하는 구조로 수정!
// 기존에서 변경된 부분은 callback 함수에 해당 게시글 댓글 수(replyCnt)와 페이지 해당하는 댓글 데이터를 전달
var replyService = (function() {
	
	// 댓글 추가
	function add(reply,callback, error) {
		console.log("add reply...................");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	// 댓글 목록 (댓글 페이지 계산과 출력)
	function getList(param, callback, error) {
		
		var ano = param.ano;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + ano + "/" + page + ".json", 
		function(data) {
			if(callback) {
//				console.log("callback ..." + data);
//				callback(data); // 댓글 목록만 가져오는 경우
				callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져오는 경우
				
			}
		}).fail(function(xhr,status,err) {
			if(error) {
				error();
			}
		});
	}
	
	// 댓글 삭제
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function (deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				} 
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	// 댓글 수정
	function update(reply,callback,error) {
		
		console.log("RNO: " + reply.rno);
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr,status,er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	// 댓글 조회처리
	// get은 read
	function read(rno, callback, error) {
		$.get("/replies/" + rno + ".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr,status,err) {
			if(error) {
				error();
			}
		});
	}
	
	// 목록 시간
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000*60*60*24)) {
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes(); 
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : 0) + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
			
		}else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
		
	}
	
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		read : read,
		displayTime : displayTime
	};
	
})();























<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
	<%
		//브라우저의 쿠키리스트를 가져온다
		Cookie[] cookies = request.getCookies();
		//카트라는 쿠키에 저장할 밸류값
		String value = request.getParameter("cart");
		for(int i =0;i<cookies.length;i++){
			if(cookies[i].getName().equals("cart")){
				value= value+"/"+cookies[i].getValue();
				
			}
		}
		//out.println(value);
		//"cart" 쿠키생성
		Cookie cookie = new Cookie("cart",value);
		//쿠키저장
		response.addCookie(cookie);
		
		
		
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>해당 상품을 장바구니에 넣었습니다.</h1>
</body>
</html>
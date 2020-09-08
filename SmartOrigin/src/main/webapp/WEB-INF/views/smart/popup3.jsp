<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
	<%
	
		String str="";	
		Cookie cookieStr = null;
 		boolean flag = false;
		
		Cookie[] cookies=request.getCookies();
		//쿠키리스트에서  카트라는 이름을 가진 쿠키를 찾는다
		for(int i=0; i<cookies.length; i++){
			out.println("getNAME="+cookies[i].getName());
			//if(cookies[i].getName()=="cart") ==이 안되는 이유
			//만약 쿠키리스트가 가진 이름이 카트라면 
			//str에 쿠키의 밸류값을 저장해주고 
			//str에 str+"/"+새로들어온값을 저장해준다.
			if(cookies[i].getName().equals("cart")){
				str =cookies[i].getValue();
				str += "/"+request.getParameter("cart");
				out.println("str"+str);
				//cookieStr에 키값 cart 밸류가 밸류에 뭘넣어줘야하나??
				//카트라는 쿠키를 생성하고 만들고 밸류값으로는 밸류/밸류/밸류..이렇게 들어간다.
				cookieStr = new Cookie("cart", str);
				//생성한 쿠키를 저장한다.
				response.addCookie(cookieStr);
				flag=true;
			}
			
		}
		//카트라는 쿠키가 없으면 새로 만들어서 넣어준다.
		//flag가 false라면 카트라는 이름을 가진 쿠키를 생성해서 밸류로 현재 가지고온 값을 다시 넣어준다.
		if(!flag){
			
			cookieStr = new Cookie("cart", request.getParameter("cart"));
		}
		
		
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키</h1>
</body>
</html>
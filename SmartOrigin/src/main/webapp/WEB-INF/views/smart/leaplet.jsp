<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${leapletList }</h1>
	<c:forEach items="${leapletList}" var="leaplet">
		<h2>${leaplet.lno}</h2>
		<h2>${leaplet.mno }</h2>
		<h2>${leaplet.lmartlogo }</h2>
		<h2>${leaplet.lstatus }</h2>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${leaplet.startdate }"/>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${leaplet.lastdate }"/>
	</c:forEach>
</body>
</html>
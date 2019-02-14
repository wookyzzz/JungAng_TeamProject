<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<%  
	String viewProduct = request.getContextPath() + "/list.prd"; 
	String viewOrder = request.getContextPath() + "/order.mall";
	// => mall.controller.OrderMallController
%>
<html>    
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<%=viewProduct%>">상품 목록 보기</a><br><br><br>
	<a href="<%=viewOrder%>">나의 주문 내역</a><br><br><br> 
	session.getAttribute("loginfo"): <%=session.getAttribute("loginfo")%>
</body>
</html>  


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<%  
	String viewMember = request.getContextPath() + "/registerForm.me"; 
	
	//response.sendRedirect(viewPage) ;
	//String viewOrder = request.getContextPath() + "/order.mall";
%>
<html>    
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<%=viewMember%>">회원가입하러가기</a><br><br><br>
	<%-- <a href="<%=viewOrder%>">나의 주문 내역</a><br><br><br> --%>
	session.getAttribute("loginfo"): <%=session.getAttribute("loginfo")%>
</body>
</html>  


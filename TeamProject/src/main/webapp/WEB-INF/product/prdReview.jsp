<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int prdNum = Integer.parseInt(request.getParameter("prdNum"));
String pageNumber = request.getParameter("pageNumber");

%>리뷰 페이지<%=prdNum %>
<jsp:include page="prdView.jsp" >
    <jsp:param name="prdNum" value="<%=prdNum%>"/>
    <jsp:param name="pageNumber" value="<%=pageNumber%>"/>
</jsp:include>
<textarea cols="50" rows="10" name="review"></textarea>
<c:if test="${reviewLists.size()==0 }">
	작성된 후기가 없습니다.
</c:if>
</body>
</html>
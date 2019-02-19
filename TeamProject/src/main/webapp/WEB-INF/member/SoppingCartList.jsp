<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">즐겨찾기 목록</h2>
	<table border="1" align="center">
		<tr>
			<td colspan="5" align="center">
				주문자 정보 : 
				${sessionScope.loginfo.name}(${sessionScope.loginfo.id})
			</td>
		</tr>	
		<tr>
			<th><span>회원 아이디</span></th>
			<th><span>회원 닉네임</span></th>
			<th><span>회원 이름</span></th>
		</tr>
		
		<c:forEach items="${sessionScope.shoplists}" var="shopinfo">  
			<tr>
				<td align="center">
					${shopinfo.id}
				</td>				
				<td align="center">
					${shopinfo.name}
				</td>
				<td align="center">
					${shopinfo.nick}
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3" align="center">
			<a href="delete.mem?id=<c:out value="${member.id}" />">취소</a>
				&nbsp;&nbsp;
				<a href="list.prd">추가 주문</a>
			</td>
		</tr>
	</table>	
	<br><br><br>	
</body>
</html> 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${contextPath.request.contextPath }/resources/ckeditor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function(){
		CKEDITOR.replace("content");
	}
</script>
</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<table>
		<tr>
			<td>내용</td>
			<td><textarea id="content" name="contents" rows=20 cols=50 placeholder=내용입력></textarea></td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
<script src="${pageContext.request.contextPath }/js/prdCheck.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/topmenu.jsp"%>
	<%
		int catNum = Integer.parseInt(request.getParameter("catNum"));
	%>
	<c:set value="<%=catNum%>" var="catNum"></c:set>
	<div class="container">
		<div class="row"></div>
		<div class="section">
<form  method="post"  action="insert.prd"  enctype="multipart/form-data">
				<table class="table table-defalut">
					<thead>
		<tr>
			<td>
				카테고리&nbsp;<select name="categories"  class="form-control" >
					<c:forEach var="cat" items="${catLists}">
					<option value="${cat.idx },${cat. name}" <c:if test="${cat.idx == catNum}">selected</c:if>>${cat.name}</option>
					</c:forEach>
				</select> 
			</td>
		</tr>
		
		<tr>
			<td colspan=2>
				<div class="form-group">
					<input type="text"  class="form-control"  name="name" id="name" onkeypress="spanDel()" placeholder="제목"><span id="NameErr"></span>
				</div>
			</td>
			</tr>	
			</thead>
			<tfoot>
			<tr>
							<td colspan=2><textarea id="editor1" name="contents" rows=70 cols=50  placeholder="상품 상세설명"></textarea></td>
		</tr> 
		<tr>
				<td width=90%><div class="form-group">배송비
					<input type="radio" name="deliverycharge" id="deliverycharge" value="유" checked>유
					<input type="radio" name="deliverycharge" id="deliverycharge" value="무" >무 &nbsp;|&nbsp;
						
					<input type="text" name="price" id="price" placeholder="가격" style="width:80px"><span id="PriceErr"></span>&nbsp;|&nbsp;
					<input type="text" name="quantity" id="quantity" placeholder="수량"  style="width:80px"><span id="QuantityErr"></span>
				</div>
				</td>
				<td>
					<div class="form-group">
					<input type="submit" class="btn btn-default" value="상품등록" onclick="return errCheck()">
					</div></td>
				
		</tr>
	</table>
	<input type="hidden" value="${loginfo.id }" name="memId"> <%-- session 값을 이용! --%>
	<script>
			
					CKEDITOR.replace("editor1",{
						height : '700px',
						filebrowserUploadUrl : 'upload.prd'
					});
				
				</script>
</form>
</div>
</div>
</body>
</html>
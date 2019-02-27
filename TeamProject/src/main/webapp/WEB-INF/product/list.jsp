<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.form-control {
	width: auto;
}

#ser {
	background-color: yellow;
	font-weight: bold;
	font-size: 18px;
	align:center;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
	function imgSrc(size){
		for(i=1;i<=size;i++){
		imgSrc = $("#img_"+i+" img").attr("src");
			$("#img_"+i).empty();
			 img = $("#img_"+i).append('<img  src="'+imgSrc+'"  width="80px" height="80px " id="upImg_'+i+'"/>');
			imgX = $("#upImg_"+i).attr('src');
			if(imgX=="undefined"){
				$("#img_"+i).empty();
				 img = $("#img_"+i).prepend('없음');
			}
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="imgSrc(${lists.size()})">
	<%@ include file="../common/topmenu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="section">
				<div class="col-md-6" align="center">
					<form class="form-inline" action="list.prd">
						<div class="form-group">
							<table align=center >
								<tr>
									<td><c:if test="${whatColumn eq null}"></c:if> <c:if 
											test="${whatColumn ne null}">
											<c:choose>
												<c:when test="${whatColumn eq 'null'}"></c:when>
												<c:when test="${whatColumn ne 'null'}">
													<span id="ser">"${keyword }"</span>(으)로 검색된 <span id="ser">"${whatColumn}"</span> 결과입니다. (${totalCount} 건)</c:when>
											</c:choose>
										</c:if></td>
								</tr>
							</table>
							<br><br>
							<select class="form-control" id="column" name="whatColumn">
								<option value="전체">전체</option>
								<option value="판매자">판매자</option>
								<option value="상품이름">상품이름</option>
								<option value="상품설명">상품설명</option>
							</select>
						
						<div class="form-group">
							<input type="text" name="keyword" class="form-control"> <input
								type="submit" value="검색" class="btn btn-default">
						</div>
						<input type="hidden" name="catNum" value="${catNumdetail }">
					</form>
				</div>
			</div>
		</div>

		<div class="section">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>미리보기</th>
						<th>상품이름</th>
						<th>가격</th>
						<th>판매자</th>
					</tr>
				</thead>
				<tfoot>
					<c:forEach items="${lists}" var="prd" varStatus="i">
						<tr>
							<td width=100px height=100px align=center><div
									id="img_${i.count}">${prd.contents}</div></td>
							<td><a
								href="prodView.prd?prdNum=${prd.idx}&pageNumber=${pageInfo.pageNumber}">${prd.name}</a></td>
							<td>${prd.price}</td>
							<td>${prd.memId}</td>
					</c:forEach>
			</table>
		</div>
	</div>

	<br>
	<center>${pageInfo.pagingHtml}</center>
	<div align=right>
	<c:if test="${loginfo.salesauthority=='사업가' }">
	<button type="button" class="btn btn-default" onclick="location.href='insert.prd?catNum=${catNumdetail}'">상품 올리기</button>
</c:if>
</div>
</body>
</html>
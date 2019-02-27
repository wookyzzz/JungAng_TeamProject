<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function mainImgSel(size) {
		for(i=1;i<=size;i++){
			imgSrc = $("#img_"+i+" img").attr("src");
				$("#img_"+i).empty();
				 img = $("#img_"+i).append('<img  src="'+imgSrc+'"  width="80px" height="80px " id="upImg_'+i+'"/>');
				imgX = $("#upImg_"+i).attr('src');
				if(imgX=="undefined"){
					$("#img_"+i).empty();
					 img = $("#img_"+i).prepend('');
				}
			}
		
	}
</script>
<style type="text/css">
	#bar{
		background-color: #F6F6F6;
	}
	.form-control {
	width: auto;
	align:center;
}	
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="mainImgSel(${orderLists.size()})">
	<%@ include file="../common/topmenu.jsp"%>
	<div class="row">
		<div class="section">
			<div class="col-md-6" >
				<div class="form-group">
					<table class="table" align="center">
						<thead>
							<tr>
								<td colspan=5 align=center><font size="5px"><font
										color="#F0AD4B">${prdName}</font>주문 내역</font></td>
							</tr>
						</thead>
						<c:if test="${orderLists.size()==0 }">
							<tr>
								<td>주문내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${orderLists.size()!=0 }">
							<tr>
								<td colspan=2 align=center id="bar">상품정보</td>
								<td id="bar">수량</td>
								<td id="bar">결제금액</td>
								<td id="bar">주문날짜</td>
								<td id="bar"></td>
							</tr>
							<c:forEach items="${orderLists}" var="order" varStatus="i">
								<tr >
									<td width=120px ><div id="img_${i.count}">${order.contents}</div>&nbsp;&nbsp;</td>
									<td width=200px>${order.name}</td>
									<td>${order.quantity}</td>
									<td>${order.totalPrice}</td>
									<td>${order.inputdate}</td>
									<td><a href="insertReview.prd?prdNum=${order.prdNum }">후기 작성</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
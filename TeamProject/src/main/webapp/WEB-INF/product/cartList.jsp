<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
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
	function allcheck(top,price,deli){
		alert(price);
		rows = document.getElementsByName("row");
		if(top.checked==true){
			for(i=0;i<rows.length;i++){
				rows[i].checked=true;
			}
			$("#finalPrice").empty();
			$("#finalPrice")	.append(parseInt(price)+parseInt(2500));
		}
		else{
			for(i=0;i<rows.length;i++){
				rows[i].checked=false;
			}
			$("#finalPrice").empty();
			$("#finalPrice")	.append(0);
		}
	}
	function checkcheck(){
		rows = document.getElementsByName("row");
		flag=false;
		for(i=0;i<rows.length;i++){
			if(rows[i].checked==true){
				flag=true;
			}
		}
	if(flag==false){
		alert('구매할 상품을 선택하세요.');
		return false;
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
<body onload="mainImgSel(${cartLists.size()})">
	<%@ include file="../common/topmenu.jsp"%>
	<div class="row">
		<div class="section">
			<div class="col-md-6" >
				<div class="form-group">
					<table class="table" align="center">
						<thead>
							<tr>
								<td colspan=6 align=center><font
										color="#F0AD4B" size="5px">장바구니</font></td>
							</tr>
						</thead>
						<c:if test="${orderLists.size()==0 }">
							<tr>
								<td>장바구니에 담긴 상품이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${cartLists.size()!=0 }">
						<c:forEach items="${cartLists}" var="cart" >
						<c:set value="${cart.totalPrice+ checkprice }" var="checkprice"></c:set>
						<c:if test="${cart.deliverycharge =='유' }"><c:set value="유" var="deli"></c:set></c:if>
						</c:forEach>
							<tr>
								<td width=5% id="bar"><input type="checkbox" name="top" id="top"  onchange="allcheck(this,'${checkprice }','${deli}')" checked>
								<td colspan=2 align=center id="bar">상품정보</td>
								<td id="bar">수량</td>
								<td id="bar">금액</td>
								<td id="bar">배송비</td>
							</tr>
							<c:forEach items="${cartLists}" var="cart" varStatus="i">
								<tr >
									<td width=5% valign="middle"><input type="checkbox" name="row" value="${cart.idx }" onchange="cc(this)" checked>
									<td width=120px ><div id="img_${i.count}">${cart.contents}</div>&nbsp;&nbsp;</td>
									<td width=200px>${cart.name}</td>
									<td>${cart.quantity}</td>
									<td>${cart.totalPrice}</td>
									<td><c:if test="${cart.deliverycharge =='유' }">2500<c:set value="유" var="deli"></c:set></c:if><c:if test="${cart.deliverycharge =='무' || cart.deliverycharge ==null }">0</c:if></td>
								</tr>
								<c:set value="${cart.totalPrice+ price }" var="price"></c:set>
							</c:forEach>
							<tr><td colspan=6 align=right>
							<font size="3">총 금액: 
							<font color="#F0AD4B"><span id="finalPrice"><c:if test="${deli=='유' }">${2500 +price}</c:if><c:if test="${deli ne '유' }">${price}</c:if></span></font></font></td></tr>
							<tr><td colspan=6 align=center><input type="submit" value="주문하기" class="btn btn-primary"  onclick="return checkcheck()">
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
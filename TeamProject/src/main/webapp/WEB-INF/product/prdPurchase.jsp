<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/order.js?ver=<%=System.currentTimeMillis() %>"></script>
<style type="text/css">
.form-control {
	width: auto;
	align:center;
}	

	#bar{
		background-color: #F6F6F6;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="mainImgSel()">
	<%@ include file="../common/topmenu.jsp"%>
<form action="prdOrder.prd" method="post">
							<center>
				<div class="row">
				<div class="section">
					<div class="col-md-6" align="center">
							<div class="form-group">
								<table class="table">
								<thead>
									<tr>
										<td colspan=5> <font size="5px"><font color="#F0AD4B">${prdName}</font> 상품을 주문합니다.</font></td>
									</tr>
									<tr>
										<td colspan=2  id="bar"><font size="3px">상품정보</font></td>
										<td id="bar">가격</td>
										<td id="bar">배송비</td>
										<td id="bar">총 금액</td>
									</tr>
									</thead>
									<tr>
										<td width=120px ><div id="mainImg">${OrderPrd.contents}</div></td>
										<td width=200px><a href="prodView.prd?prdNum=${prdNum}"><font size="3px">${OrderPrd.name}</font></a><br><br><input type="text" value="${totalQuantity}" name="totalQuantity"	id="quantity" style="width: 30px;">
									    <input type="button" id="down" class="bt" value="◀" onclick="return qtDown('${deliverycharge}','${OrderPrd.price }')">
										<input type="button" class="bt" id="up" value="▶" onclick="return qtUp('${OrderPrd.quantity}','${deliverycharge}','${OrderPrd.price }')">
										</td>
										<td>${OrderPrd.price}</td>
										<td>${deliverycharge}</td>
										<td><span id="changePrice">${totalPrice}</span></td>
										</tr>
										</table>
										<br>
										<font color="#F0AD4B" size=3px>배송지 정보</font>
										<table class="table" >
										<tr>
										<td width=12%>이름</td><td>${member.name}</td>
										</tr>
										<tr>
										<td>연락처</td><td>${member.tel}</td> <c:if test=">${member.hp ne null}"> / <td>${member.hp}</td></c:if>
										</tr>
										<tr>
										<td>주소</td>
										<td>(${member.postcode1}) ${member.address1 } ${member.detailaddress1}<input type="button" class="btn btn-default"  value="주소변경" onclick="addrChange()">
										<br><br>
										<div id="addressForm" style="display:none;">
										<input   type="text" name="newPostcode1" id="postcode1" placeholder="우편번호" style="width:80px" >
										&nbsp;&nbsp;<a href="javascript:Postcode1()">우편번호 찾기</a><br><br>
										<input type="text" name="newAddress1" id="address1" placeholder="주소1(자택)"    >&nbsp;
										<input   type="text" name="newDetailaddress1" id="detailaddress1" placeholder="상세주소">
					
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
					function Postcode1() {
				         new daum.Postcode({
				             oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				 
				                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				 
				                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                    extraRoadAddr += data.bname;
				                }
				                // 건물명이 있고, 공동주택일 경우 추가한다.
				                if(data.buildingName !== '' && data.apartment === 'Y'){
				                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                }
				                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                if(extraRoadAddr !== ''){
				                    extraRoadAddr = ' (' + extraRoadAddr + ')';
				                }
				                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				                if(fullRoadAddr !== ''){
				                    fullRoadAddr += extraRoadAddr;
				                }
				 
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                console.log(data.zonecode);
				                console.log(fullRoadAddr);
				                
				                
				                $("[name=newPostcode1]").val(data.zonecode);
				                $("[name=newAddress1]").val(fullRoadAddr);
				                
				                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				            }
				         }).open();
				     }
					</script>
			</div>
		</td>
	</tr>
	<tr>
		<td>배송 메모</td>
		<td>
			<select name="memo" onchange="memoFunc()">
				<option value="없음">배송메모를 선택해주세요.
				<option value="배송 전 연락 바랍니다.">배송 전 연락 바랍니다.
				<option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.
				<option value="집 앞에 놔주세요.">집 앞에 놔주세요.
				<option value="부재시 연락바랍니다.">부재시 연락바랍니다.
				<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.
				<option value="부재시 집 앞에 맡겨주세요.">부재시 집 앞에 놔주세요.
				<option value="직접입력">직접 입력해주세요.
			</select>
				<div id="memotextarea"></div>
		</td>
	</tr>
	<tr><td>포인트 사용</td>
	<td><input type="text" name="usePoint" value="0">
	<span id="pointtext"> <font size=2 color=gray>(</font><font color=red size=2> ${member.point}</font></span>
	<font size=2 color=gray>/${member.point})</font>&nbsp;<input type="button" value="사용하기" id="useP" class="btn btn-default" >
	<br>* 포인트는 3,000원 이상부터 사용 가능합니다. (사용하기 버튼<font color=red size=2> click!</font>)</td>
	</tr>
	<tr><td colspan="2" align=right><font size="3px">최종 결제 금액 &nbsp;<span id="finalPrice"><font color="#F0AD4B">${totalPrice}</font></span></font></td>
	<tr><td colspan="2" align=center><input type="submit" value="주문하기" class="btn btn-primary" onclick="return detailaddress_check()"></td></tr>
</table>
</div>
</div>
</div>
</div>
<div id="totalPriceHidden">
	<input type="hidden" name="totalPrice" value="${totalPrice}">
</div>
<div id="totalQuantityHidden">
<input type="hidden" name="totalQuantity" value="${totalQuantity}">
</div>
<input type="hidden" name="point" value="${member.point}">
<input type="hidden" value="${memId}" name="memId">
<input type="hidden" value="${prdNum}" name="prdNum">
<input type="hidden" value="${member.postcode1}" name="originPostcode1">
<input type="hidden" value="${OrderPrd.point}" name="addPoint">
<input type="hidden" value="${member.address1}" name="originAddr1">
<input type="hidden" value="${member.detailaddress1}" name="originDetailaddress1">
</center>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js?ver=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript">
$(function(){
	$('#useP').click(function(){
		finalPrice = $("#finalPrice").html();
		usePoint = $("input[name='usePoint']").val();
		point = $("input[name='point']").val();
		if(usePoint<3000){
			alert('포인트는 3000점 이상부터 사용 가능합니다.');
			$("input[name='usePoint']").focus();
		}
		else if(finalPrice-usePoint<0){
			alert('주문 가격 이상의 포인트는 사용할 수 없습니다.');
			$("input[name='usePoint']").focus();
			$("input[name='usePoint']").val('0');
			$("#finalPrice").empty();
			$("#finalPrice").append("<font color='#F0AD4B'>"+(finalPrice)+"</font>");
		}
		
		else  if(point-usePoint<0){
			alert('포인트를 다시 확인해주세요.');
			$("input[name='usePoint']").focus();
		}
		else{
			$("#finalPrice").empty();
			$("#finalPrice").append("<font color='#F0AD4B'>"+(finalPrice-usePoint)+"</font>");
			$("#pointtext").empty();
			$("#pointtext").append(" <font size=2 color=gray>(</font><font color=red size=2>"+(point-usePoint)+"</font>");		
		}
	});
});
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
		rows = document.getElementsByName("row");
		if(top.checked==true){
			for(i=0;i<rows.length;i++){
				rows[i].checked=true;
			}
			$("#finalPrice").empty();
			$("#finalPrice")	.append("<font color='#F0AD4B'>"+(parseInt(price)+parseInt(2500))+"</font>");
		}
		else{
			for(i=0;i<rows.length;i++){
				rows[i].checked=false;
			}
			$("#finalPrice").empty();
			$("#finalPrice")	.append("<font color='#F0AD4B'>"+0+"</font>");
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
	totalPrice =0;
	function checkprice(price,idx,deli){
		alert(deli);
		row = document.getElementById("row_"+idx);
		
		if(deli == "유"){
			i=1;
		}
			if(row.checked==true){
					totalPrice =(parseInt(totalPrice)+parseInt(price));				
					if(i==1){
						$("#finalPrice").empty();
						$("#finalPrice")	.append('<font color="#F0AD4B">'+(parseInt(totalPrice)+parseInt(2500))+'</font>');		
					}
					else{
						$("#finalPrice").empty();
						$("#finalPrice")	.append('<font color="#F0AD4B">'+(totalPrice)+'</font>');		
					}
			}
			else {
					totalPrice =(parseInt(totalPrice)-parseInt(price));
					$("#finalPrice").empty();
					$("#finalPrice")	.append('<font color="#F0AD4B">'+(totalPrice)+'</font>');		
			}
			
	}
	
	function deldel(idx,memId){
		con = confirm("해당 상품을 삭제하시겠습니까?");
		if(con==true){
			location.href="cartDelete.prd?idx="+idx+"&memId="+memId;
		}
	}
	
	function addrChange(){
		if($('#addressForm').css('display')=='none'){
		$('#addressForm').show();
		}
		else{
			$('#addressForm input[type="text"]').val('');
			$('#addressForm').css('display','none');
		}
	}
	function detailaddress_check(){
		if($('#addressForm').css('display')!='none'){
			if($('#addressForm input[type="text"]').val()==""){
				alert("새로운 주소를 입력해주세요.");
				return false;
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
<body onload="mainImgSel(${cartLists.size()})">
	<%@ include file="../common/topmenu.jsp"%>
	<div class="row">
		<div class="section">
			<div class="col-md-6" >
				<div class="form-group">
					<table class="table" align="center">
						<thead>
							<tr>
								<td colspan=7 align=center><font
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
						<c:set value="${(cart.totalPrice*cart.quantity)+ checkprice }" var="checkprice"></c:set>
						<c:if test="${cart.deliverycharge =='유' }"><c:set value="유" var="deli"></c:set></c:if>
						</c:forEach>
							<tr>
								<td width=5% id="bar"><input type="checkbox" name="top" id="top"  onchange="allcheck(this,'${checkprice }','${deli}')" >
								<td colspan=2 align=center id="bar">상품정보</td>
								<td id="bar">수량</td>
								<td id="bar">금액</td>
								<td id="bar">배송비</td>
								<td id="bar"></td>
							</tr>
							<c:forEach items="${cartLists}" var="cart" varStatus="i">
								<tr >
									<td width=5% valign="middle"><input type="checkbox" name="row"  id="row_${cart.idx }" value="${cart.idx }" onchange="checkprice('${cart.totalPrice*cart.quantity}','${cart.idx }','${cart.deliverycharge}')" >
									<td width=120px ><div id="img_${i.count}">${cart.contents}</div>&nbsp;&nbsp;</td>
									<td width=200px>${cart.name}</td>
									<td>${cart.quantity}</td>
									<td>${cart.totalPrice}</td>
									<td><c:if test="${cart.deliverycharge =='유' }">2500</c:if><c:if test="${cart.deliverycharge =='무' || cart.deliverycharge ==null }">0</c:if></td>
									<td><a href="javascript:deldel('${cart.idx}','${member.id }')">삭제</a></td>
								</tr>
								<c:set value="${(cart.totalPrice*cart.quantity)+ price }" var="price"></c:set>
							</c:forEach>
							<tr><td colspan=7 align=right>
							<font size="3">총 금액: 
							<span id="finalPrice"><font color="#F0AD4B">0</font></span></font></td></tr>
						</c:if>
					</table>
					
								<font color="#F0AD4B" size=3px>배송지 정보</font>
										<table class="table" >
										<tr>
										<td width=12% id="bar" align=center>이름</td><td>${member.name}</td>
										</tr>
										<tr>
										<td id="bar" align=center>연락처</td><td>${member.tel}</td> <c:if test=">${member.hp ne null}"> / <td>${member.hp}</td></c:if>
										</tr>
										<tr>
										<td id="bar" align=center>주소</td>
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
		<td id="bar" align=center>배송 메모</td>
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
	<tr><td id="bar" align=center>포인트 사용</td>
	<td><input type="text" name="usePoint" value="0">
	<span id="pointtext"> <font size=2 color=gray>(</font><font color=red size=2> ${member.point}</font></span>
	<font size=2 color=gray>/${member.point})</font>&nbsp;<input type="button" value="사용하기" id="useP" class="btn btn-default" >
	<br>* 포인트는 3,000원 이상부터 사용 가능합니다. (사용하기 버튼<font color=red size=2> click!</font>)</td>
	</tr>
	<tr><td colspan=2 align=center><input type="submit" value="주문하기" class="btn btn-primary"  onclick="return checkcheck()">
</table>
							
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="point" value="${member.point}">
</body>
</html>
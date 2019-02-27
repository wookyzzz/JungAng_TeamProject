$(function(){
	$('#useP').click(function(){
		changePrice = $("#changePrice").html();
		price = $("input[name='totalPrice']").val();
		usePoint = $("input[name='usePoint']").val();
		point = $("input[name='point']").val();
		if(usePoint<3000){
			alert('포인트는 3000점 이상부터 사용 가능합니다.');
			$("input[name='usePoint']").focus();
		}
		else if(changePrice-usePoint<0){
			alert('주문 가격 이상의 포인트는 사용할 수 없습니다.');
			$("input[name='usePoint']").focus();
			$("input[name='usePoint']").val('0');
			$("#finalPrice").empty();
			$("#finalPrice").append("<font color='#F0AD4B'>"+(changePrice)+"</font>");
		}
		
		else  if(point-usePoint<0){
			alert('포인트를 다시 확인해주세요.');
			$("input[name='usePoint']").focus();
		}
		else{
			$("#totalPriceHidden").empty();
			$("#totalPriceHidden").append("<input type='hidden' name='totalPrice' value='"+(changePrice-usePoint)+"'>");	
			$("#finalPrice").empty();
			$("#finalPrice").append("<font color='#F0AD4B'>"+(changePrice-usePoint)+"</font>");
			$("#pointtext").empty();
			$("#pointtext").append(" <font size=2 color=gray>(</font><font color=red size=2>"+(point-usePoint)+"</font>");		
		}
	});
});

function mainImgSel(){
	imgsrc = $("#mainImg  img").attr("src");
		$("#mainImg").empty();
		 img = $("#mainImg").append('<img  src="'+imgsrc+'"  width="80px" height="80px " id="upImg"/>');
		imgX = $("#upImg ").attr('src');
		if(imgX=="undefined"){
			$("#mainImg ").empty();
			 img = $("#mainImg").prepend('');
		}
}
function memoFunc(){
	if($('select option:selected').val()=="직접입력"){
		$('#memotextarea').append('<br><textarea name="memo" cols="50" rows="5">');
		$('#memotextarea').show();
	}else{
		$('#memotextarea').css('display','none');
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

function qtDown(delcharge,price) {
	qt = $("#quantity").val();
	if (qt == "1") {
		alert('최소 구매 갯수는 1개 이상입니다.');
		return;
	} else {
		 $("#quantity").val(qt - 1);
		$("#changePrice").empty();
		$("#changePrice").append(((qt - 1) * price)+parseInt(delcharge));
		HiddenPrice(((qt - 1) * price)+parseInt(delcharge));
		HiddenQuantity(qt-1);
	}
}
function qtUp(quantity,delcharge,price) {
	qt = $("#quantity").val();
	 $("#quantity").val(parseInt(qt) + parseInt(1));
	upqt= parseInt(qt) + parseInt(1);
	if(upqt>quantity){
		alert("주문 수량 초과");
	upqt= parseInt(qt) ;
	 $("#quantity").val(upqt);
		$("#changePrice").empty();
		$("#changePrice").append(parseInt(upqt*price)+parseInt(delcharge));
		HiddenPrice(parseInt(upqt*price)+parseInt(delcharge));
		HiddenQuantity(upqt);
	}
	else {
		$("#changePrice").empty();
		$("#changePrice").append(parseInt(upqt*price)+parseInt(delcharge));
		HiddenPrice(parseInt(upqt*price)+parseInt(delcharge));
		HiddenQuantity(upqt);
	}
}
function HiddenPrice(totalPrice){
	$("#totalPriceHidden").empty();
	$("#totalPriceHidden").append("<input type='hidden' name='totalPrice' value='"+totalPrice+"'>");
	$("#finalPrice").empty();
	$("#finalPrice").append("<font color='#F0AD4B'>"+totalPrice+"</font>");
}
function HiddenQuantity(totalQuantity){
	$("#totalQuantityHidden").empty();
	$("#totalQuantityHidden").append("<input type='hidden' name='totalQuantity' value='"+totalQuantity+"'>");

}

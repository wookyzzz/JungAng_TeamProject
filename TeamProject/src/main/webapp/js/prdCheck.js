	function errCheck(){
	name = document.getElementById("name").value;
	price = document.getElementById("price").value;
	quantity = document.getElementById("quantity").value;
		NameErr = document.getElementById("NameErr");
		PriceErr = document.getElementById("PriceErr");
		reg = /^[0-9]*$/;
		QuantityErr = document.getElementById("QuantityErr");
		if(name=="" || editor1==""||price=="" || quantity==""){
			if(name==""){
					NameErr.innerHTML="<font color=red>필수 입력사항입니다.</font>";
			}
			if(price==""){
					PriceErr.innerHTML="<font color=red>필수 입력사항입니다.</font>";
			}
			if(quantity==""){
					QuantityErr.innerHTML="<font color=red>필수 입력사항입니다.</font>";
			}
		return false;
		}
		if( price=="0" || quantity=="0"){
			if(price=="0"){
					PriceErr.innerHTML="<font color=red>가격은 최소 1원 이상 입력 가능합니다.</font>";
			}
			if(quantity=="0"){
					QuantityErr.innerHTML="<font color=red>수량은 최소 1개 이상 입력가능합니다.</font>";
			}
		return false;
		}
		
		if(reg.test(price)==false  || reg.test(quantity)==false){
			if(reg.test(price)==false){
			PriceErr.innerHTML="<font color=red>가격을 올바르게 입력하세요.</font>";					
			}			
			if(reg.test(quantity)==false){
			QuantityErr.innerHTML="<font color=red>수량을 올바르게 입력하세요.</font>";					
			}
			return false;	
		}
}
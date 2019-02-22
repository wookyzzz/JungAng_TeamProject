
var check=false;
var change=false;
var checkstr="";
$(function(){
	$('input[name="userId"]').focus();

$('#id_check').click(function(){
	check=true;
	chage=false;
	useCheck="";
	if ($('input[name="userId"]').val() == "") {
		$('input[name="userId"]').css('border', '1px solid red').css('color','red');
		$('#idmessage').html('<font color="red">&nbsp&nbspPlease enter id</font>');
		$('#idmessage').show();

		$('input[name="userId"]').click(function() {
			$('input[name="userId"]').css('border', '0').css('color', 'black');
			$('#idmessage').css('display', 'none');
		});
		return false;
	}
	else{
		$.ajax({
			url:'id_check.jsp',
			data:{
				checkId:$('input[name="userId"]').val()
			},
			success:function(data){
				if(jQuery.trim(data)=="y"){
					$('input[name="userId"]').css('border', '1px solid red');
					$('#idmessage').html('<font color="red">&nbsp&nbspThis ID is\'t available :-(</font>');
					$('#idmessage').show();
					checkstr="impossible";
				}else{
				$('input[name="userId"]').css('border', '1px solid blue');
				$('#idmessage').html('<font color="blue">&nbsp&nbspThis ID is available :-)</font>');
				$('#idmessage').show();
				checkstr="possible";
			}
		}
		});
	}
	$('input[name="userId"]').keydown(function(){
		check=false;
		$('#idmessage').css('display','none');
		$('input[name="userId"]').css('border', '0').css('color', 'black');
	});//keydown
}); //중복체크 버튼 클릭

}); //ready - .click이나 .으로 시작되는 함수들은 무조건 함수 안에 있어라!
function capsCheck(e){
	var keyCode=0;
	var shiftKey=false;
	keyCode= e.keyCode;
	shiftKey = e.shiftKey;
	if(65<=keyCode&&keyCode<=90&&shiftKey==false){
		$('#capsOn').html('Caps Lock <font color="green">ON</font>');
		$('#capsOn').show();
		
	}
	else if(65<=keyCode&&keyCode<=90&&shiftKey==true){
		$('#capsOn').html('Caps Lock <font color="green"> ON</font>');
		$('#capsOn').show();
	}
	else{
		$('#capsOn').css('display','none');
		
	}
	
}
function op_email(){
		$('input[name="mail2"]').val($('select').val());
		if(($('select').val())!=""){
			$('input[name="mail2"]').attr('readonly','true');
		}else{
			$('input[name="mail2"]').removeAttr('readonly');
		}
}
function inputCheck() {
	if ($('input[name="userId"]').val() == "") {
		$('input[name="userId"]').css('border', '1px solid red');
		$('#idmessage').html('<font color="red">&nbsp&nbspPlease enter id</font>');
		$('#idmessage').show();

		$('input[name="userId"]').click(function() {
			$('input[name="userId"]').css('border', '0').css('color', 'black');
			$('#idmessage').css('display', 'none');
		});
		return false;
	}
	if(check==false || change==true){
		alert('아이디 중복검사를 해주세요.');
		$('input[name="userId"]').focus();
		return false;
	}
	if(checkstr=="impossible"){
		alert('이미 사용중인 아이디 입니다.');
		return false;
	}
	if ($('input[name="pwd"]').val() == "") {
		$('input[name="pwd"]').css('border', '1px solid red');
		$('#pwmessage').html(
				'<font color="red">&nbsp&nbspPlease enter password</font>');
		$('#pwmessage').show();

		$('input[name="pwd"]').click(function() {
			$('input[name="pwd"]').css('border', '0').css('color', 'black');
			$('#pwmessage').css('display', 'none');
		});
		return false;
	}
	
	if ($('input[name="pwd"]').val().length< 6) {
		$('input[name="pwd"]').css('border', '1px solid red');
		$('#pwmessage').html(
				'<font color="red">&nbsp&nbspPlease enter more than 6 letters.</font>');
		$('#pwmessage').show();
		
		$('input[name="pwd"]').click(function() {
			$('input[name="pwd"]').css('border', '0').css('color', 'black');
			$('#pwmessage').css('display', 'none');
		});
		return false;
	}
	if($('input[name="pwd"]').val()==($('input[name="userId"]').val())){
		alert('아이디와 비밀번호는 동일할 수 없습니다.');
		return false;
	}
	if ($('input[name="nick"]').val() == "") {
		$('input[name="nick"]').css('border', '1px solid red');
		$('#nickmessage').html(
				'<font color="red">&nbsp&nbspPlease enter a nickname.</font>');
		$('#nickmessage').show();

		$('input[name="nick"]').click(function() {
			$('input[name="nick"]').css('border', '0').css('color', 'black');
			$('#nickmessage').css('display', 'none');
		});
		return false;
	}
	if ($('input[name="email"]').val() == "") {
		$('input[name="email"]').css('border', '1px solid red');
		$('#mailmessage').html(
				'<font color="red">&nbsp&nbspPlease enter e-mail</font>');
		$('#mailmessage').show();

		$('input[name="email"]').click(function() {
			$('input[name="email"]').css('border', '0').css('color', 'black');
			$('#mailmessage').css('display', 'none');
		});
		return false;
	}
	if ($('input[name="mail2"]').val() == "") {
		$('input[name="mail2"]').css('border', '1px solid red');
		$('#mailmessage').html(
				'<font color="red">&nbsp&nbspPlease enter e-mail</font>');
		$('#mailmessage').show();

		$('input[name="mail2"]').click(function() {
			$('input[name="mail2"]').css('border', '0').css('color', 'black');
			$('#mailmessage').css('display', 'none');
		});
		return false;
	}
}

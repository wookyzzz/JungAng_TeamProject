<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}

@media only screen and (max-device-width:540px) {
    	   .mobileLabel{
   text-align: left;
   }
   	 .mobilePad{
   margin-left: 4em;
   }
}
@media only screen and (max-device-width:750px) and
	(orientation:landscape) {
.mobileLabel{
   text-align: left;
   }
    .mobilePad{
   margin-left: 11%;
   }
	}
		.boxStyle{
margin-left: 20%;width: 60%;
}
</style>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<%@ include file="../common/topmenu.jsp" %>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 boxStyle" style="padding-right: 0px!important;padding-left: 0px!important;">
		   <div class="panel-body" style="padding-right: 4px!important;padding-left: 4px!important;">
                 <form method="post" name="challenge"  class="form-horizontal" role="form" action="#" onSubmit="return submitForm()" AUTOCOMPLETE = "off" >
				<fieldset class="landscape_nomargin" style="min-width: 0;padding:    .35em .625em .75em!important;margin:0 2px;border: 2px solid silver!important;margin-bottom: 10em;">
			<legend style="border-bottom: none;width: inherit;!important;padding:inherit;" class="legend">Registration Form</legend>
		
			<div class="form-group">
						 <div class="col-sm-12 col-md-12 col-lg-12 col-xs-12" style="text-align: right!important;">
						 <span style="color: red">*</span> <span style="font-size: 8pt;">반드시 입력하세요</span>
						 </div>
						</div>	
			 <div class="form-group" style="margin-bottom: 0px;">
                    <div class="col-sm-4 col-md-4 col-lg-5 col-xs-1"></div><div class="col-sm-8 col-md-8 col-lg-7 col-xs-10 mobilePad" id="message10" style=" font-size: 10pt;padding-left: 0px;"></div>                      

                    </div>				
		 <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            이름 <span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="name" id="name" value="${member.name}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            일반전화 <span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="tel" id="tel" value="${member.tel}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            핸드폰번호 <span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="hp" id="hp" value="${member.hp}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            닉네임 <span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="nick" id="nick" value="${member.nick}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            이메일 <span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="email" id="email" value="${member.email}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            기본주소1(자택) <span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						
                        <input style="border-radius: 4px!important;" class="form-control" type="text" id="postcode1" placeholder="우편번호" value="${member.postcode1}">
					<input style="border-radius: 4px!important;" class="form-control" type="button" onclick="Postcode1()" value="우편번호 찾기"><br>

					<input style="border-radius: 4px!important;" class="form-control" type="text" id="address1" placeholder="주소1(자택)" value="${member.address1}"><br>
					<input style="border-radius: 4px!important;" class="form-control" type="text" id="detail_address1" placeholder="상세주소" value="${member.detailaddress1}">


					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						function Postcode1() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}

											} else {

											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('postcode1').value = data.zonecode;
											document
													.getElementById("address_home").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"detail_address1").focus();
										}
									}).open();
						}
					</script>
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                           기본주소2(회사)<span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" class="form-control" type="text" id="postcode2" placeholder="우편번호" value="${member.postcode2}">
					<input style="border-radius: 4px!important;" class="form-control" type="button" onclick="Postcode2()" value="우편번호 찾기"><br>

					<input style="border-radius: 4px!important;" class="form-control" type="text" id="address2" placeholder="주소2(회사)" value="${member.address2}"><br>
					<input style="border-radius: 4px!important;" class="form-control" type="text" id="detail_address2" placeholder="상세주소" value="${member.detailaddress2}">


					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						function Postcode2() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}

											} else {

											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('postcode2').value = data.zonecode;
											document.getElementById("addres_company").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"detail_address2").focus();
										}
									}).open();
						}
					</script>
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         
        <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            생일 <span style="color: red">*</span> :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						
						<select name = "birthdayyear" id="birthday" >
				<option value="">선택하세요</option>
			<c:forEach var="i" begin="0" end="${2019-1900}">
    		<c:set var="birthdayyear" value="${2019-i}" />
   		 		<option value="${birthdayyear}">${birthdayyear}</option>
			</c:forEach>
			</select>
			년
			<select name = "birthdaymonth" id="birthday" >
				<option value="">선택하세요</option>
			<c:forEach var="i" begin="0" end="${12-1}">
    		<c:set var="birthdaymonth" value="${12-i}" />
   		 		<option value="${birthdaymonth}">${birthdaymonth}</option>
			</c:forEach>
			</select>
			월
			<select name = "birthdaydate" id="birthday" >
				<option value="">선택하세요</option>
			<c:forEach var="i" begin="0" end="${31-1}">
    		<c:set var="birthdaydate" value="${31-i}" />
   		 		<option value="${birthdaydate}">${birthdaydate}</option>
			</c:forEach>
			</select>
			일
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>        
                  
                 
        <div class="form-group">
									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
									<div class="col-sm-11 col-md-11 col-lg-11 col-xs-10" style="text-align:center;">
										<input type="submit" value="수정하기">
									</div>

									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
								</div>   
			
			</fieldset>
		
				</form>
                </div>
		    </div>
		    
	</div>
</div>
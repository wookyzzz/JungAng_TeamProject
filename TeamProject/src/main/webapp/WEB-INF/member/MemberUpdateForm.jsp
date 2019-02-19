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
                 <form method="post" name="challenge"  class="form-horizontal" role="form" action="update.mem" onSubmit="return submitForm()" AUTOCOMPLETE = "off" >
				 <input type="hidden" name="id" value="${member.id}">
				
				<fieldset class="landscape_nomargin" style="min-width: 0;padding:    .35em .625em .75em!important;margin:0 2px;border: 2px solid silver!important;margin-bottom: 10em;">
			<legend style="border-bottom: none;width: inherit;!important;padding:inherit;" class="legend">정보 수정</legend>
		
			<div class="form-group">
						 <div class="col-sm-12 col-md-12 col-lg-12 col-xs-12" style="text-align: right!important;">
						 
						 </div>
						</div>	
			 <div class="form-group" style="margin-bottom: 0px;">
                    <div class="col-sm-4 col-md-4 col-lg-5 col-xs-1"></div><div class="col-sm-8 col-md-8 col-lg-7 col-xs-10 mobilePad" id="message10" style=" font-size: 10pt;padding-left: 0px;"></div>                      

                    </div>
         			
		 <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            이름 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="name" id="name" value="${member.name}" readonly />
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            일반전화 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="tel" id="tel" value="${member.tel}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            핸드폰번호 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="hp" id="hp" value="${member.hp}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            닉네임 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="nick" id="nick" value="${member.nick}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            이메일 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="email" id="email" value="${member.email}">
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            기본주소1(자택) :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						
                        <input style="border-radius: 4px!important;" class="form-control" type="text" name="postcode1" id="postcode1" placeholder="우편번호" value="${member.postcode1}">
					<input style="border-radius: 4px!important;" class="form-control" type="button" onclick="Postcode1()" value="우편번호 찾기"><br>

					<input style="border-radius: 4px!important;" class="form-control" type="text" name="address1" id="address1" placeholder="주소1(자택)" value="${member.address1}"><br>
					<input style="border-radius: 4px!important;" class="form-control" type="text" name="detailaddress1" id="detailaddress1" placeholder="상세주소" value="${member.detailaddress1}">

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
				                
				                
				                $("[name=postcode1]").val(data.zonecode);
				                $("[name=address1]").val(fullRoadAddr);
				                
				                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
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
                            사업자 등록 여부 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
                        <input type="radio" name="salesauthority"  value="일반" <c:if test="${member.salesauthority=='일반'}"> checked </c:if>>일반
						<input type="radio" name="salesauthority"  value="사업가" <c:if test="${member.salesauthority=='사업가'}"> checked </c:if>>사업가
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            예치금 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="cash" id="cash" value="${member.cash}" readonly />
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         
         <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            포인트 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						<input style="border-radius: 4px!important;" type="text"  class="form-control" name="point" id="point" value="${member.point}" readonly />
                        </div>
                       <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
         </div>
         
        <div class="form-group">
                     <div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
                       <div class="col-sm-3 col-md-3 col-lg-4 col-xs-10 mobileLabel" style=" padding-top: 7px; text-align: right;">
                            생년월일 :</div>
                        
						<div class="col-sm-7 col-md-7 col-lg-6 col-xs-9 input-group mobilePad" style="font-weight:600;">
						
						<select name = "birthdayyeardate" id="birthday" >
				<option value="">선택하세요</option>
			<c:forEach var="i" begin="1900" end="2019" step="1" >
   		 		<option value="${i}" <c:if test="${member.birthdayyeardate==i}"> selected </c:if>>${i}</option>
			</c:forEach>
			</select>
			년
			<select name = "birthdaymonth" id="birthday" >
				<option value="">선택하세요</option>
			<c:forEach var="i" begin="1" end="12">
   		 		<option value="${i}" <c:if test="${member.birthdaymonth==i}"> selected </c:if> >${i}</option>
			</c:forEach>
			</select>
			월
			<select name = "birthdaydate" id="birthday" >
				<option value="">선택하세요</option>
			<c:forEach var="i" begin="1" end="31">
   		 		<option value="${i}" <c:if test="${member.birthdaydate==i}"> selected </c:if>>${i}</option>
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
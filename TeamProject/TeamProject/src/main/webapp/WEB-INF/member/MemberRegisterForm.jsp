<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
	}
</style>
</head>
<%@ include file="../common/topmenu.jsp" %>
<body>
<h2>회원 가입 화면</h2>
<form:form commandName="member" method="post" action="registerForm.mem"> 
	<!-- registerForm.me => MemberRegisterController post-->
		<p>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="soo">
			<form:errors cssClass="err" path="id" />
		</p>
		
		<p>
			<label for="passwd">비번</label>
			<input type="text" name="passwd" id="passwd" value="1234">
			<form:errors cssClass="err" path="passwd" />
		</p>
		<p>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="김수현">
			<form:errors cssClass="err" path="name" />
		</p>
		<p>
			<label for="tel">일반전화</label>
			<input type="text" name="tel" id="tel" value="02-2000-1000">
			<form:errors cssClass="err" path="tel" />
		</p>
		<p>
			<label for="hp">핸드폰번호</label>
			<input type="text" name="hp" id="hp" value="010-2111-3111">
			<form:errors cssClass="err" path="hp" />
		</p>
		<p>
			<label for="nick">닉네임</label>
			<input type="text" name="nick" id="nick" value="수현">
			<form:errors cssClass="err" path="nick" />
		</p>
		<p>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="aaa@gmail.com">
			<form:errors cssClass="err" path="email" />
		</p>
	
		<p>
			<label for="address1">기본주소1(자택)</label>
				<input type="text" name="postcode1" id="postcode1" placeholder="우편번호">
					<input type="button" onclick="Postcode1()" value="우편번호 찾기"><br>

					<input type="text" name="address1" id="address1" placeholder="주소1(자택)"><br>
					<input type="text" name="detail_address1" id="detail_address1" placeholder="상세주소">


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
					</p>
			<p>
			<label for="address2">기본주소2(회사)</label>
			<input type="text" name="postcode2" id="postcode2" placeholder="우편번호">
					<input type="button" onclick="Postcode2()" value="우편번호 찾기"><br>

					<input type="text" name="address2" id="address2" placeholder="주소2(회사)"><br>
					<input type="text" name="detail_address2" id="detail_address2" placeholder="상세주소">


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
					</p>
		
			
		<p>
			<label for="salesauthority">사업자 등록 여부</label>
			<input type="radio" name="salesauthority" id="salesauthority" value="false">일반
			<input type="radio" name="salesauthority" id="salesauthority" value="true">사업자
			
		</p>
		<p>
			<label for="cash">예치금</label>
			<input type="text" name="cash" id="cash" value="0">  
		</p>	
		
		<p>
			<label for="point">적립포인트</label>
			<input type="text" name="point" id="point" value="100">
		</p>
		
		<p>
			<label for="birthday">생일</label>
			
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
		</p>
		<p>
			<input type="submit" value="추가하기" id="btnSubmit">		
		</p>
		</form:form>
</body>
</html>

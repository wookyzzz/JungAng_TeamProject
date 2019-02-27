<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.white a {
	color: #fff
}

#subImg:hover {
	border: 2px solid red;
}

.prdName {
	font-weight: bold;
	font-size: 20px;
}

.prdContents table {
	width: 100%;
	heigth: 50px;
	line-height: 50px;
}

.prdContents tr {
	background-color: #F6F6F6;
}

.prdContents tr td a:HOVER {
	cursor: pointer;
}

.prdContents a {
	color: black;
	font-size: 14px;
}

.menu.sel a {
	color: #F0AD4B;
	font-size: 14px;
	font-weight: bold;
	border-bottom: 2px solid #F0AD4B;
}

#sub {
	width: 50px;
	height: 50px;
	background-color: white;
	position: absolute;
	margin-top: 50px;
}

#labelll {
	cursor: pointer;
}

#date {
	color: gray;
	font-size: 10px;
}
#labelll {
	cursor: pointer;
}
#pwch{
	float:left;
}
#date {
	color: gray;
	font-size: 10px;
}
#menubar{
	border-top: 1px solid #F0AD4B;
	border-bottom: 1px solid #F0AD4B;
}
#reviewWrite
{
	
}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/contentview.js?ver=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {

		$('td').click(function() {
			$('td').removeClass('sel');
			$(this).addClass('sel');
		});

		imgsrc = "";
		$("#Div_img img").each(function() {
			imgsrc += $(this).attr("src");
			imgsrc += "\n";
		});
		imgSplit = imgsrc.split("\n");
		firstImg = imgSplit[0];
		$("#Div_img").empty();
		$("#Div_img")
				.append(
						'<img  src="'+firstImg+'"  width="200px" height="200px " id="firstImg"/><br><br>');
		for (i = 0; i < imgSplit.length - 1; i++) {
			$("#Div_img")
					.append(
							'<img  src="'
									+ imgSplit[i]
									+ '"  width="50px" height="50px " id="subImg" onmouseover="mainImg(\''
									+ imgSplit[i] + '\')"/>');
		}
	});
	function mainImg(img) {
		$("#firstImg").attr('src', img);
	}
	function qtDown() {
		qt = $("#quantity").val();
		if (qt == "1") {
			alert('최소 구매 갯수는 1개 이상입니다.');
		} else {
			$("#quantity").val(qt - 1);
		}
	}
	function qtUp() {
		qt = $("#quantity").val();
		$("#quantity").val(parseInt(qt) + parseInt(1));
	}
	
	function reviewSetting(size){
	reviewImg="";
		for(i=1;i<=size;i++){
			$("#reviewimg_"+i+" img").each(function() {
				reviewImg += $(this).attr("src")+"\n";
			});	
		revieImgSplit = reviewImg.split("\n");
		$("#reviewimg_"+i).empty();
		for(j=0;j<revieImgSplit.length-1;j++){
			$("#reviewimg_"+i).append(
					'<img  src="'+ revieImgSplit[j]+ '"  width="50px" height="70px " id="reviewImgImg")"/> &nbsp;');
		}
		}
	}
	function purchase_check(seller,id,quantity){
		input_quantity = document.getElementById("quantity").value;
		if(id==""){
			alert("로그인 후에 이용해주세요.");
			location.href="LoginForm.mem";
			return false;
		}
		if(seller==id){
			alert("판매자는 구매할 수 없습니다.");
			return false;
		}
		if(quantity==0){
			alert('품절된 상품입니다.');
			return false;
		}
		if(quantity<input_quantity){
			alert('주문 수량 초과');
			return false;
		}
	}
	function cart_check(seller,id,prdNum,quantity,price){
		input_quantity = document.getElementById("quantity").value;
		if(id==""){
			alert("로그인 후에 이용해주세요.");
			location.href="LoginForm.mem";
			return false;
		}
		if(seller==id){
			alert("판매자는 장바구니에 상품을 넣을 수 없습니다.");
			return false;
		}
		if(quantity==0){
			alert('품절된 상품입니다.');
			return false;
		}
		if(quantity<input_quantity){
			alert('주문 수량 초과');
			return false;
		}
		location.href="insertCart.prd?memId="+id+"&prdNum="+prdNum+"&quantity="+input_quantity +"&totalPrice="+price;
	}
	function loginCheck(id){
		if(id==""){
			alert("로그인 후에 이용해주세요.");
			location.href="LoginForm.mem";
			return false;
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/images/110.png"></c:set>
<%
	int prdNum = Integer.parseInt(request.getParameter("prdNum"));
	String pageNumber = request.getParameter("pageNumber");
%>
<body onload="reviewSetting(${reviewLists.size()})">

${loginfo.id} , ${prdView.memId}
	<%@ include file="../common/topmenu.jsp"%>
	<form action="prdPurchaseForm.prd" method="post">
	<div class="container">
		<div class="row"></div>
		<div class="section">
			<table class="table table-defalut">
				<thead>
					<tr>

						<td width=300px height=200px rowspan=4 align=center><div
								id="Div_img">${prdView.contents}</div></td>
						<td width=200px height=30px colspan=2 class="prdName">${prdView.name}</td>
					</tr>
					<tr>
						<td width=10%>가격</td>
						<td><fmt:formatNumber value="${prdView.price}" pattern="#,###" />&nbsp;&nbsp;(<font size="2px" color="red">${prdView.point}</font><font
							color="gray"> point)  (남은갯수: ${prdView.quantity})</font></td>
					</tr>
					<tr>
						<td width=10%>수량</td>
						<td width=200px><input type="text" name="totalQuantity"
							id="quantity" value="1" style="width: 30px;"> <input
							type="button" id="down" class="bt" value="◀" onclick="qtDown()">
							<input type="button" class="bt" id="up" value="▶" onclick="qtUp()"></td>
			</table>
			<input type="hidden" name="memId" value="${loginfo.id }">
			<input type="hidden" name="prdNum" value="<%=prdNum%>">
			<input type="hidden" name="price" value="${prdView.price }">
			<input type="hidden" name="quantity" value="${prdView.quantity}">
			<input type="hidden" name="name" value="${prdView.name}">
			<input type="hidden" name="deliverycharge" value="${prdView.deliverycharge}">
			<div style="margin-left: 700px">
				<input type="submit" style="width: 150px; height: 50px" class="btn btn-primary" value="구매하기" onclick="return purchase_check('${prdView.memId}','${loginfo.id}','${prdView.quantity}')">
				&nbsp;&nbsp;
				<input	type="button" style="width: 150px; height: 50px" class="btn btn-warning" value="장바구니" onclick="return cart_check('${prdView.memId}', '${loginfo.id}', '<%=prdNum%>', '${prdView.quantity}' ,'${prdView.price}')">
			</div></form>
			<br> <br>

			<div align=center class="prdContents">
				<table>
					<tr align=center id="menubar">
						<td width=33% class="menu sel"><a href="#view">상품상세정보</a></td>
						<td width=33% class="menu"><a href="#review">상품후기</a></td>
						<td width=33% class="menu"><a href="#qna">상품QnA</a></td>
					</tr>
				</table>
				<br> <br>
				<div id="view" class="section">
					${prdView.contents}
				</div>
				<br> <br>
				<table>
					<tr align=center id="menubar">
						<td width=33% class="menu"><a href="#view">상품상세정보</a></td>
						<td width=33% class="menu sel"><a href="#review">상품후기</a></td>
						<td width=33% class="menu"><a href="#qna">상품QnA</a></td>
					</tr>
				</table>
				<br><br>
				<div id="review" class="section">
					<table class="table">
						<c:if test="${reviewLists.size()==0 }"><tr>
							<td>
						작성된 후기가 없습니다.</td></tr>
					</c:if> <c:if test="${reviewLists.size()!=0 }">
									<c:forEach items="${reviewLists}" var="review" varStatus="i">
									<tr><td>
										<h5 id="h5">${review.memId }
											<small>${review.inputdate }</small>&nbsp;
											<c:set value="${review.grade}" var="grade"></c:set>
											<c:if test="${grade==1}">
												<font color="#F0AD4B">★☆☆☆☆</font>
											</c:if>
											<c:if test="${grade==2}">
												<font color="#F0AD4B">★★☆☆☆</font>
											</c:if>
											<c:if test="${grade==3}">
												<font color="#F0AD4B">★★★☆☆</font>
											</c:if>
											<c:if test="${grade==4}">
												<font color="#F0AD4B">★★★★☆</font>
											</c:if>
											<c:if test="${grade==5}">
												<font color="#F0AD4B">★★★★★</font>
											</c:if>
										</h5>
										<div><a href="reviewContetns.prd?idx=${review.idx}">${review.subject}</a></div>
										<div id="reviewimg_${i.count}">${review.contents}</div>
									</td>
						</tr>
									</c:forEach>
								</c:if>
					</table>
					<form action="orderList.prd" method="post">
							<div align=right>
						<input type="submit" value="후기 작성" class="btn btn-default" onclick="return loginCheck('${loginfo.id }')">
						<input type="hidden" value="${loginfo.id }" name="memId">
						<input type="hidden" value="<%=pageNumber%>" name="pageNumber">
						<input type="hidden" value="<%=prdNum%>" name="prdNum">
						</div>
						</form> <!-- 구매내역 확인하기! -->
				</div>
					<center>${pageInfo_Review.pagingHtml}</center>
				<!-- div review -->
				<br>
				<br>
				<table>
					<tr align=center id="menubar">
						<td width=33% class="menu "><a href="#view">상품상세정보</a></td>
						<td width=33% class="menu"><a href="#review">상품후기</a></td>
						<td width=33% class="menu sel"><a href="#qna">상품QnA</a></td>
					</tr>
				</table>
				<br> 
				<div id="qna" class="section">
					<form action="prdQnA.prd" method="post">
						<div class="panel panel-default inputreply">
							<div class="panel-body">
								<textarea class="form-control" name="contents" cols="80"
									rows="10" id="prdQnAContents"
									placeholder="상품에 대해 궁금한 점을 입력하세요."
									onclick="loginCheck('${loginfo.id}','${prdView.memId}')"></textarea>
							</div>
							<div class="panel-footer footer" align=right>
								<div id="pwch">
									<input type="checkbox" id="passbox" onchange="checkPass()">비밀글&nbsp;
									<span id="inputPasswd"></span><span id="passMessage"></span>
								</div>
								<input type="submit" value="등록" class="btn btn-default btn-sm"
									onclick="return checkErr()"> <input type="hidden"
									name="prdNum" value="<%=prdNum%>"> <br> <input
									type="hidden" name="memId" value="${loginfo.id}"> <br>
							</div>
						</div> 
					</form>
					<table class="table">
	<c:if test="${QnALists.size()==0 }"> <!-- 등록된 글이 없을 때 -->
			<tr>
				<td>작성된 상품 문의가 없습니다.</td>
			</tr>
	</c:if>
		<c:if test="${QnALists.size() ne 0 }"> <!-- 등록된 글이 있을 때 -->
			<c:forEach items="${QnALists}" var="q">
				<tr>
					<td>
						<c:if test="${prdView.memId eq loginfo.id}">  <!-- 판매자 아이디가 로그인 했을 때 -->
						<c:if test="${q.passwd eq null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5"><c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;
										<a  href="javascript:answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  href="javascript:delQnA('${q.prdNum }','${q.ref }','${q.restep }','${q.idx }')" >삭제</a></c:if></h5>
											<p>${q.contents }</p>
										<div id="answerMessage_${q.ref}_${q.restep}"></div>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId}">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  href="javascript:answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }','${q.memId }')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a href="javascript:delQnA('${q.prdNum}','${q.ref }','${q.restep }','${q.idx }')" >삭제</a></c:if></h5>
										<p><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }">${q.contents }</p>
									<div id="answerMessage_${q.ref}_${q.restep}"></div>
										</c:if>
								</c:if>
							<c:if test="${q.passwd ne null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5">
										<c:if test="${q.memId eq prdView.memId}">판매자</c:if>
										<c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>
										&nbsp;&nbsp;
										<a  href="javascript:answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }','${q.memId }')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  href="javascript:delQnA('${q.prdNum }','${q.ref }','${q.relevel }','${q.idx }')" >삭제</a></c:if></h5>
											<p id="contents_${q.ref}_${q.restep}"><img src="<%=request.getContextPath()%>/images/lock.png" width=15
											 height=15>${q.contents }</p>
										<div id="answerMessage_${q.ref}_${q.restep}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5">
										<img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  href="javascript:answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }')" id="labelll">답변</a></h5>
										<p id="contents_${q.ref}_${q.restep}"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>${q.contents}</p>
										<div id="answerMessage_${q.ref}_${q.restep}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form>
											
										</c:if>
								</c:if>
						</c:if>
						<c:if test="${prdView.memId ne loginfo.id }"> <!-- 로그인한 아이디랑 판매자 아이디가 같지 않을 때 -->
									<c:if test="${q.passwd eq null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5"><c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if><small>${q.inputdate }</small>&nbsp;&nbsp;<a  href="javascript:answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id}')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  href="javascript:delQnA('${q.prdNum }','${q.ref }','${q.relevel }','${q.idx }')" >삭제</a></c:if></h5>
											<p>${q.contents }</p>
										<div id="answerMessage_${q.ref}_${q.restep}"></div>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  href="javascript:answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id}')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  href="javascript:delQnA('${q.prdNum }','${q.ref }','${q.relevel }','${q.idx }')" >삭제</a></c:if></h5>
										<p><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }">${q.contents }</p>
									<div id="answerMessage_${q.ref}_${q.restep}"></div>
										</c:if>
								</c:if>
								<c:if test="${q.passwd ne null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5"><c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<span id="ahref_${q.ref}_${q.restep}"></span></h5>
											<c:if test="${q.memId eq loginfo.id }"><p id="contents_${q.ref}_${q.restep}"><label onclick="fff('${q.restep}','${q.passwd}','${q.prdNum}','${q.ref}','${q.relevel}','${q.memId }','${loginfo.id }')" id="labelll"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p>
										<div id="answerMessage_${q.ref}_${q.restep}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form></c:if>
											<c:if test="${q.memId ne loginfo.id }"><p id="contents_${q.ref}_${q.restep}"><label id="labelll"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p>
										<div id="answerMessage_${q.ref}_${q.restep}"></div></c:if>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<span id="ahref_${q.ref}_${q.restep}"></span></h5>
										<c:if test="${q.memId eq loginfo.id }"><p id="contents_${q.ref}_${q.restep}">
										<img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><label onclick="fff('${q.restep}','${q.restep}','${q.passwd}','${q.prdNum}','${q.ref}','${q.relevel}','${q.memId }','${loginfo.id }')" id="labelll"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p>
										<div id="answerMessage_${q.ref}_${q.restep}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form></c:if>
											<c:if test="${q.memId ne loginfo.id }"><p id="contents_${q.ref}_${q.restep}"><label id="labelll"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p></c:if>
										</c:if>
								</c:if>
					</c:if>
				</td>
			</c:forEach>
			</c:if>
	</table>
		<center>${pageInfo_QnA.pagingHtml}</center>
					</div><!-- <div id="qna" class="section"> -->
				</div>	<!-- <div align=center class="prdContents"> -->
</body>
</html>
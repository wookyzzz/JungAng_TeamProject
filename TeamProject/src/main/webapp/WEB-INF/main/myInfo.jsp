<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<div class="container">
		<div class="page-header">
			<h2>내 정보<small>내 정보 보기</small></h2>
		</div>
		<div class="section">
			<div class="col-md-offset-2 col-md-8">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				  <div class="panel panel-default">
				    <div class="panel-heading" role="tab" id="headingOne">
				      <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          기본정보
				        </a>
				      </h4>
				    </div>
				    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				      <div class="panel-body">
				      	<table class="table" width="100%" height="300px">
							<tbody>
								<tr>
									<th>이름</th>
									<td>${loginfo.name }</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>${loginfo.nick }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${loginfo.email }</td>
								</tr>
							</tbody>
						</table>
				      </div>
				    </div>
				  </div>
				  <div class="panel panel-default">
				    <div class="panel-heading" role="tab" id="headingTwo">
				      <h4 class="panel-title">
				        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				          상세정보
				        </a>
				      </h4>
				    </div>
				    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				      <div class="panel-body">
					      <table class="table" width="100%" height="500px">
							<tbody>
								<tr>
									<th>일반전화</th>
									<td>${loginfo.tel }</td>
								</tr>
								<tr>
									<th>핸드폰</th>
									<td>${loginfo.hp }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${loginfo.email }</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<address>
											<strong>${loginfo.postcode1 }</strong><br>
											${loginfo.address1 }<br>
											${loginfo.detailaddress1 }
										</address>
									</td>
								</tr>
								<tr>
									<th>포인트</th>
									<td>${loginfo.point }</td>
								</tr>
							</tbody>
						</table>
				      </div>
				    </div>
				  </div>
				  <div class="panel panel-default">
				    <div class="panel-heading" role="tab" id="headingThree">
				      <h4 class="panel-title">
				        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				          활동내역
				        </a>
				      </h4>
				    </div>
				    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
				      <div class="panel-body">
				      	<table class="table" width="100%" height="300px">
				      		<tr>
				      			<th>작성글</th>
				      			<td>${letterCount }개</td>
				      			<td><input type="button" class="btn btn-info btn-sm" value="보기" onClick="location.href='myletter.main'"></td>
				      		</tr>
				      		<tr>
				      			<th>작성댓글</th>
				      			<td>${replyCount }개</td>
				      			<td><input type="button" class="btn btn-info btn-sm" value="보기" onClick="location.href='myreply.main'"></td>
				      		</tr>
				      		<tr>
				      			<th>구매한 상품</th>
				      			<td>${buyCount }</td>
				      			<td><input type="button" class="btn btn-info btn-sm" value="보기" onClick="location.href='orderList.prd?memId=${loginfo.id}'"></td>
				      		</tr>
				      	</table>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-5 col-md-2">
					<input type="button" class="btn btn-success btn-block" value="정보수정" onClick="location.href='update.mem'">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
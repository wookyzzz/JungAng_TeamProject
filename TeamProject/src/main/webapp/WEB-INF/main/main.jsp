<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.outer-board{
	margin : 10px;
	padding-top : 20px;
	padding-left : 10px;
	padding-right : 10px;
	padding-bottom : 10px;
	border: 1px solid #BDBDBD;
	border-radius : 10px;
}
.center-line{
	board : 1px solid #BDBDBD;
}
</style>
</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<div>
	
	</div>
	<div class="row">
		<div class="col-md-12" style="background: rgba(255, 0, 0, 0.5); width: 100%; height:350px;">
			
		</div>
	</div>
	<div class="container">
		<div class="section">
			<div class="row">
				<div class="col-md-8">
					<div class="outer-board" style="height:285px;">
						<div class="tabpanel panel-success">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active">
									<a href="#best" aria-control="best" role="tab" data-toggle="tab">베스트 Top10</a>
								</li>
							</ul>
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="best">
									<ul>
										<c:forEach var="best" items="${bestList }">
											<li><a href="contentview.bbs?idx=${best.idx }&boardPage=1">${best.subject }</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4" >
					<div class="outer-board" style="height:185px;">
						<c:choose>
							<c:when test="${loginfo == null }">
								<form class="form-horizontal" action="LoginForm.mem" method="post">
									<div class="form-group">
										<div class="col-sm-offset-1 col-sm-10">
											<input type="text" name="id" class="form-control" placeholder="아이디">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-1 col-sm-10">
											<input type="password" name="passwd" class="form-control" placeholder="비밀번호">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-1 col-sm-7">
											<input type="submit" class="btn btn-success btn-sm" value="로그인">
											&nbsp;&nbsp;
											<input type="button" class="btn btn-info btn-sm" value="회원가입" onClick="location.href='registerForm.mem'">
										</div>
										<div class="col-sm-4">
											<small><a href="">아이디찾기</a></small>
										</div>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								내정보
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-md-4">
					<div class="outer-board">
						이건 어떻게?
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="outer-board">
						<div class="tabpanel">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active">
									<a href="#free" aira-controls="free" role="tab" data-toggle="tab">자유게시판</a>
								</li>
								<li role="presentation">
									<a href="#humor" aira-controls="humor" role="tab" data-toggle="tab">유머게시판</a>
								</li>
							</ul>
							<div class="tab-content">
								<div role="tabpenel" class="tab-pane active" id="free">
									<ul>
										<c:forEach var="free" items="${freeList }">
											<li><a href="contentview.bbs?idx=${free.idx }&boardPage=1">${free.subject }</a></li>
										</c:forEach>
									</ul>
								</div>
								<div role="tabpenel" class="tab-pane" id="humor">
									<ul>
										<c:forEach var="humor" items="${humorList }">
											<li><a href="contentview.bbs?idx=${humor.idx }&boardPage=1">${humor.subject }</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="outer-board">
						<span>여기에는 뭘 넣지 날씨?</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="center-line">
	<div class="container">
		<div class="section2">
			<div class="row">
				<h2>추천상품</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="outer-board">
						<div class="row">
							<div class="col-md-3">
								<div class="thumbnail">
									<img src="..." alt="...">
									<div class="caption">
										<h4>상품이름</h4>
										<p>상품설명</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="thumbnail">
									<img src="..." alt="...">
									<div class="caption">
										<h4>상품이름</h4>
										<p>상품설명</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="thumbnail">
									<img src="..." alt="...">
									<div class="caption">
										<h4>상품이름</h4>
										<p>상품설명</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="thumbnail">
									<img src="..." alt="...">
									<div class="caption">
										<h4>상품이름</h4>
										<p>상품설명</p>
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.outer-board, .zero-padding{
	margin : 10px;
	padding : 10px; 
	border: 1px solid #BDBDBD;
	border-radius : 10px;
}
hr{
	boarder-top : 1px solid #BDBDBD;
	boarder-bottom : 1px solid #BDBDBD;
}
.zero-padding{
	padding : 0px;
}
.navbar{
	height : 52px;
}
img{
 width : 242px;
 height : 200px;
}
</style>
<script type="text/javascript">
	function imgSrc(size){
		for(i=1;i<=size;i++){
			name = $("#img_"+i+" span").html();
			console.log(name)
			imgSrc = $("#img_"+i+" img").attr("src");
			$("#img_"+i).empty();
			var html = '<img  src="'+imgSrc+'" id="upImg_'+i+'"/>'
			html += "<div class='caption'><h4 id='name_"+i+"'>"+name+"</h4><div>";
			 img = $("#img_"+i).append(html);
			imgX = $("#upImg_"+i).attr('src');
			console.log(imgX);
			if(imgX=='...'){
				$("#upImg_"+i).attr("src","${pageContext.request.contextPath }/resources/images/no_image.png");
			}
		}
	}
	function mainsearch(){
		alert("구현중 XD")
	}
</script>
</head>
<body onload="imgSrc('${prdList.size()}')">
	<%@ include file="../common/topmenu.jsp" %>
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
					<c:choose>
						<c:when test="${loginfo == null }">
							<div class="outer-board" style="height:185px;">
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
											<input type="submit" class="btn btn-success btn-block" value="로그인">
										</div> 
										<div class="col-sm-4">
											<small><a href="">아이디찾기</a></small><br>
											<small><a href="">비밀번호찾기</a></small>
											
										</div>
									</div>
								</form>
							</div>
						</c:when>
						<c:otherwise>
							<div class="panel panel-default outer-board" style="height:185px;">
								<div class="panel-heading">
									<strong>${loginfo.nick }</strong><small>(${loginfo.name })</small>님
									<a href="myinfo.main" class="pull-right"><span style="font-size:12px;">내정보</span></a>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-sm-offset-1 col-sm-10">
										My Point &nbsp;<strong><fmt:formatNumber value="${loginfo.point }" type="number" pattern="#,##0"/></strong>
										</div>
									</div>
									<p></p>
									<div class="row">
										<div class="col-sm-4">
											<a href="myletter.main"><button type="button" class="btn btn-info">내가쓴글</button></a>
										</div>
										<div class="col-sm-4">
											<a href="myreply.main"><button type="button" class="btn btn-info">나의댓글</button></a>
										</div>
										<div class="col-sm-4">
											<a href="orderList.prd?memId=${loginfo.id}"><button type="button" class="btn btn-info">주문내역</button></a>
										</div>
									</div>
									<hr>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-4">
					<div class="outer-board zero-padding">
						<c:if test="${loginfo == null }">
							<input type="button" class="btn btn-info btn-lg btn-block" value="회원가입" onClick="location.href='registerForm.mem'">
						</c:if>
						<c:if test="${loginfo != null }">
							<input type="button" class="btn btn-info btn-lg btn-block" value="로그아웃" onClick="location.href='logout.mem'">
						</c:if>
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
					<form class="form-inline">
						<div class="form-group">
							<label class="sr-only" for="mainSearch">메인검색창</label>
							<div class="col-md-12 input-group ">
								<input type="text" class="form-control" name="search" id="search">
								<div class="input-group-addon"><a href="javascript:mainsearch()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<hr class="center-line">
	<div class="container">
		<div class="section2">
			<div class="row">
				<h2>인기상품</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="outer-board">
						<div class="row">
							<c:forEach var="prd" items="${prdList }" varStatus="i">
								<div class="col-md-3">
									<a href="prodView.prd?prdNum=${prd.idx }">
										<div class="thumbnail" id="img_${i.count }">
											${prd.contents }
											<img src="..." alt="...">
											<span>${prd.name }</span>
											<div class="caption">
												<p>${prd.contents }</p>
												<h4>${prd.name }</h4>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
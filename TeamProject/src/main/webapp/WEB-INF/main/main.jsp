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

@import url(https://fonts.googleapis.com/css?family=Lato:100,900);
html, body {
  height: 100%;
  font-family: 'Lato', sans-serif;
  font-weight: 100;
}

h1, h2, h3, h4 {
  font-weight: 900;
}

.slider {
  overflow: hidden;
  position: relative;
  width: 100%;
  height: 100%;
  margin: 0 auto;
}
.slider .slider-control {
  -webkit-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
  width: 48px;
  height: 48px;
  position: absolute;
  top: 50%;
  margin-top: -24px;
  z-index: 1;
  border-radius: 50%;
  background: #FFF;
  opacity: .8;
  cursor: pointer;
  line-height: 48px;
  text-align: center;
}
.slider .slider-control:hover {
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);
  transform: scale(1.1);
  background: #222;
}
.slider .slider-control.slide-left {
  left: 24px;
}
.slider .slider-control.slide-right {
  right: 24px;
}
.slider .slider-control i {
  color: #ccc;
  line-height: 48px;
}
.slider .slide-box {
  -webkit-transition: all 0.8s ease-out;
  -moz-transition: all 0.8s ease-out;
  transition: all 0.8s ease-out;
  height: 100%;
  width: 999999px;
}
.slider .slide-box img {
  width: 100%;
}
.slider .slide-box .slide {
  -webkit-transition: all 0.8s ease-out;
  -moz-transition: all 0.8s ease-out;
  transition: all 0.8s ease-out;
  background-size: cover;
  background-position: center center;
  float: left;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: 0 0 20000px #000;
  z-index: 10;
}
.slider .slide-box .slide .slide-content {
  height: 40%;
  font-size: 22px;
  min-height: 200px;
  width: 40%;
  min-width: 300px;
  color: #FFF;
  background: rgba(51, 77, 153, 0.5);
  text-align: center;
}
.sliderA{
	color:#FFFFFF;

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
			<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">  
<div class="slider">
    <div class="slider-control slide-left"><i class="fa fa-minus fa-2x"></i></div>
  <div class="slider-control slide-right"><i class="fa fa-plus fa-2x"></i></div>
    <div class="slide-box">
      <div class="slide" style="background-image: url(${pageContext.request.contextPath }/resources/images/community.jpg);">
        <div class="slide-content">
          <H1><a href="list.bbs?catNum=500" class="sliderA">Community</a></H1>
          <p>자유롭게 유용한 정보를 공유하는 곳입니다.</p>
        </div>
      </div>
      
      <div class="slide" style="background-image: url(${pageContext.request.contextPath }/resources/images/home_appliances.jpg);">
      <div class="slide-content">
          <H1><a href="list.prd?catNum=100" class="sliderA">장터(가전제품)</a></H1>
          <p>가전제품코너에서 신상품을 만나보세요!</p>
        </div>
      </div>
      
      <div class="slide" style="background-image: url(${pageContext.request.contextPath }/resources/images/daily_supplies.jpg);">
      <div class="slide-content">
          <H1><a href="list.prd?catNum=200" class="sliderA">장터(생활용품)</a></H1>
          <p>생활용품에서 안전한 거래를!</p>
        </div>
      </div>
    </div>
</div>
<script>
      var $slider = $('.slider');
  var $slideBox = $slider.find('.slide-box');
  var $leftControl = $slider.find('.slide-left');
  var $rightControl = $slider.find('.slide-right');
  var $slides = $slider.find('.slide');
  var numItems = $slider.find('.slide').length;
  var position = 0;


  var windowWidth = $(window).width();
  $slides.width(windowWidth);
  $leftControl.on('click', function(){
    var width = $slider.width();
    position = position - 1 >= 0 ? position - 1 : numItems - 1;
    if(position != numItems-1){
      $slider.find('.slide').eq(position + 1).css('margin-left', 0);
    }
    else{
      $slider.find('.slide:gt(0)').each(function(index){
        $(this).css('margin-left', width * -1 + 'px');
      });
    }
  });

  $rightControl.on('click', function(){
    var width = $slider.width();
    position = position + 1 < numItems ? position + 1 : 0;
    if(position != 0){
      $slider.find('.slide').eq(position).css('margin-left',  width * -1 + 'px');
    }
    else{
      $slider.find('.slide').css('margin-left', 0);
    }
  });

  $(window).resize(function(){
   $slides.width($(window).width()).height($(window).height);
  });
</script>
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
											<small><a href="findidForm.mem">아이디찾기</a></small><br>
											<small><a href="findpwForm.mem">비밀번호찾기</a></small>
											
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
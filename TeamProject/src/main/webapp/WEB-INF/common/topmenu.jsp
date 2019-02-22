<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function urlCheck(url,idx){
		if(url=="list.prd"){
			location.href=url+"?catNum="+idx;
		}
		else{
			location.href=url;
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
nav{
	padding-left: 20px;
	padding-right: 20px;
	margin-top:40x;
	background-color: orange;
	color:#FFFFFF;
}
.affix {
   top: 0;
   width: 100%;
   z-index: 9999 !important;
 }

 .affix + .container {
   padding-top: 70px;
 }
 h1 > a{
 	color:#FFFFFF;
 }
</style>
</head>
<body>
<<<<<<< HEAD
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-collapse">
					<c:forEach var="cate" items="${ctList }">
						<li class="dropdown-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${cate.name } <span class="caret"></span></a>
									<ul class="dropdown-menu">
							<c:forEach var="detail" items="${detailList }">
								<c:if test="${detail.catNum eq cate.idx }">
										<li><a href="javascript:urlCheck('${detail.url}','${detail.idx }')" >${detail.name }/${detail.url }</a></li>
								</c:if>
							</c:forEach>
									</ul>
						</li>
					</c:forEach>
					<form class="navbar-form navbar-right">
			        <div class="form-group">
			          <select class="form-control" name="column">
			          	<option value="">전체검색
			          	<option value="title">제목
			          	<option value="content">내용
			          </select>
			          <input type="text" name="search" class="form-control" placeholder="Search">
			        </div>
			        <button type="submit" class="btn btn-default">검색</button>
			      </form>
			      <ul class="nav navbar-nav navbar-right">
			      	<c:if test="${loginfo == null }">
						<a href="LoginForm.mem"><button type="button" class="btn btn-default navbar-btn">로그인</button></a>
=======
	<div class="container" style="background-color:red;">
		<h1 style="color:white; font-weight: bold;"><a href="list.main">웹사이트 이미지 or 이름</a></h1>
	</div>
	<nav class="navbar navbar-defult" data-spy="affix" data-offset-top="70">
	 <!--  <div class="container-fluid"> -->
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="list.main">Home</a></li>
	      <c:forEach var="cate" items="${ctList }">
		      <li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${cate.name }
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		         <c:forEach var="detail" items="${detailList }">
					<c:if test="${detail.catNum eq cate.idx }">
						<li><a href="${detail.url }">${detail.name }/${detail.url }</a></li>
>>>>>>> branch 'master' of https://github.com/wookyzzz/JungAng_TeamProject.git
					</c:if>
				</c:forEach>
		        </ul>
		      </li>
	      </c:forEach>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	    	<c:if test="${loginfo == null }">
				<li><a href="registerForm.mem"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
	    			<li><a href="LoginForm.mem"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			</c:if>
			<c:if test="${loginfo != null }">
				<div class="btn-group">
					<button type="button" class="btn btn-default navbar-btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						${loginfo.id } <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="update.mem">내 정보 수정</a></li>
						<li><a href="logout.mem">로그아웃</a></li>
					</ul>
				</div>
	      	</c:if>
	    </ul>
	 <!--  </div> -->
	</nav>
</body>
</html>
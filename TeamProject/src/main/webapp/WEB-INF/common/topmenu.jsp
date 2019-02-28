<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function urlCheck(url,idx){
			location.href=url+"?catNum="+idx;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
nav{
	padding-left: 20px;
	padding-right: 20px;
	margin-top:40x;
	background-color: #5bc0de;
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
 h2 > a{
 	color:#FFFFFF;
 }
 .char1 {
  animation: rainbow 3s linear infinite;
  animation-delay: 0.2s;
}

.char2 {
  animation: rainbow 3s linear infinite;
  animation-delay: 0.4s;
}

.char3 {
  animation: rainbow 3s linear infinite;
  animation-delay: 0.6s;
}

.char4 {
  animation: rainbow 3s linear infinite;
  animation-delay: 0.8s;
}

.char5 {
  animation: rainbow 3s linear infinite;
  animation-delay: 1s;
}

.char6 {
  animation: rainbow 3s linear infinite;
  animation-delay: 1.2s;
}

.char7 {
  animation: rainbow 3s linear infinite;
  animation-delay: 1.4s;
}

.char8 {
  animation: rainbow 3s linear infinite;
  animation-delay: 1.6s;
}

.char9 {
  animation: rainbow 3s linear infinite;
  animation-delay: 1.8s;
}

.char10 {
  animation: rainbow 3s linear infinite;
  animation-delay: 2s;
}

.char11 {
  animation: rainbow 3s linear infinite;
  animation-delay: 2.2s;
}

.char12 {
  animation: rainbow 3s linear infinite;
  animation-delay: 2.4s;
}

@keyframes rainbow {
  0% {
    color: red;
    text-shadow: 0px 0px 0 #b80000, 1.5px -1px 0 #9c0000, 3px -2px 0 #950000, 4.5px -3px 0 #8e0000, 6px -4px 0 #880000, 7.5px -5px 0 #810000, 9px -6px 0 #7a0000, 10.5px -7px 0 #740000, 12px -8px 0 #6d0000, 13.5px -9px 0 #670000, 15px -10px 0 #600000, 16.5px -11px 0 #590000, 18px -12px 0 #530000, 0 0 52px rgba(255, 71, 71, 0.5), 0 0 55px rgba(255, 71, 71, 0.5);
  }
  10% {
    color: #ff9900;
    text-shadow: 0px 0px 0 #b86e00, 1.5px -1px 0 #9c5d00, 3px -2px 0 #955900, 4.5px -3px 0 #8e5500, 6px -4px 0 #885100, 7.5px -5px 0 #814d00, 9px -6px 0 #7a4900, 10.5px -7px 0 #744500, 12px -8px 0 #6d4100, 13.5px -9px 0 #673e00, 15px -10px 0 #603a00, 16.5px -11px 0 #593600, 18px -12px 0 #533200, 0 0 52px rgba(255, 182, 71, 0.5), 0 0 55px rgba(255, 182, 71, 0.5);
  }
  20% {
    color: #ccff00;
    text-shadow: 0px 0px 0 #93b800, 1.5px -1px 0 #7c9c00, 3px -2px 0 #779500, 4.5px -3px 0 #728e00, 6px -4px 0 #6d8800, 7.5px -5px 0 #678100, 9px -6px 0 #627a00, 10.5px -7px 0 #5d7400, 12px -8px 0 #576d00, 13.5px -9px 0 #526700, 15px -10px 0 #4d6000, 16.5px -11px 0 #475900, 18px -12px 0 #425300, 0 0 52px rgba(218, 255, 71, 0.5), 0 0 55px rgba(218, 255, 71, 0.5);
  }
  30% {
    color: #33ff00;
    text-shadow: 0px 0px 0 #25b800, 1.5px -1px 0 #1f9c00, 3px -2px 0 #1e9500, 4.5px -3px 0 #1c8e00, 6px -4px 0 #1b8800, 7.5px -5px 0 #1a8100, 9px -6px 0 #187a00, 10.5px -7px 0 #177400, 12px -8px 0 #166d00, 13.5px -9px 0 #156700, 15px -10px 0 #136000, 16.5px -11px 0 #125900, 18px -12px 0 #115300, 0 0 52px rgba(108, 255, 71, 0.5), 0 0 55px rgba(108, 255, 71, 0.5);
  }
  40% {
    color: #00ff66;
    text-shadow: 0px 0px 0 #00b849, 1.5px -1px 0 #009c3e, 3px -2px 0 #00953c, 4.5px -3px 0 #008e39, 6px -4px 0 #008836, 7.5px -5px 0 #008134, 9px -6px 0 #007a31, 10.5px -7px 0 #00742e, 12px -8px 0 #006d2c, 13.5px -9px 0 #006729, 15px -10px 0 #006026, 16.5px -11px 0 #005924, 18px -12px 0 #005321, 0 0 52px rgba(71, 255, 145, 0.5), 0 0 55px rgba(71, 255, 145, 0.5);
  }
  50% {
    color: cyan;
    text-shadow: 0px 0px 0 #00b8b8, 1.5px -1px 0 #009c9c, 3px -2px 0 #009595, 4.5px -3px 0 #008e8e, 6px -4px 0 #008888, 7.5px -5px 0 #008181, 9px -6px 0 #007a7a, 10.5px -7px 0 #007474, 12px -8px 0 #006d6d, 13.5px -9px 0 #006767, 15px -10px 0 #006060, 16.5px -11px 0 #005959, 18px -12px 0 #005353, 0 0 52px rgba(71, 255, 255, 0.5), 0 0 55px rgba(71, 255, 255, 0.5);
  }
  60% {
    color: #0066ff;
    text-shadow: 0px 0px 0 #0049b8, 1.5px -1px 0 #003e9c, 3px -2px 0 #003c95, 4.5px -3px 0 #00398e, 6px -4px 0 #003688, 7.5px -5px 0 #003481, 9px -6px 0 #00317a, 10.5px -7px 0 #002e74, 12px -8px 0 #002c6d, 13.5px -9px 0 #002967, 15px -10px 0 #002660, 16.5px -11px 0 #002459, 18px -12px 0 #002153, 0 0 52px rgba(71, 145, 255, 0.5), 0 0 55px rgba(71, 145, 255, 0.5);
  }
  70% {
    color: #3300ff;
    text-shadow: 0px 0px 0 #2500b8, 1.5px -1px 0 #1f009c, 3px -2px 0 #1e0095, 4.5px -3px 0 #1c008e, 6px -4px 0 #1b0088, 7.5px -5px 0 #1a0081, 9px -6px 0 #18007a, 10.5px -7px 0 #170074, 12px -8px 0 #16006d, 13.5px -9px 0 #150067, 15px -10px 0 #130060, 16.5px -11px 0 #120059, 18px -12px 0 #110053, 0 0 52px rgba(108, 71, 255, 0.5), 0 0 55px rgba(108, 71, 255, 0.5);
  }
  80% {
    color: #cc00ff;
    text-shadow: 0px 0px 0 #9300b8, 1.5px -1px 0 #7c009c, 3px -2px 0 #770095, 4.5px -3px 0 #72008e, 6px -4px 0 #6d0088, 7.5px -5px 0 #670081, 9px -6px 0 #62007a, 10.5px -7px 0 #5d0074, 12px -8px 0 #57006d, 13.5px -9px 0 #520067, 15px -10px 0 #4d0060, 16.5px -11px 0 #470059, 18px -12px 0 #420053, 0 0 52px rgba(218, 71, 255, 0.5), 0 0 55px rgba(218, 71, 255, 0.5);
  }
  90% {
    color: #ff0099;
    text-shadow: 0px 0px 0 #b8006e, 1.5px -1px 0 #9c005d, 3px -2px 0 #950059, 4.5px -3px 0 #8e0055, 6px -4px 0 #880051, 7.5px -5px 0 #81004d, 9px -6px 0 #7a0049, 10.5px -7px 0 #740045, 12px -8px 0 #6d0041, 13.5px -9px 0 #67003e, 15px -10px 0 #60003a, 16.5px -11px 0 #590036, 18px -12px 0 #530032, 0 0 52px rgba(255, 71, 182, 0.5), 0 0 55px rgba(255, 71, 182, 0.5);
  }
  100% {
    color: red;
    text-shadow: 0px 0px 0 #b80000, 1.5px -1px 0 #9c0000, 3px -2px 0 #950000, 4.5px -3px 0 #8e0000, 6px -4px 0 #880000, 7.5px -5px 0 #810000, 9px -6px 0 #7a0000, 10.5px -7px 0 #740000, 12px -8px 0 #6d0000, 13.5px -9px 0 #670000, 15px -10px 0 #600000, 16.5px -11px 0 #590000, 18px -12px 0 #530000, 0 0 52px rgba(255, 71, 71, 0.5), 0 0 55px rgba(255, 71, 71, 0.5);
  }
}


h3 {
  animation: rainbow 2s ease-out infinite alternate;
  font-family: 'Chango', cursive;
  font-size: 10rem;
  font-weight: bold;
  text-align: center;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<h3>site name</h3>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-defult" data-spy="affix" data-offset-top="70">
	 <!--  <div class="container-fluid"> -->
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="list.main">Home</a></li>
	      	<c:choose>
	      		<c:when test="${loginfo == null}">
	      			<c:forEach var="cate" items="${ctList }">
	      					<c:if test="${cate.idx != 99999 }">
	      						<li class="dropdown">
							        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${cate.name }
							        <span class="caret"></span></a>
							        <ul class="dropdown-menu">
							         <c:forEach var="detail" items="${detailList }">
										<c:if test="${detail.catNum eq cate.idx }">
											<li><a href="javascript:urlCheck('${detail.url}','${detail.idx}')">${detail.name }/${detail.url }</a></li>
										</c:if>
									</c:forEach>
							        </ul>
							      </li>
	      					</c:if>
	      				</c:forEach>
	      		</c:when>
	      		<c:when test="${loginfo != null }">
	      			<c:if test="${loginfo.id !='admin' }">
	      				<c:forEach var="cate" items="${ctList }">
	      					<c:if test="${cate.idx != 99999 }">
	      						<li class="dropdown">
							        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${cate.name }
							        <span class="caret"></span></a>
							        <ul class="dropdown-menu">
							         <c:forEach var="detail" items="${detailList }">
										<c:if test="${detail.catNum eq cate.idx }">
											<li><a href="javascript:urlCheck('${detail.url}','${detail.idx}')">${detail.name }/${detail.url }</a></li>
										</c:if>
									</c:forEach>
							        </ul>
							      </li>
	      					</c:if>
	      				</c:forEach>
	      			</c:if>
	      			<c:if test="${loginfo.id =='admin' }">
				      <c:forEach var="cate" items="${ctList }">
					      <li class="dropdown">
					        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${cate.name }
					        <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					         <c:forEach var="detail" items="${detailList }">
								<c:if test="${detail.catNum eq cate.idx }">
									<li><a href="javascript:urlCheck('${detail.url}','${detail.idx}')">${detail.name }/${detail.url }</a></li>
								</c:if>
							</c:forEach>
					        </ul>
					      </li>
				      </c:forEach>
	      			</c:if>
	      		<c:if test="${loginfo.id !='admin' }">
	      			<c:forEach var="cate" items="${ctList }">
	      			<c:if test="${cate.idx != 99999 }">
	      						<li class="dropdown">
							        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${cate.name }
							        <span class="caret"></span></a>
							        <ul class="dropdown-menu">
							         <c:forEach var="detail" items="${detailList }">
										<c:if test="${detail.catNum eq cate.idx }">
											<li><a href="javascript:urlCheck('${detail.url}','${detail.idx}')">${detail.name }/${detail.url }</a></li>
										</c:if>
									</c:forEach>
							        </ul>
							      </li>
	      					</c:if>
	      				</c:forEach>
	      				</c:if>
	      		</c:when>
	      	</c:choose>
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
						<li><a href="orderList.prd?memId=${loginfo.id}">구매내역</a></li>
						<li><a href="cartList.prd?memId=${loginfo.id}">장바구니</a></li>
						<li><a href="logout.mem">로그아웃</a></li>
					</ul>
				</div>
	      	</c:if>
	    </ul>
	 <!--  </div> -->
	</nav>
</body>
</html>
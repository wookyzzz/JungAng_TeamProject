<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
										<li><a href="${detail.url }">${detail.name }/${detail.url }</a></li>
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
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
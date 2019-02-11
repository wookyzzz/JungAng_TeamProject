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
		<div class="row">
			<div class="section">
				<div class="col-md-offset-9 col-md-3" align=right>
					<a href="write.bbs"><button type="button" class="btn btn-default">글쓰기</button></a>
				</div>
			</div>
		</div>
		<div class="section">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>게시판</th>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>추천</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan=7 align=center>
							paging !
						</td>
					</tr>
				</tfoot>
				<tbody>
					<c:if test="${fn:length(list) == 0 }">
						<tr>
							<td colspan="7">
								등록된 게시글이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${fn:length(list) != null }">
						<c:forEach var="bd" items="${list }">
							<tr>
								<td>${bd.name }</td>
								<td>${bd.idx }</td>
								<td><a href="contentview.bbs?idx=${bd.idx }">${bd.subject }</a></td>
								<td>${bd.nickname }</td>
								<td>${bd.inputdate }</td>
								<td>${bd.thumbs }</td>
								<td>${bd.readCount }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
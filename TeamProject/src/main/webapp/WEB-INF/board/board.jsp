<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form-control{
width:auto;
}
</style>
</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<div class="container">
		<div class="row">
			<div class="section">
				<div class="col-md-3">
					<select name="limit">
						<option value="5" <c:if test="${paging.limit == 5}">selected</c:if> >5개씩 보기
						<option value="10" <c:if test="${paging.limit == 10}">selected</c:if> >10개씩 보기
						<option value="20" <c:if test="${paging.limit == 20}">selected</c:if> >20개씩 보기
						<option value="30" <c:if test="${paging.limit == 30}">selected</c:if> >30개씩 보기
					</select>
				</div>
				<div class="col-md-6" align="center">
					<form class="form-inline">
						<div class="form-group">
						<label class="sr-only" for="column">칼럼</label>
						<select class="form-control" id="column">
							<option value="subjectAndContents">제목+내용
							<option value="subject">제목
							<option value="contents">내용
							<option value="writer">글쓴이
						</select>
						</div>
						<div class="form-group">
						<label class="sr-only" id="search">검색</label>
						<input type="text" name="search" id="search" class="form-control">
						<button type="submit" class="btn btn-default">검색</button>
						</div>
					</form>
				</div>
				<div class="col-md-3" align=right>
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
							<c:if test="${paging.prev ne 0 }">
								<a href="list.bbs?pageNumber=${paging.prev }&coloumn=${map.column}&search=${map.search}&limit=${paging.limit}">[이전]</a>
							</c:if>
							
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="status">
								<c:if test="${page.pageNumber eq status.index }">
									[${status.index }]
								</c:if>
								<c:if test="${page.pageNumber ne status.count }">
									<a href="list.bbs?pageNumber=${status.index }&coloumn=${map.column}&search=${map.search}&limit=${paging.limit}">[${status.index }]</a>
								</c:if>
							</c:forEach>
							<c:if test="${paging.next ne 0 }">
								<a href="list.bbs?pageNumber=${paging.next }&coloumn=${map.column}&search=${map.search}&limit=${paging.limit}">[다음]</a>
							</c:if>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<c:if test="${fn:length(list) == 0 }">
						<tr>
							<td colspan="7" align=center>
								<h4>등록된 게시글이 없습니다.</h4>
							</td>
						</tr>
					</c:if>
					<c:if test="${fn:length(list) != null }">
						<c:forEach var="bd" items="${list }">
							<tr>
								<td>${bd.name }</td>
								<td>${bd.idx }</td>
								<td>
									<a href="contentview.bbs?idx=${bd.idx }">
										<c:forEach var="i" begin="1" end="${bd.relevel }">
											[Re:]
										</c:forEach>
										${bd.subject }
									</a>
								</td>
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
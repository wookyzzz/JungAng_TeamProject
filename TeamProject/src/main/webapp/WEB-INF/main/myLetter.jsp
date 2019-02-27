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
		<div class="section">
			<div class="col-md-12">
				<table class="table table-striped">
					<caption>
						<h4>내가 쓴 글 : 총 ${letterCount }개</h4>
					</caption>
					<colgroup>
						<col width="10%"/>
						<col width="5%"/>
						<col width="55%"/>
						<col width="8%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="7%"/>
				</colgroup>
				<thead>
					<tr>
						<th>게시판</th>
						<th>번호</th>
						<th id="subject">제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>추천</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${fn:length(letterList) == 0 }">
						<tr>
							<td colspan=7 align=center>
								<h4>등록된 게시글이 없습니다.</h4>
							</td>
						</tr>
					</c:if>
					<c:if test="${fn:length(letterList) != null }">
						<c:forEach var="bd" items="${letterList }">
							<tr>
								<td>${bd.name }</td>
								<td>${bd.idx }</td>
								<td>
									<a href="contentview.bbs?idx=${bd.idx }&boardPage=1">
										<c:forEach var="i" begin="1" end="${bd.relevel }">
											[Re:]
										</c:forEach>
										${bd.subject }
										<c:if test="${bd.replycount > 0 }">
											<span class="label label-info">${bd.replycount }</span>
										</c:if>
									</a>
								</td>
								<td>${bd.nickname }</td>
								<td>
									<fmt:formatDate value="${bd.inputdate }" pattern="yy/MM/dd"/>
								</td>
								<td>${bd.thumbs }</td>
								<td>${bd.readCount }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
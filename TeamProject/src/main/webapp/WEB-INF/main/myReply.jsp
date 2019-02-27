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
						<h4>내가 쓴 댓글 : 총 ${replyCount }개</h4>
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
							<th>내용</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${fn:length(replyList) == 0 }">
							<tr>
								<td colspan=2 align=center>
									<h4>작성하신 댓글이 없습니다.</h4>
								</td>
							</tr>
						</c:if>
						<c:if test="${fn:length(replyList) != null }">
							<c:forEach var="bd" items="${replyList }">
								<tr>
									<td>
										${bd.contents }<br>
										<a href="contentview.bbs?idx=${bd.reBbsRef }&boardPage=1"><small>${bd.boardsubject }</small></a>
									</td>
									<td>
										${bd.inputdate }
									</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<div class="container">
		<div class="row"></div>
		<div class="section">
			<form:form commandName="board" action="write.bbs" method="post">
				<table class="table table-defalut">
					<thead>
						<tr>
							<td>
								<select name="sortNum">
									<option value="">게시판 선택
									<c:forEach items="${detailList }" var="detail">
										<c:if test="${detail.catNum eq 1000 }">
											<c:choose>
												<c:when test="${fn:contains(detail.name,'전체') }">
												</c:when>
												<c:when test="${fn:contains(detail.name,'베스트') }">
												</c:when>
												<c:otherwise>
													<option value="${detail.idx }">${detail.name }
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</select>
								<form:errors path="contents" cssClass="err"/>
								<form:errors path="subject" cssClass="err"/>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="subject" placeholder="제목">
								</div>
							</td>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td align=center>
								<button type="submit" class="btn btn-default">확인</button>
							</td>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td><textarea id="editor1" name="contents" rows=100 cols=50 ></textarea></td>
						</tr>
					</tbody>
				</table>
				
				<script>
			
					CKEDITOR.replace("editor1",{
						height : '700px',
						filebrowserUploadUrl : 'upload.bbs'
					});
				
				</script>
			</form:form>
		</div>
	</div>
</body>
</html>
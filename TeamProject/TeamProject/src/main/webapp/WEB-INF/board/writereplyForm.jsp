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
			<form action="writeRep.bbs" method="post">
				<table class="table table-defalut">
					<thead>
						<tr>
							<td>
								<input type="hidden" name="sortNum" value="${bean.sortNum }">
								<input type="hidden" name="ref" value="${bean.ref }">
								<input type="hidden" name="relevel" value="${bean.relevel }">
								<input type="hidden" name="restep" value="${bean.restep }">
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
							<td><textarea id="editor1" name="contents" rows=100 cols=50 >This is my ckeditor</textarea></td>
						</tr>
					</tbody>
				</table>
				
				<script>
			
					CKEDITOR.replace("editor1",{
						height : '700px',
						filebrowserUploadUrl : 'upload.bbs'
					});
				
				</script>
			</form>
		</div>
	</div>
</body>
</html>
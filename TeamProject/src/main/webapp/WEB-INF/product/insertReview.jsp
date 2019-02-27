<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	
	 function errCheck_review(){
		 subject = document.getElementById("subject").value;
		 contents = CKEDITOR.instances.editor1.getData();
	if(subject==""  && contents==""){
			alert('제목과 내용을 입력하세요.');
		return false;
	}
	if(subject==""  || contents==""){
		if(subject==""){
			alert('제목을 입력하세요.');
		}
		if(contents==""){
			alert('내용을 입력하세요.');
		}	
		return false;
	}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/topmenu.jsp"%>
	<%
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		String pageNumber =request.getParameter("pageNumber");
	%>
	<div class="container">
		<div class="row"></div>
		<div class="section">
<form  method="post"  action="insertReview.prd"  enctype="multipart/form-data">
				<table class="table table-defalut">
					<thead>
		<tr>
			<td colspan=4>
				<div class="form-group">
					<input type="text"  class="form-control"  name="subject" id="subject"  placeholder="제목">
				</div>
			</td>
			</tr>
			</thead>
			<tfoot>
			<tr>
							<td colspan=4><textarea id="editor1" name="contents" rows=100 cols=50 ></textarea></td>
		</tr> 
		
		<tr>
		<td width=5%>별점</td>
		<td>
				<div class="form-group">
					<input type="radio" name="grade" value="1">1
					<input type="radio" name="grade" value="2">2
					<input type="radio" name="grade" value="3" checked>3
					<input type="radio" name="grade" value="4">4
					<input type="radio" name="grade" value="5">5
				</div>
			</td>
		</tr>
		<tr>
			<td align=right colspan=4>
				<input type="submit" class="btn btn-default" value="작성완료" onclick="return errCheck_review()">
			</td>
		</tr>
	</table>
	<input type="hidden" value="${loginfo.id }" name="memId"> <%-- session 값을 이용! --%>
	<script>
			
					CKEDITOR.replace("editor1",{
						height : '700px',
						filebrowserUploadUrl : 'upload.prd'
					});
				
				</script>
				<input type="hidden" value="<%=prdNum%>" name="prdNum">
				<input type="hidden" value="<%=pageNumber%>" name="pageNumber">
				<input type="hidden" value="${loginfo.id }" name="memId">
</form>
</div>
</div>
</body>
</html>
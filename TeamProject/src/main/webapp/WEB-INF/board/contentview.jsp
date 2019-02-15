<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.inputreply, .inputreply > .footer{
background-color: lightgray;
}
#addreply:HOVER{
cursor: pointer;
}

</style>
<script type="text/javascript">
	$(function(){
		$('tbody > tr > td > h5 > #addreply').on("click", function(){
			alert("클릭");
			var id = $(this).parent().parent().parent().attr("id");
			alert(id);
			var html = "<tr><td colspan=2><form action='' method='post'>";
			html+="<textarea name='contents' class='form-control' rows='3' style='re-sizing:none;'></textarea>";
			html+="<p class='text-right'><button type='submit' class='btn btn-default btn-sm'>등록</button></p></form>";
			html += "</td></tr>";
			$('#'+id).after(html);
		})
	})
</script>
</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<div class="container">
		<div class="row"></div>
		<div class="section">
			<table class="table table-default">
				<tfoot>
					<tr>
						<td colspan=3>
							<div class="col-md-offset-3 col-md-6" align="center">
								추천
							</div>
							<div class="col-md-3" align="right">
								<a href=""><button type="button" class="btn btn-default btn-sm">수정</button></a>
								<a href=""><button type="button" class="btn btn-default btn-sm">삭제</button></a>
								<a href="writeRep.bbs?idx=${bean.idx }"><button type="button" class="btn btn-default btn-sm">답글달기</button></a>
							</div>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td colspan=3 align=center>
							${bean.subject }
						</td>
					</tr>
					<tr>
						<td>
							${bean.memNum }
						</td>
						<td>
							${bean.inputdate }
						</td>
						<td>
							${bean.readCount }
						</td>
					</tr>
					<tr>
						<td colspan=3 align=center>
							${bean.contents }
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="section" >
			<table class="table">
				<colgroup>
					<col width="5%">
					<col width="85%">
				</colgroup>
				<tfoot>
					<tr>
						<td colspan=2 align=center>
							paging
						</td>
					</tr>
				</tfoot>
				<tbody>
					<%-- <tr>
						<td colspan=2>
							<h5>닉네임<small>작성일</small>
								<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">답글</a>
							</h5>
							내용
						</td>
					</tr>
					<tr>
						<td colspan=2>
							<div class="collapse" id="collapseExample">
							  <div class="well">
							    ...
							  </div>
							</div>
						</td>
					</tr>
					<tr id="content2">
						<td></td>
						<td>
							<h5><img src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif"><strong>닉네임</strong><small>작성일</small>
							<a href="javascript:addreply()">답글</a></h5>
							내용
						</td>
					</tr> --%>
					<c:forEach var="replist" items="${list }">
						<tr id="${replist.idx }">
							<td colspan=2 id="td">
								<h5 id="h5">${replist.nickname }<small>${replist.inputdate }</small><a id="addreply">답글</a></h5>
								<p>${replist.contents }</p>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="panel panel-default inputreply">
			<form action="writereply.bbs" method="post">
			  <div class="panel-body">
			    ${loginfo.nick }(${loginfo.id })/${loginfo.idx }
			    <input type="hidden" name="reBbsRef" value="${bean.idx }">
			    <input type="hidden" name="memNum" value="${loginfo.idx }">
			    <hr>
			    <textarea name="contents" class="form-control" rows="5"></textarea>
			  </div>
			  <div class="panel-footer footer" align="right">
				  <button type="submit" class="btn btn-default btn-sm">확인</button>
			  </div>
			  </form>
			</div>
			<hr>
			
		</div>
	</div>
</body>
</html>
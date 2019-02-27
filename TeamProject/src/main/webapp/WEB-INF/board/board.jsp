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
#subject{
	text-align : center;
}
input[type="checkbox"]{
	height : auto;
}
</style>
<script type="text/javascript">
	function deleteSelectLetter(){
		var selCheck="";
		$("input[name='chooseLetter']:checked").each(function(){
			var checkdata = $(this).val();
			alert(checkdata)
			selCheck += checkdata+",";
			
		});
		console.log(selCheck);
		location.href="delete.bbs?idxlist="+selCheck+"&catNum=${map.sortNum}";
	}
	function moveSelectLetter(){
		var selCheck="";
		$("input[name='chooseLetter']:checked").each(function(){
			var checkdata = $(this).val();
			alert(checkdata)
			selCheck += checkdata+",";
			
		});
		console.log(selCheck);
		//location.href="delete.bbs?idxlist="+selCheck+"&catNum=${map.sortNum}";
	}
	function openModal(){
		$('.list-group').empty();
		var html = "";
		var idxlist = "";
		$("input[name='chooseLetter']:checked").each(function(){ 
			idx= $(this).val();
			var subject = $(this).parent().next().next().next().html();
			console.log(subject);
			alert(idx);
			html = subject
			html += "<input type='hidden' name='idxlist' value='"+idx+"'>"
		$('.list-group').append(html).children().addClass("list-group-item");
			
		});
		//$('.modal-body').html(html).children().children().addClass("list-group-item");
		$('#moveSelectLetter').modal();
	}
	$(function(){
		$('#limit').on("change",function(){
			alert("limit change");
			var limit = this.value;
			var catNum = "${map.sortNum}";
			var column = "${map.column}";
			var search = "${map.searchKeyWord}";
			
			//alert("limit = "+limit+" / catNum = "+catNum+" / column = "+column+" / search = "+search);
			location.href="list.bbs?column="+column+"&search="+search+"&limit="+limit+"&catNum="+catNum;
		})
	})
</script>
</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<div class="container">
		<div class="row">
			<div class="section">
				<div class="col-md-3">
					<select id="limit" name="limit" class="form-control">
						<option value="5" <c:if test="${paging.limit == 5}">selected</c:if> >5개씩 보기
						<option value="10" <c:if test="${paging.limit == 10}">selected</c:if> >10개씩 보기
						<option value="20" <c:if test="${paging.limit == 20}">selected</c:if> >20개씩 보기
						<option value="30" <c:if test="${paging.limit == 30}">selected</c:if> >30개씩 보기
					</select>
				</div>
				<div class="col-md-6" align="center">
					<form class="form-inline" action="list.bbs" method="post">
						<div class="form-group">
						<label class="sr-only" for="column">칼럼</label>
						<select class="form-control" id="column" name="column">
							<option value="subjectAndContents" <c:if test="${map.column == 'subjectAndContents' }">selected</c:if>>제목+내용
							<option value="subject" <c:if test="${map.column == 'subject' }">selected</c:if>>제목
							<option value="contents" <c:if test="${map.column == 'contents' }">selected</c:if>>내용
						</select>
						</div>
						<div class="form-group">
						<label class="sr-only" id="search">검색</label>
						<input type="text" name="search" id="search" class="form-control" value="${map.searchKeyWord }">
						<input type="hidden" name="catNum" value="${map.sortNum }">
						<button type="submit" class="btn btn-default">검색</button>
						</div>
					</form>
				</div>
				<div class="col-md-3" align=right>
					<c:if test="${loginfo.id == 'admin' }">
						<!-- <button type="button" class="btn btn-default" data-toggle="modal" data-target="#moveSelectLetter">게시글이동</button> -->
						<button type="button" class="btn btn-default" onClick="openModal()">게시글이동</button>
						<button type="button" class="btn btn-default" onClick="deleteSelectLetter()">선택삭제</button>
					</c:if>
					<a href="write.bbs"><button type="button" class="btn btn-default">글쓰기</button></a>
				</div>
			</div>
		</div>
		<div class="section">
			<table class="table table-striped table-hover">
				<colgroup>
					<c:if test="${loginfo.id == 'admin' }">
						<col width="5%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="50%"/>
						<col width="8%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="7%"/>
					</c:if>
					<c:if test="${loginfo.id != 'admin' }">
						<col width="10%"/>
						<col width="5%"/>
						<col width="55%"/>
						<col width="8%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="7%"/>
					</c:if>
				</colgroup>
				<thead>
					<tr>
						<c:if test="${loginfo.id == 'admin' }">
							<th>선택</th>
						</c:if>
						<th>게시판</th>
						<th>번호</th>
						<th id="subject">제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>추천</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan=<c:choose>
							<c:when test="${loginfo.id == 'admin' }">
								8
							</c:when>
							<c:when test="${loginfo.id!='admin' }">
								7
							</c:when>
							</c:choose>
						 align=center>
							<c:if test="${paging.prev ne 0 }">
								<a href="list.bbs?pageNumber=${paging.prev }&coloumn=${map.column}&search=${map.searchKeyWord}&limit=${paging.limit}&catNum=${map.sortNum}">[이전]</a>
							</c:if>
							
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="status">
								<c:if test="${page.pageNumber eq status.index }">
									[${status.index }]
								</c:if>
								<c:if test="${page.pageNumber ne status.count }">
									<a href="list.bbs?pageNumber=${status.index }&coloumn=${map.column}&search=${map.searchKeyWord}&limit=${paging.limit}&catNum=${map.sortNum}">[${status.index }]</a>
								</c:if>
							</c:forEach>
							<c:if test="${paging.next ne 0 }">
								<a href="list.bbs?pageNumber=${paging.next }&coloumn=${map.column}&search=${map.searchKeyWord}&limit=${paging.limit}&catNum=${map.sortNum}">[다음]</a>
							</c:if>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<c:if test="${fn:length(list) == 0 }">
						<tr>
							<td colspan=<c:choose>
								<c:when test="${loginfo.id == 'admin' }">
									8
								</c:when>
								<c:when test="${loginfo.id!='admin' }">
									7
								</c:when>
							</c:choose> align=center>
								<h4>등록된 게시글이 없습니다.</h4>
							</td>
						</tr>
					</c:if>
					<c:if test="${fn:length(list) != null }">
						<c:forEach var="bd" items="${list }">
							<tr>
								<c:if test="${loginfo.id == 'admin' }">
									<td><input type="checkbox" name="chooseLetter" class="form-control" value="${bd.idx }"></td>
								</c:if>
								<td>${bd.name }</td>
								<td>${bd.idx }</td>
								<td>
									<a href="contentview.bbs?idx=${bd.idx }&boardPage=${paging.pageNumber}">
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
		<div class="modal fade" id="moveSelectLetter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel" align="center">게시글 이동</h4>
		      </div>
		      <form id="modal-form" method="post" action="move.bbs">
			      <div class="modal-body">
			      	<div class="row">
				      	<div class="col-md-9">
					        <div class='list-group'>
					        </div>
				        </div>
				        <div class="col-md-3">
				        	<select name="sortNum" class="form-control">
				        		<c:forEach var="categories_detail" items="${detailList }">
				        			<c:if test="${categories_detail.catNum == 1000 }">
				        				<option value="${categories_detail.idx }">${categories_detail.name }
				        			</c:if>
				        		</c:forEach>
				        	</select>
				        	<input type="hidden" value="${map.sortNum }" name="catNum">
				        </div>
			      	</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-primary">이동</button>
			      </div>
		      </form>
		    </div>
		  </div>
</div>
	</div>
</body>
</html>
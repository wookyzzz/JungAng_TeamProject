<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.inputreply, .footer{
background-color: lightgray;
}
.add:HOVER, .delete:hover, .pageNumber:hover, .collapseform:hover{
cursor: pointer;
}
textarea{
	resize:none;
}

</style>
<script type="text/javascript">
	var text;
	function showPage(info){
		console.log(info);
		var imagePath = "${pageContext.request.contextPath }";
		console.log(imagePath);
		var pageNum = $(info).attr("id");
		var rebbsref = "${bean.idx}";
		var boardPage = "${boardPage}";
		var idx = "${loginfo.idx}";
		$.ajax({
			url : "replypaging.bbs",
			data : {
				pageNumber : pageNum,
				reBbsRef : rebbsref,
				limit : "${paging.limit}"
			},
			method : "post",
			datatype : "json",
			cache : false,
			success : function(data){
				console.log(data.jsonpaging.pageNumber);
				var html = "";
				var paging = data.jsonpaging;
				var list = data.jsonlist;
				html+="<tfoot><tr><td colspan=2 align=center>";
				if(paging.prev != 0){
					html+="<a id='"+paging.prev+"' class='pageNumber' onClick='showPage(this)'>[이전]</a>";
				}
				for(var i = paging.startPage ; i <= paging.endPage ; i++){
					if(paging.pageNumber == i){
						html+="["+i+"]";
					}else{
						html+="<a id='"+i+"' class='pageNumber'onClick='showPage(this)'>["+i+"]</a>";
					}
				}
				if(paging.next != 0){
					html+="<a id='"+paging.next+"' class='pageNumber' onClick='showPage(this)'>[이전]</a>";
				}
				html+="</td></tr></tfoot><tbody>";
				for(var i = 0 ; i < list.list.length; i++){
					console.log(list.list);
					html+="<tr id="+list.list[i].idx+">";
					if(list.list[i].reReLevel == 0){
						if(list.list[i].memNum != 0){
							html+="<td colspan=2 id='td'>";
							html+="<h5 id='h5'>"+list.list[i].nickname+"<small>"+list.list[i].inputdate+"</small>";
							html+="<a id='addreply' class='addreply add' onClick='replyForm(this)'>답글</a>";
							if(list.list[i].memNum == idx){
								html+="<a ><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> </a>";
								html+="<a onClick='deleteReply("+list.list[i].idx+")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> </a>";
							}
							html+="</h5>";
							html+="<p>"+list.list[i].contents+"</p></td>"
						}else{
							html+="<td colspan=2 id='td'>";
							html+="<p>"+list.list[i].contents+"</p></td>"
						}
					}else{
						if(list.list[i].memNum != 0){
							html+="<td></td><td id='td'>";
							html+="<h5 id='h5'><img src='"+imagePath+"/resources/images/reply_new_head.gif' alt='reply_new_head.gif'>"+list.list[i].nickname+"<small>"+list.list[i].inputdate+"</small>";
							html+="<a id='addreply' class='addreply add' onClick='replyForm(this)'>답글</a>";
							if(list.list[i].memNum == idx){
								html+="<a ><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> </a>";
								html+="<a onClick='deleteReply("+list.list[i].idx+")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> </a>";
							}
							html+="</h5>";
							html+="<p>"+list.list[i].contents+"</p></td>"
						}else{
							html+="<td></td><td id='td'>";
							html+="<p>"+list.list[i].contents+"</p></td>"
						}
					}
					html+="</tr>";
				}
				html+="</tbody>";
				$('#replytable').empty().append(html);
			}
		})
	}
	function replyForm(data){
		console.log(data);
		var id = $(data).attr("id");
		var loginfo = "${loginfo.idx}";
		var boardPage = "${boardPage}";
		if($(data).hasClass("add")){
			var id = $(data).parent().parent().parent().attr("id");
			var html = "<tr><td colspan=2><form action='addrereply.bbs' method='post'>";
			html+="<textarea name='contents' class='form-control' rows='3' onClick='checkLogin()'></textarea>";
			html+="<input type='hidden' name='parentId' value='"+id+"'>";
			html+="<input type='hidden' name='boardPage' value='"+boardPage+"'>";
			html+="<p class='text-right'><button type='submit' class='btn btn-default btn-sm'>등록</button></p></form>";
			html += "</td></tr>";
			$('#'+id).after(html);
			$(data).html("취소")
			.removeAttr("class","add")
			.attr("class","delete");
		}else{
			$(data)
			.html("답글")
			.removeAttr("class","delete")
			.attr("class","add")
			.parent().parent().parent().next().remove();
			
		}
	} 
	
	function thumb(){
		$.ajax({
			url:'thumb.bbs',
			data : {
				bbsRef : "${bean.idx}",
				boardPage : "${boardPage}"
			},
			method : 'post',
			datatype : 'json',
			success : function(data){
				if(data == -1){
					alert("로그인이 필요합니다.");
					location.href='LoginForm.mem';
				}else{
					$('#thumbcount').html(data);
				}
			}
		})
	}
	
	function checkLogin(){
		var loginfo = "${loginfo}";
		var idx = "${bean.idx}";
		var boardPage = "${boardPage}"
		console.log("loginfo : " + loginfo);
		if(loginfo == "" || loginfo == null){
			var flag = confirm("댓글은 로그인 후 이용할 수 있습니다.")
			if(flag){
				location.href='LoginForm.mem';
				return;
			}else{
				location.href='contentview.bbs?idx='+idx+"&boardPage="+boardPage;
				return;
			}
		}
	}
	
	function deleteLetter(){
		var check = confirm("글을 삭제하시겠습니까?");
		if(check){
			var idx = "${bean.idx}";
			var boardPage = "${boardPage}";
			location.href="delete.bbs?idx="+idx+"&boardPage="+boardPage;
		}
	}
	
	function deleteReply(idx){
		var check = confirm("댓글을 삭제하시겠습니까?");
		var boardPage = "${boardPage}";
		var rebbsref = "${bean.idx}";
		if(check){
			alert(idx+"/"+boardPage+"/"+rebbsref);
			location.href="deletereply.bbs?idx="+idx+"&boardPage="+boardPage+"&boardIdx="+rebbsref;
		}
	}
	function updateReply(data){
		text = $(data).parent().parent().next().text();
		var idx = $(data).parent().parent().parent().parent().attr("id");
		var boardPage = "${boardPage}";
		var rebbsref = "${bean.idx}";
		alert(idx);
		var html = "<a onClick='collapseUpdateReply(this)' class='collapseform'>수정 취소</a>";
		var html2 = "<form action='updatereply.bbs' method='post'><textarea name='contents' class='form-control'>"+text+"</textarea>";
		html2 += "<input type='hidden' name='idx' value='"+idx+"'>";
		html2 += "<input type='hidden' name='boardPage' value='"+boardPage+"'>";
		html2 += "<input type='hidden' name='reBbsRef' value='"+rebbsref+"'>";
		html2 += "<button type='submit' class='btn btn-default'>수정</button></form>";
		alert(text);
		$(data).parent().parent().next().remove();
		$(data).parent().parent().after(html2);
		$(data).parent().html(html).next().remove();
	}
	
	function collapseUpdateReply(data){
		var html="<a onClick='updateReply(this)'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a>";
		alert(text);
		$(data).parent().parent().next().remove();
		$(data).parent().parent().after("<p>"+text+"</p>");
		$(data).parent().html(html)
		.after("&nbsp;<small><a onClick='deleteReply(${replist.idx})'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></a></small>");
	}

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
								<div class="btn-group btn-group-sm" role="group">
									<button id="thumb" type="button" class="btn btn-default" onClick="thumb()">
									 	<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;좋아요
									</button> 
									<button id="thumbcount" type="button" class="btn btn-default" disabled="disabled">${thumbCount }</button>
								</div>
							</div>
							<div class="col-md-3" align="right">
								<c:if test="${loginfo.idx == bean.memNum }">
									<a href="update.bbs?idx=${bean.idx }&boardPage=${boardPage}"><button type="button" class="btn btn-default btn-sm">수정</button></a>
									<a onClick="deleteLetter()"><button type="button" class="btn btn-default btn-sm">삭제</button></a>
								</c:if>
									<a href="writeRep.bbs?idx=${bean.idx }"><button type="button" class="btn btn-default btn-sm">답글달기</button></a>
									<a href="list.bbs?pageNumber=${boardPage }"><button type="button" class="btn btn-default btn-sm">목록보기</button></a>
							</div>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td colspan=3 align=center><h5><strong>${bean.subject }</strong></h5></td>
					</tr>
					<tr>
						<td>${bean.nickname }</td>
						<td align=center><fmt:formatDate value="${bean.inputdate }" pattern="yy/MM/dd"/></td>
						<td>${bean.readCount }</td>
					</tr>
					<tr>
						<td colspan=3>${bean.contents }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="section" >
			<table class="table" id="replytable">
				<colgroup>
					<col width="5%">
					<col width="85%">
				</colgroup>
				<tfoot>
					<tr>
						<td colspan=2 align=center>
							<c:if test="${paging.prev ne 0 }">
								<a id=${paging.prev } class="pageNumber" onClick="showPage(this)">[이전]</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="status">
								<c:if test="${paging.pageNumber eq status.index }">
									[${status.index }]
								</c:if>
								<c:if test="${paging.pageNumber ne status.index }">
									<a id="${status.index }" class="pageNumber" onClick="showPage(this)">[${status.index }]</a>
								</c:if>
							</c:forEach>
							<c:if test="${paging.next ne 0 }">
								<a id=${paging.next } class="pageNumber" onClick="showPage(this)">[다음]</a>
							</c:if>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach var="replist" items="${list}">
						<c:if test="${replist.reReLevel == 0 }">
							<c:if test="${replist.memNum != 0 }">
								<tr id="${replist.idx }">
									<td colspan=2 id="td">
										<h5 id="h5">${replist.nickname }
										<small>${replist.inputdate }</small>
										<a id="addreply" class="addreply add" onClick="replyForm(this)" >답글</a>
										<c:if test="${replist.memNum == loginfo.idx }">
											<small><a onClick="updateReply(this)"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></small>
											<small><a onClick="deleteReply(${replist.idx})"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></small>
										</c:if>
										</h5>
										<p>${replist.contents }</p>
									</td>
								</tr>
							</c:if>
							<c:if test="${replist.memNum == 0 }">
								<td colspan=2 id="td">
									<p>${replist.contents }</p>
								</td>
							</c:if>
						</c:if>
						<c:if test="${replist.reReLevel == 1 }">
							<c:if test="${replist.memNum != 0 }">
								<tr id="${replist.idx }">
									<td></td>
									<td id="td">
										<h5 id="h5"><img src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif">${replist.nickname }
										<small>${replist.inputdate }</small>
										<a id="addreply" class="addreply add" onClick="replyForm(this)">답글</a>
										<c:if test="${replist.memNum == loginfo.idx }">
											<small><a onClick="updateReply(this)"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></small>
											<small><a onClick="deleteReply(${replist.idx})"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></small>
										</c:if>
										</h5>
										<p>${replist.contents }</p>
									</td>
								</tr>
							</c:if>
							<c:if test="${replist.memNum == 0 }">
								<tr id="${replist.idx }">
									<td></td>
									<td id="td">
										<p>${replist.contents }</p>
									</td>
								</tr>
							</c:if>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<div class="panel panel-default inputreply">
				<form action="writereply.bbs" method="post">
					  <div class="panel-body">
					    <input type="hidden" name="reBbsRef" value="${bean.idx }">
					    <input type="hidden" name="memNum" value="${loginfo.idx }">
					    <input type="hidden" name="boardPage" value="${boardPage }">
					    <textarea name="contents" class="form-control" rows="5" onClick="checkLogin()"></textarea>
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
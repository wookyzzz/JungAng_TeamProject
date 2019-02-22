<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/d.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
#labelll {
	cursor: pointer;
}
#pwch{
	float:left;
}
#date {
	color: gray;
	font-size: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
	String pageNumber = request.getParameter("pageNumber");

	%>
판매자: ${prdView.memId} , 로그인:${loginfo.id}
	<jsp:include page="prdView.jsp">
		<jsp:param name="prdNum" value="<%=prdNum%>" />
		<jsp:param name="pageNumber" value="<%=pageNumber%>" />
	</jsp:include>
	<form action="prdQnA.prd" method="post">
	<div class="panel panel-default inputreply">
	<div class="panel-body">
		<textarea class="form-control" name="contents" cols="80" rows="10" id="prdQnAContents"
			placeholder="상품에 대해 궁금한 점을 입력하세요." onclick="loginCheck('${loginfo.id}','${prdView.memId}')"></textarea>
		</div>
		<div class="panel-footer footer"  align=right>
		<div id="pwch"><input type="checkbox" id="passbox" onchange="checkPass()">비밀글&nbsp;
		<span id="inputPasswd"></span><span id="passMessage"></span></div>
		<input type="submit" value="등록"  class="btn btn-default btn-sm" onclick="return checkErr()">
		<input type="hidden" name="prdNum" value="<%=prdNum%>"> <br>
		<input type="hidden" name="memId" value="${loginfo.id}"> <br>
	</div>
	</div>
	</form>
	<div class="section">
	<table class="table">
	<c:if test="${QnALists.size()==0 }"> <!-- 등록된 글이 없을 때 -->
			<tr>
				<td>작성된 상품 문의가 없습니다.</td>
			</tr>
	</c:if>
		<c:if test="${QnALists.size() ne 0 }"> <!-- 등록된 글이 있을 때 -->
			<c:forEach items="${QnALists}" var="q">
				<tr>
					<td>
						<c:if test="${prdView.memId eq loginfo.id}">  <!-- 판매자 아이디가 로그인 했을 때 -->
						<c:if test="${q.passwd eq null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5"><c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  onclick="answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  onclick="delQnA('${q.prdNum }','${q.ref }','${q.relevel }')" >삭제</a></c:if></h5>
											<p>${q.contents }</p>
										<div id="answerMessage_${q.ref}_${q.relevel}"></div>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId}">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  onclick="answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }','${q.memId }')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  onclick="delQnA('${q.prdNum }','${q.ref }','${q.relevel }')" >삭제</a></c:if></h5>
										<p><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }">${q.contents }</p>
									<div id="answerMessage_${q.ref}_${q.relevel}"></div>
										</c:if>
								</c:if>
							<c:if test="${q.passwd ne null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5"><c:if test="${q.memId eq prdView.memId}">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  onclick="answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }','${q.memId }')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  onclick="delQnA('${q.prdNum }','${q.ref }','${q.relevel }')" >삭제</a></c:if></h5>
											<p id="contents_${q.ref}_${q.relevel}"><img src="<%=request.getContextPath()%>/images/lock.png" width=10 height=10>${q.contents }</p>
										<div id="answerMessage_${q.ref}_${q.relevel}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5">
										<img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  onclick="answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id }')" id="labelll">답변</a></h5>
										<p id="contents_${q.ref}_${q.relevel}"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img src="<%=request.getContextPath()%>/images/lock.png" width=10 height=10>${q.contents}</p>
										<div id="answerMessage_${q.ref}_${q.relevel}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form>
											
										</c:if>
								</c:if>
						</c:if>
						<c:if test="${prdView.memId ne loginfo.id }"> <!-- 로그인한 아이디랑 판매자 아이디가 같지 않을 때 -->
									<c:if test="${q.passwd eq null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5"><c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if><small>${q.inputdate }</small>&nbsp;&nbsp;<a  onclick="answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id}')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  onclick="delQnA('${q.prdNum }','${q.ref }','${q.relevel }')" >삭제</a></c:if></h5>
											<p>${q.contents }</p>
										<div id="answerMessage_${q.ref}_${q.relevel}"></div>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;<a  onclick="answer('${q.prdNum}','${q.ref }','${q.restep}','${q.relevel }','${q.passwd}','${loginfo.id}')" id="labelll">답변</a>
										<c:if test="${q.memId eq loginfo.id }">| <a  onclick="delQnA('${q.prdNum }','${q.ref }','${q.relevel }')" >삭제</a></c:if></h5>
										<p><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }">${q.contents }</p>
									<div id="answerMessage_${q.ref}_${q.relevel}"></div>
										</c:if>
								</c:if>
								<c:if test="${q.passwd ne null }">
										<c:if test="${q.relevel ==0 }">
										<h5 id="h5"><c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;</h5>
											<c:if test="${q.memId eq loginfo.id }"><p id="contents_${q.ref}_${q.relevel}"><label onclick="fff('${q.passwd}','${q.ref}','${q.relevel}')" id="labelll"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p>
										<div id="answerMessage_${q.ref}_${q.relevel}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form></c:if>
											<c:if test="${q.memId ne loginfo.id }"><p id="contents_${q.ref}_${q.relevel}"><label id="labelll"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p>
										<div id="answerMessage_${q.ref}_${q.relevel}"></div></c:if>
										</c:if>
									<c:if test="${q.relevel >0 }">
										<h5 id="h5"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img  src="${pageContext.request.contextPath }/resources/images/reply_new_head.gif" >
										<c:if test="${q.memId eq prdView.memId }">판매자</c:if><c:if test="${q.memId ne prdView.memId }">${q.memId}</c:if>&nbsp;&nbsp;<small>${q.inputdate }</small>&nbsp;&nbsp;</h5>
										<c:if test="${q.memId eq loginfo.id }"><p id="contents_${q.ref}_${q.relevel}">
										<img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><label onclick="fff('${q.passwd}','${q.ref}','${q.relevel}')" id="labelll"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p>
										<div id="answerMessage_${q.ref}_${q.relevel}"></div>
											<form name="passwordcheck"><div id="pwchch"></div></form></c:if>
											<c:if test="${q.memId ne loginfo.id }"><p id="contents_${q.ref}_${q.relevel}"><label id="labelll"><img src="${pageContext.request.contextPath }/images/110.png" width="${q.relevel *15 }"><img src="<%=request.getContextPath()%>/images/lock.png" width=15 height=15>&nbsp;비밀글입니다.</label></p></c:if>
											
										</c:if>
								</c:if>
					</c:if>
				</td>
			</c:forEach>
			</c:if>
	</table>
	</div>
</body>
</html>
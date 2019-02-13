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
	</div>
</body>
</html>
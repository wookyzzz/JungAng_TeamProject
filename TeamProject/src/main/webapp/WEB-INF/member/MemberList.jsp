<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function init() {
		var flag = "${flag}";
		alert("flag:" + flag);
	
		if (flag == "true") {
			var match = "${match}";
			alert("match1=" + match);

			if (match == "false") {
				alert("수정 권한 없음");
			}
		}
	}
	function insert() {
		location.href = 'registerForm.mem'; // get 방식
	}
	function goUpdate(id) {
		location.href = 'update.mem?id=' + id;
	}
</script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">


</style>
</head>
<body onLoad='init()'>
<%@ include file="../common/topmenu.jsp" %>

	<h2 align="center">회원 리스트 화면</h2>
	<center>

    <div class="col-md-6" align="center">
					<form class="form-inline">
						<div class="form-group">
						<label class="sr-only" for="column">칼럼</label>
						<select class="form-control" id="column">
							<option value="all">전체 검색
							<option value="id">아이디
							<option value="name">이름
						</select>
						</div>
						<div class="form-group">
						<label class="sr-only" id="search">검색</label>
						<input type="text" name="search" id="search" class="form-control">
						<button type="submit" class="btn btn-default">검색</button>
						</div>
					</form>
				</div>
    <table class="table table-striped custab">
    <form action="list.mem" method="get" name="myform">
    <a href="registerForm.mem" class="btn btn-primary btn-xs pull-right"><b>+</b>회원등록</a>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Nick</th>
            <th>Hp</th>
            <th>Email</th>
            <th>Postcode</th>
            <th>Address</th>
            <th>Detail_address</th>
            <th>Sales_authority</th>
           	<th>Birthday</th>
           	<th>Point</th>
            <th>수정/삭제</th>
        </tr>
   
    <c:forEach items="${memberLists}" var="member">
            <tr>
               <td>${member.id}</td>
               <td>
               <a href="detail.mem?id=<c:out value="${member.id}" />"> 
               <c:out value="${member.name}" />
               </td>
               <td>${member.nick}</td>
               <td>${member.hp}</td>
               <td>${member.email}</td>
               <td>${member.postcode1}</td>
               <td>${member.address1}</td>
               <td>${member.detailaddress1}</td>
               <td>${member.salesauthority}</td>
               <td>${member.birthdayyeardate}년${member.birthdaymonth}월${member.birthdaydate}일</td>
               <td>${member.point}</td>
               <td class="text-center">
                <a class='btn btn-info btn-xs' href="#" onclick="goUpdate('${member.id}')"><span class="glyphicon glyphicon-edit"></span> Edit</a> 
                <a href="delete.mem?id=<c:out value="${member.id}" />" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> 탈퇴</a>
                </td>
            </tr>
    </c:forEach>
    </table>
    </div>
</div>
					
							<c:if test="${paging.prev ne 0 }">
								<a href="list.mem?pageNumber=${paging.prev }&coloumn=${map.column}&search=${map.search}&limit=${paging.limit}">[이전]</a>
							</c:if>
							
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="status">
								<c:if test="${page.pageNumber eq status.index }">
									[${status.index }]
								</c:if>
								<c:if test="${page.pageNumber ne status.count }">
									<a href="list.mem?pageNumber=${status.index }&coloumn=${map.column}&search=${map.search}&limit=${paging.limit}">[${status.index }]</a>
								</c:if>
							</c:forEach>
							<c:if test="${paging.next ne 0 }">
								<a href="list.mem?pageNumber=${paging.next }&coloumn=${map.column}&search=${map.search}&limit=${paging.limit}">[다음]</a>
							</c:if>
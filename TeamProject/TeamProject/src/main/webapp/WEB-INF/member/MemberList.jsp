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
<%@ include file="../common/topmenu.jsp" %>
<body onLoad='init()'>

	<h2 align="center">회원 리스트 화면</h2>
	<center>
		<form action="list.mem" method="get" name="myform">

    <table class="table table-striped custab">
    
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
               <td></td>
               <td class="text-center">
                <a class='btn btn-info btn-xs' href="#" onclick="goUpdate('${member.id}')"><span class="glyphicon glyphicon-edit"></span> Edit</a> 
                <a href="delete.mem?id=<c:out value="${member.id}" />" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> 탈퇴</a>
                </td>
            </tr>
    </c:forEach>
    </table>
    </div>
</div>
<center>${pageInfo.pagingHtml}</center>
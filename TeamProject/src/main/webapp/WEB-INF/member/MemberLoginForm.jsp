<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="./../common/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>

<script type="text/javascript">
	function register() {
		location.href = "registerForm.mem"; // MemberRegisterController
	}
	function memberList() {
		location.href = "list.mem"; // MemberListController 
	}
</script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style type="text/css">
body { 
  
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.panel-default {
opacity: 0.9;
margin-top:30px;
}
.form-group.last { margin-bottom:0px; }


</style>
</head>
<%@ include file="../common/topmenu.jsp" %>
<body>


<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span>Login</div>
                <div class="panel-body">
                    <form id="login-form" class="form-horizontal" role="form" action="LoginForm.mem" method="post">
                  
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-3 control-label">
                           	 아이디</label>
                        <div class="col-sm-9">
                            <input name=id type="text" class="form-control" id="id" placeholder="Id" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-3 control-label">
                            	비밀번호</label>
                        <div class="col-sm-9">
                            <input name= passwd type="password" class="form-control" id="passwd" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"/>
                                    Remember me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                	로그인</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                	취소</button>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="panel-footer">
                   	회원이 아니신가요? <input type="button" value="회원가입" onClick="register();"></div>
            </div>
        </div>
    </div>
</div>


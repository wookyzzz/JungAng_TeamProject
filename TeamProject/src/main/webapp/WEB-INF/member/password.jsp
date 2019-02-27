<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form id="signupform" class="form-horizontal" role="form" commandName = "member" action="find_pass" method="post">
                                <div class="form-group">
                                    <label for="email" class="col-md-2 control-label">이메일</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="email" value="${member.email}"placeholder="이메일을 작성해주세요">
                                    </div>
                                    
                                        <div class="col-md-offset-2 col-md-10">
                                            <div style="color:red ; margin-top:2px" >
                                                <form:errors path="email"/>
                                                 <form:errors/>
                                            </div>
                                        </div>                 
                                    
                                </div>
                                    
                                <div class="form-group" style="margin-left:82%">
                                    <!-- Button -->
                                                  
                                    <div class="col-md-offset-10 col-md-9">
                                        <button id="btn-signup" type="submit" class="btn btn-warning">확인</button>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                                가입하신 이메일로 아이디와 비밀번호를 전송해드리겠습니다.
                                        </div>
                                    </div>
                                </div>    
                                
                            </form:form>
</body>
</html>
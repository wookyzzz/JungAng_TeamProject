function fff(restep,q_pass,prdNum,ref,relevel,memId,logId){
	pwchch = document.getElementById("pwchch");
	if(pwchch.style.display=='none' || pwchch.style.display==''){
		pwchch.style.display='block';
		pwchch.innerHTML="&nbsp;&nbsp;"+
		"<input type='password' name='chpass' id='p' maxvalue='8'>"+
		" <input type='button' id='labelll' onclick='return passcheck("+restep+","+q_pass+","+prdNum+","+ref+","+relevel+","+"\""+memId+"\""+",\""+logId+"\")' value='확인'>";
	
	}
	else{
		pwchch.style.display='none';
	}
}

function answer(prdNum,ref,restep,relevel,passwd,logId){
	if(logId==""){
		alert('접근 권한이 없습니다.');
		return;
	}
	if(passwd==""){
		passwd="";
	}
	
	answerMessage = document.getElementById("answerMessage_"+ref+"_"+restep);
	if(answerMessage.style.display=='none' || answerMessage.style.display==''){
		answerMessage.style.display='block';
	if(passwd==null){
		passwd="";
	}
	answerMessage = document.getElementById("answerMessage_"+ref+"_"+restep);
	answerMessage.innerHTML="<form method='post' action='prdAnswer.prd'>"+
	"<textarea name='answerContents' id='answerContents' class='form-control'  cols='70' rows='10' ></textarea>"+
	"<input type='hidden' name='ref' value='"+ref+"'>"+"<input type='hidden' name='restep' value='"+restep+"'>"+
	"<input type='hidden' name='relevel' value='"+relevel+"'>"+"<input type='hidden' name='passwd' value='"+passwd+"'>"
	+"<input type='hidden' name='prdNum' value='"+prdNum+"'>"+"<input type='hidden' name='id' value='"+logId+"'>"+
	"<input type='submit' onclick='return anErr("+ref+","+restep+")' class='btn btn-default btn-sm'  value='등록'></form>";
	}
	else{
		answerMessage.style.display='none';
	}
}	

function checkPass() {
		passbox = document.getElementById("passbox");
		inputPasswd = document.getElementById("inputPasswd");
		if (passbox.checked == true) {
			inputPasswd.innerHTML = "<input type='password' name='passwd' id='passwdId' maxlength=8>";
		}
		if (passbox.checked == false) {
			inputPasswd.innerHTML = "";
		}
	}

	function checkErr(){
		prdQnAContents = document.getElementById("prdQnAContents").value;
		if(prdQnAContents==""){
			alert("문의 내용을 입력하세요.");
			return false;
		}
		if(document.getElementById("passwdId").value==""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
	
	function passcheck(restep,q_pass,prdNum,ref,relevel,memId,logId){
		if(document.getElementById("p").value==""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(document.getElementById("p").value!=q_pass){
			alert("비밀번호가 다릅니다.");
			return false;
		}
		else{
		 $.ajax({
			url:'showContents.prd',
			dataType:'json',
			data:{
				ref:ref
			},
			success:function(data){
				console.log(data.item);
				$.each(data,function(idx,item){		
					pwchch = document.getElementById("pwchch");
					pwchch.style.display='none';
		
						if(memId==logId){
						ahref = document.getElementById("ahref_"+ref+"_"+item.step);
						ahref.innerHTML="<a href='javascript:answer("+prdNum+","+ref+","+item.step+","+relevel+",\""+q_pass+"\""+",\""+logId+"\")'>답변</a> | <a href='javascript:delQnA("+prdNum+","+ref+","+item.step+","+idx+")'>삭제</a>  ";
						contents = document.getElementById("contents_"+ref+"_"+item.step);
						contents.innerHTML='<img src="'+location.protocol+"//"+location.host+'/ex/images/110.png" width="'+item.level*15+' ">'+item.contents;
						}
						else{
							ahref = document.getElementById("ahref_"+ref+"_"+restep);
							ahref.innerHTML="<a href='javascript:answer("+prdNum+","+ref+","+item.step+","+relevel+",\""+q_pass+"\""+",\""+logId+"\")'>답변</a> "
							contents = document.getElementById("contents_"+ref+"_"+restep);
							contents.innerHTML='<img src="'+location.protocol+"//"+location.host+'/ex/images/110.png" width="'+item.level*15+' ">'+item.contents;
							}
				})
			}
		});//ajax 
		}
	}
	
	function anErr(ref,restep){
		answerContents = document.getElementById("answerContents_"+ref+"_"+restep).value;
		if(answerContents==""){
			alert("답변 내용을 입력하세요.");
			return false;
		}
	}
	
	function loginCheck(memId,seller){
		if(memId==""){
			alert('로그인 후에 이용해주세요.');
			location.href="LoginForm.mem";
		}
		if(memId==seller){
			alert('판매자는 질문글을 올릴 수 없습니다.');
		}
	}
	function delQnA(prdNum,ref,restep,idx){
		if(restep==0){
			var con = confirm('질문글 삭제시 답변들도 자동으로 삭제됩니다.\n정말 삭제하시겠습니까?');
			if(con==true){
				location.href="delQnA.prd?prdNum="+prdNum+"&ref="+ref+"&restep="+restep;
			}
		}
		if(restep!=0){
			var con = confirm('정말 삭제하시겠습니까?');
			if(con==true){
				location.href="delQnA.prd?prdNum="+prdNum+"&ref="+ref+"&restep="+restep;
			}
		}
	}



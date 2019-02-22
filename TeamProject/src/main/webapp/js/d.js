function fff(q_pass,ref,relevel){

	pwchch = document.getElementById("pwchch");
	if(pwchch.style.display=='none' || pwchch.style.display==''){
		pwchch.style.display='block';
		pwchch.innerHTML="&nbsp;&nbsp;"+
		"<input type='password' name='chpass' id='p' maxvalue='8'>"+
		" <input type='button' id='labelll' onclick='return passcheck("+q_pass+","+ref+","+relevel+")' value='확인'>";
	}
	else{
		pwchch.style.display='none';
	}
}

function answer(prdNum,ref,restep,relevel,passwd,logId){
	alert(ref+","+relevel);
	if(passwd==""){
		passwd="";
	}
	if(passwd!=""){
		if(logId==""){
			location.href="LoginForm.mem";
		}
	}
	answerMessage = document.getElementById("answerMessage_"+ref+"_"+relevel);
	if(answerMessage.style.display=='none' || answerMessage.style.display==''){
		answerMessage.style.display='block';
	if(passwd==null){
		passwd="";
	}
	answerMessage = document.getElementById("answerMessage_"+ref+"_"+relevel);
	answerMessage.innerHTML="<form method='post' action='prdAnswer.prd'>"+
	"<textarea name='answerContents' id='answerContents' class='form-control'  cols='70' rows='10' ></textarea>"+
	"<input type='hidden' name='ref' value='"+ref+"'>"+"<input type='hidden' name='restep' value='"+restep+"'>"+
	"<input type='hidden' name='relevel' value='"+relevel+"'>"+"<input type='hidden' name='passwd' value='"+passwd+"'>"
	+"<input type='hidden' name='prdNum' value='"+prdNum+"'>"+"<input type='hidden' name='id' value='"+logId+"'>"+
	"<input type='submit' onclick='return anErr()' class='btn btn-default btn-sm'  value='등록'></form>";
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
	
	function passcheck(q_pass,ref,relevel){
	
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
				
				$.each(data,function(idx,item){		
					alert(idx+"의 글 "+item.value);
					pwchch = document.getElementById("pwchch");
					pwchch.style.display='none';
					if(idx==0){
						relevel=idx;
						contents = document.getElementById("contents_"+ref+"_"+relevel);
						contents.innerHTML=item.value;
					}
					else{
						relevel=idx;
						contents = document.getElementById("contents_"+ref+"_"+relevel);
						contents.innerHTML='<img src="'+location.protocol+"//"+location.host+'/ex/images/110.png" width="'+relevel*15+' ">'+item.value;
					}			
				})
			}
		});//ajax 
		}
	}
	
	function anErr(){
		answerContents = document.getElementById("answerContents").value;
		if(answerContents==""){
			alert("답변 내용을 입력하세요.");
			return false;
		}
	}
	
	function loginCheck(memId,seller){
		if(memId==""){
			location.href="LoginForm.mem";
		}
		if(memId==seller){
			alert('판매자는 질문글을 올릴 수 없습니다.');
		}
	}
	function delQnA(prdNum,ref,relevel){
		location.href="delQnA.prd?prdNum="+prdNum+"&ref="+ref+"&relevel="+relevel;
	}



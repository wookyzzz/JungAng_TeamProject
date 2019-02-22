function fff(q_pass,idx){
	pwchch = document.getElementById("pwchch");
	if(pwchch.style.display=='none' || pwchch.style.display==''){
		pwchch.style.display='block';
		pwchch.innerHTML="<br>"+
		"<input type='password' name='chpass' id='p' maxvalue='8'>"+
		" <input type='button' id='labelll' onclick='return passcheck("+q_pass+","+idx+")' value='확인'>";
	}
	else{
		pwchch.style.display='none';
	}
}

function answer(idx,prdNum,ref,restep,relevel,passwd){
	answerMessage = document.getElementById("answerMessage_"+idx);
	if(answerMessage.style.display=='none' || answerMessage.style.display==''){
		answerMessage.style.display='block';
	if(passwd==null){
		passwd="";
	}
	answerMessage = document.getElementById("answerMessage_"+idx);
	answerMessage.innerHTML="<form method='post' action='prdAnswer.prd'>"+
	"<textarea name='answerContents' id='answerContents' cols='70' rows='10' ></textarea>"+
	"<input type='hidden' name='ref' value='"+ref+"'>"+"<input type='hidden' name='restep' value='"+restep+"'>"+
	"<input type='hidden' name='relevel' value='"+relevel+"'>"+"<input type='hidden' name='passwd' value='"+passwd+"'>"
	+"<input type='hidden' name='prdNum' value='"+prdNum+"'>"+
	"<input type='submit' onclick='return anErr()' value='등록'></form>";
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
	
	function passcheck(q_pass,idx){
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
			data:{
				idx:idx
			},
			success:function(data){
				contents = document.getElementById("contents_"+idx);
				contents.innerHTML=data;
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

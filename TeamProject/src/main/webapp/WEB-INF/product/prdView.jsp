<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.white a {
	color: #fff
}

#subImg:hover {
	border: 2px solid red;
}

.prdName {
	font-weight: bold;
	font-size: 20px;
}

.prdContents table {
	width: 100%;
	heigth: 50px;
	line-height: 50px;
}

.prdContents tr {
	background-color: #F6F6F6;
}

.prdContents tr td a:HOVER {
	cursor: pointer;
}

.prdContents a {
	color: black;
	font-size: 14px;
}

.menu.sel a{
	color: #F0AD4B;
	font-size:14px;
	font-weight: bold;
	border-bottom: 2px solid #F0AD4B;
}
#sub {
	width: 50px;
	height: 50px;
	background-color: white;
	position: absolute;
	margin-top: 50px;
}

#labelll {
	cursor: pointer;
}

#date {
	color: gray;
	font-size: 10px;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/d.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('td').click(function(){
			$('td').removeClass('sel');
			$(this).addClass('sel');
		});
		
		imgsrc = "";
		$("#Div_img img").each(function() {
			imgsrc += $(this).attr("src");
			imgsrc += "\n";
		});
		imgSplit = imgsrc.split("\n");
		firstImg = imgSplit[0];
		$("#Div_img").empty();
		$("#Div_img")
				.append(
						'<img  src="'+firstImg+'"  width="200px" height="200px " id="firstImg"/><br><br>');
		for (i = 0; i < imgSplit.length - 1; i++) {
			$("#Div_img")
					.append(
							'<img  src="'
									+ imgSplit[i]
									+ '"  width="50px" height="50px " id="subImg" onmouseover="mainImg(\''
									+ imgSplit[i] + '\')"/>');
		}
	});
	function mainImg(img) {
		$("#firstImg").attr('src', img);
	}
	function qtDown() {
		qt = $("#quantity").val();
		if (qt == "1") {
			alert('최소 구매 갯수는 1개 이상입니다.');
		} else {
			$("#quantity").val(qt - 1);
		}
	}
	function qtUp() {
		qt = $("#quantity").val();
		$("#quantity").val(parseInt(qt) + parseInt(1));
	}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:set var="imgPath" value="${pageContext.request.contextPath}/images/110.png"></c:set>
<%
	int prdNum = Integer.parseInt(request.getParameter("prdNum"));
	String pageNumber = request.getParameter("pageNumber");
%>
<body>
	<%@ include file="../common/topmenu.jsp"%>
	<div class="container">
		<div class="row"></div>
		<div class="section">
			<table class="table table-defalut">
				<thead>
					<tr>

						<td width=300px height=200px rowspan=4 align=center><div
								id="Div_img">${prdView.contents}</div></td>
						<td width=200px height=30px colspan=2 class="prdName">${prdView.name}</td>
					</tr>
					<tr>
						<td width=10%>가격</td>
						<td>${prdView.price}&nbsp;&nbsp;(<font size="2px" color="red">${prdView.point}</font><font
							color="gray"> point)</font></td>
					</tr>
					<tr>
						<td width=10%>수량</td>
						<td width=200px><input type="text" name="quantity"
							id="quantity" value="1" style="width: 30px;"> <input
							type="button" id="down" class="bt" value="◀" onclick="qtDown()">
							<input type="button" class="bt" id="up" value="▶"
							onclick="qtUp()"></td>
			</table>
			<div style="margin-left: 700px">
				<input type="submit" style="width: 150px; height: 50px"
					class="btn btn-primary" value="구매하기">&nbsp;&nbsp;<input
					type="button" style="width: 150px; height: 50px"
					class="btn btn-warning" value="장바구니">
			</div>
			<br> <br>

			<div align=center class="prdContents">
				<table>
					<tr align=center >
						<td width=33% class="menu sel"><a href="#view">상품상세정보</a></td>
						<td width=33% class="menu"><a href="#review">상품후기</a></td>
						<td width=33% class="menu"><a  href="#qna">상품QnA</a></td>
					</tr>
				</table>
				<br> <br> 
					<div id="view" class="section">
					${prdView.contents}
					</div>
					<br> <br> 
					<div id="review" class="section">
							후기 작성
					</div>
					<br> <br> 
					<div id="qna" class="section">
					</div>
		</div>
		</div>
</body>
</html>
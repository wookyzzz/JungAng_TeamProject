<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$('#category').on("change",function(){
			var selectCate = $('#category').val();
			alert(selectCate);
			$.ajax({
				type:"get",
				data:{"idx" : $('#category').val()},
				url:"getdetail.ct",
				cache:false,
				success : function(data){
					//alert("통신성공");
					
					var html="";
					for(var i = 0 ; i < data.length ; i++){
						//alert(data[i].idx+"/"+data[i].name);
						html += "<option value="+data[i].idx+">"+data[i].name
					}
					$('#categoryDetail').html(html);
				}
			})
		})
		
		$('#addcate').on("click",function(){
			var name = $('#name').val();
			location.href="addcate.ct?name="+ encodeURIComponent(name);
		})
		$('#deltecate').on("click", function(){
			var select = $('#category').val();
			if(confirm("선택하신 카테고리를 삭제하시겠습니까?")){
				location.href="delete.ct?idx="+select;
			};
		})
		$('#addcatedetail').on("click",function(){
			var name = $('#detailname').val();
			var url = $('#detailurl').val();
			var catNum = $('#category').val();
			location.href="addcatedetail.ct?name="+ encodeURIComponent(name)+"&url="+url+"&catNum="+catNum;
		})
		$('#deletecatedetail').on("click", function(){
			var select = $('#categoryDetail').val();
			if(confirm("선택하신 카테고리를 삭제하시겠습니까?")){
				location.href="deletedetail.ct?idx="+select;
			};
		})
	})
	
	

</script>
</head>
<body>
	<%@ include file="../common/topmenu.jsp" %>
	<div class="container">
		<div class="row"></div>
		<div class="section">
			<div class="col-md-12" align=center>
				<span>대분류</span>
				<select id="category">
					<c:forEach var="cate" items="${ctList }">
						<option value="${cate.idx }">${cate.name }
					</c:forEach>
				</select>
				<hr>
				<input type="text" id="name" name="name" placeholder="카테고리명"><br>
				<button type="button" id="addcate" class="btn btn-default">추가</button>
				<button type="button" id="deltecate"class="btn btn-default">삭제</button>
				<button type="button" class="btn btn-default">수정</button>
				<hr>
				<span>소분류</span>
				<select id="categoryDetail">
					<c:forEach var="detail" items="${dtList }">
						<option value="${detail.idx }">${detail.name }
					</c:forEach>
				</select>
				<hr>
				<input type="text" id="detailname" name="name" placeholder="카테고리명">
				<input type="text" id="detailurl" name="url" placeholder="카테고리url"><br>
				<button type="button" id="addcatedetail" class="btn btn-default">추가</button>
				<button type="button" id="deletecatedetail" class="btn btn-default">삭제</button>
				<button type="button" class="btn btn-default">수정</button>
			</div>
		</div>
	</div>
</body>
</html>
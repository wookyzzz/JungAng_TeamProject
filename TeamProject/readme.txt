

회원관련 기능 
	--> url-mapping : *.mem
	--> member.model // member.controller package에 class 생성.
	-->/WEB-INF/member 폴더에 jsp 파일 생성

게시판 관련 기능
	--> url-mapping : *.bbs
	--> board.model // board.controller package에 class생성
	-->/WEB-INF/board 폴더에 jsp 파일 생성

상품 관련 기능
	--> url-mapping : *.prd
	--> product.model // product.controller package에 class 생성
	-->/WEB-INF/product 폴더에 jsp 파일 생성

카테고리 관련 기능
	--> url-mapping : *.ct
	--> category.model // category.controller package에 class 생성
	-->/WEB-INF/category 폴더에 jsp 파일 생성

**

util.paging package  --> 페이징 class
util.mybatis --> mybatis 관련 config && mapper xml file

**

사용할 session 

로그인 정보 

session.setAttribute("loginfo") --> 회원 정보를 담는 session 객체
				--> 로그인 할 때 설정해야함.


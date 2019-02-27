package util.paging;


public class Paging_prd_Review {
		//페이징 관련 변수	
		private int totalCount = 0 ; //총 레코드 건수
		private int totalPage = 0 ; //전체 페이지 수
		private int pageNumber = 0 ; //보여줄 페이지 넘버
		private int pageSize = 6 ; //한 페이지에 보여줄 건수
		private int beginRow = 0 ; //현재 페이지의 시작 행
		private int endRow = 0 ; //현재 페이지의 끝 행
		private int pageCount = 5 ; // 한 화면에 보여줄 페이지 링크 수 (페이지 갯수)
		private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
		private int endPage = 0 ; //페이징 처리 끝 페이지 번호
		private int offset = 0 ; // 1:0, 2:2 , 3:4
		private int limit = 0 ;
		private String url = "" ; 
		private String pagingHtml = "";//하단의 숫자 페이지 링크
		private int prdNum=0;
		private String des="";
	
		public int getPrdNum() {
			return prdNum;
		}


		public void setPrdNum(int prdNum) {
			this.prdNum = prdNum;
		}


		public int getTotalCount() {
			return totalCount;
		}


		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}


		public int getTotalPage() {
			return totalPage;
		}


		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}


		public int getPageNumber() {
			return pageNumber;
		}


		public void setPageNumber(int pageNumber) {
			this.pageNumber = pageNumber;
		}


		public int getPageSize() {
			return pageSize;
		}


		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}


		public int getBeginRow() {
			return beginRow;
		}


		public void setBeginRow(int beginRow) {
			this.beginRow = beginRow;
		}


		public int getEndRow() {
			return endRow;
		}


		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}


		public int getPageCount() {
			return pageCount;
		}


		public void setPageCount(int pageCount) {
			this.pageCount = pageCount;
		}


		public int getBeginPage() {
			return beginPage;
		}


		public void setBeginPage(int beginPage) {
			this.beginPage = beginPage;
		}


		public int getEndPage() {
			return endPage;
		}


		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}


		public int getOffset() {
			return offset;
		}


		public void setOffset(int offset) {
			this.offset = offset;
		}


		public int getLimit() {
			return limit;
		}


		public void setLimit(int limit) {
			this.limit = limit;
		}


		public String getUrl() {
			return url;
		}


		public void setUrl(String url) {
			this.url = url;
		}


		public String getPagingHtml() {
			
			return pagingHtml;
//			pagingHtml:

		}


		public void setPagingHtml(String pagingHtml) {
			this.pagingHtml = pagingHtml;
		}
		public Paging_prd_Review (
				String _pageNumber, 
				String _pageSize,  
				int totalCount,
				String url,
				int _prdNum) {		
			
			this.prdNum = _prdNum;
			if(  _pageNumber == null ){
				_pageNumber = "1" ;
			}
			this.pageNumber = Integer.parseInt( _pageNumber ) ; 
			//pageNumber=3
			if( _pageSize == null ){
				_pageSize = "5" ; // 한 페이지에 보여줄 레코드 갯수
			}		
			this.pageSize = Integer.parseInt( _pageSize ) ;
			//pageSize = 2
			this.limit = pageSize ; // 한 페이지에 보여줄 레코드 갯수
			//limit=2
			
			this.totalCount = totalCount ; 

			this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ;
			//  ceil(3.0/2) => 2의 값이 totalPage에 들어간다.
			
			this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
			this.endRow =  this.pageNumber * this.pageSize ;
			// pageNumber가 2이면 beginRow=6, endRow=10
			
			if( this.pageNumber > this.totalPage ){
				this.pageNumber = this.totalPage ;
			}
			
			this.offset = ( pageNumber - 1 ) * pageSize ; 
			/*offset : 
				한 페이지에 2개씩 출력할 때,
				3페이지 클릭하면 앞에 4개 건너뛰고 5번째 부터 나와야 한다. 
				위의 offset = (3-1)*2 => 4(건너뛸 갯수가 된다.)
			*/	
			if( this.endRow > this.totalCount ){
				this.endRow = this.totalCount  ;
			}

			this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
			this.endPage = this.beginPage + this.pageCount - 1 ;
			/*pageCount=10 : 한 화면에 보일 페이지 수
			*/
			
			
			if( this.endPage > this.totalPage ){
				this.endPage = this.totalPage ;
			}
			
			this.url = url ; //  /ex/list.ab
			
			this.pagingHtml = getPagingHtml(url) ;
		
		}
		
		private String getPagingHtml( String url ){ //페이징 문자열을 만든다.
			System.out.println("getPagingHtml url:"+url); 
			
			String result = "" ;
			
			if (this.beginPage != 1) { 
				result += "&nbsp;<a href='" + url  +
						"?prdNum="+this.prdNum+ "&pageNumber=" + ( 1 ) + "&pageSize=" + this.pageSize + "&des=review#review'> << </a>&nbsp;" ;
				result += "&nbsp;<a href='" + url +
						"?prdNum="+this.prdNum+ "&pageNumber=" +  (this.beginPage - 1 ) + "&pageSize=" + this.pageSize  + "&des=review#review'> < </a>&nbsp;" ;
			}
			
			//가운데
			for (int i = this.beginPage; i <= this.endPage ; i++) {
				if ( i == this.pageNumber ) {
					result += "&nbsp;<font color='red'>" + i + "</font>&nbsp;"	;
							
				} else {
					result += "&nbsp;<a href='" + url   +
							"?prdNum="+this.prdNum+ "&pageNumber=" +  i + "&pageSize=" + this.pageSize  + "&des=review#review'>" + i + "</a>&nbsp;" ;
					
				}
			}
			
			System.out.println();
			
			if ( this.endPage != this.totalPage) { 
				
				result += "&nbsp;<a href='" + url  +
						"?prdNum="+this.prdNum+ "&pageNumber=" +  (this.endPage + 1 ) + "&pageSize=" + this.pageSize + "&des=review#review'> > </a>&nbsp;" ;
				
				result += "&nbsp;<a href='" + url  +
						"?prdNum="+this.prdNum+ "&pageNumber=" +  (this.totalPage ) + "&pageSize=" + this.pageSize + "&des=review#review'> >> </a>&nbsp;" ;
			}		
			
			return result ;
		}	
		
	}

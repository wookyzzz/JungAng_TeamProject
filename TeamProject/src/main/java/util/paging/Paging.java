package util.paging;

public class Paging {
	
	private int totalCount = 0; // 전체글수
	private int totalPage = 0; //전체 페이지수 (totalCount/pagesize) + (totalpage%pagesize=0 ? 0 : 1)
	private int pageNumber = 0; //현재 페이지 번호
	private int limit = 0; //한 페이지에 보여줄 글의 갯수
	private int pagingSize = 0; // 페이지 블럭 사이즈
	private int startPage = 0; // 페이지 블럭의 시작 페이지 번호 ((pageNumber - 1)*pagingSize) +1
	private int endPage = 0; //페이지 블럭의 마지막 페이지 번호 (startpage + pagingSize)-1
	private int offset = 0; // 건너뛸 글의 갯수 (pagesize-1 * pageNumber) 1page == > 0 // 2page ==> 10 // ...
	private int prev = 0; // 이전
	private int next = 0; // 다음
	
	public Paging(int totalCount,String pageNumber2, String limit2, String pagingSize2) {
		this.totalCount = totalCount;
		if(pageNumber2 == null){
			pageNumber2 = "1";
		}
		this.pageNumber = Integer.parseInt(pageNumber2);
		
		if(limit2 == null){
			limit2 = "10";
		}
		this.limit = Integer.parseInt(limit2);
		
		this.totalPage = (this.totalCount/this.limit) + (this.totalCount%this.limit == 0 ? 0 : 1);
		
		if(this.pageNumber > this.totalPage){
			this.pageNumber = this.totalPage;
		}
		
		if(pagingSize2 == null){
			pagingSize2 = "5";
		}
		this.pagingSize = Integer.parseInt(pagingSize2);
		
		this.startPage = ((this.pageNumber -1 )/this.pagingSize) * this.pagingSize +1;
		
		this.endPage = this.startPage+this.pagingSize-1;
		
		if(this.endPage>this.totalPage){
			this.endPage = this.totalPage;
		}
		
		this.offset = (this.pageNumber-1)*this.limit;
		
		if(this.startPage > this.pagingSize){
			this.prev = this.startPage-1;
		}
		
		if(this.totalPage-this.endPage > 0){
			this.next = this.endPage+1;
		}
		
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

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getPagingSize() {
		return pagingSize;
	}

	public void setPagingSize(int pagingSize) {
		this.pagingSize = pagingSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
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

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}
	
	
	

}

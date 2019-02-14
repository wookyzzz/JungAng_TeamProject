package category.model;

public class CategoryDetailBean {
	private int idx;
	private int catNum;
	private String name;
	private String url;
	public CategoryDetailBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryDetailBean(int idx, int catNum, String name, String url) {
		super();
		this.idx = idx;
		this.catNum = catNum;
		this.name = name;
		this.url = url;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCatNum() {
		return catNum;
	}
	public void setCatNum(int catNum) {
		this.catNum = catNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}

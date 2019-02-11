package category.model;

public class CategoryBean {
	private int idx;
	private String name;
	public CategoryBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryBean(int idx, String name) {
		super();
		this.idx = idx;
		this.name = name;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}

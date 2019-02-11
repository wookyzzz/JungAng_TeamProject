package board.model;

import org.springframework.web.multipart.MultipartFile;

public class BoardBean {
	
	private int idx;
	private int memNum;
	private int sortNum;
	private String subject;
	private String contents;
	private String image;
	private int ref;
	private int restep;
	private int relevel;
	private int readCount;
	private int inputdate;
	private MultipartFile upload;
	private String upload2;
	private String name;
	private int thumbs;
	public BoardBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardBean(int idx, int memNum, int sortNum, String subject, String contents, String image, int ref,
			int restep, int relevel, int readCount, int inputdate, MultipartFile upload, String upload2, String name, int thumbs) {
		super();
		this.idx = idx;
		this.memNum = memNum;
		this.sortNum = sortNum;
		this.subject = subject;
		this.contents = contents;
		this.image = image;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
		this.readCount = readCount;
		this.inputdate = inputdate;
		this.upload = upload;
		this.upload2 = upload2;
		this.name = name;
		this.thumbs = thumbs;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public int getSortNum() {
		return sortNum;
	}
	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRestep() {
		return restep;
	}
	public void setRestep(int restep) {
		this.restep = restep;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getInputdate() {
		return inputdate;
	}
	public void setInputdate(int inputdate) {
		this.inputdate = inputdate;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		if( this.upload != null){ 
			this.image = this.upload.getOriginalFilename();
			System.out.println("this.image:"+this.image);
		}
	}
	public String getUpload2() {
		return upload2;
	}
	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getThumbs() {
		return thumbs;
	}
	public void setThumbs(int thumbs) {
		this.thumbs = thumbs;
	}
	
	

}

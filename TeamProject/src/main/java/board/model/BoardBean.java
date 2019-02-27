package board.model;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class BoardBean {
	
	private int idx;
	private int memNum;
	private int sortNum;
	
	@NotNull(message="제목을 입력하세요.")
	private String subject;
	
	@NotEmpty(message="내용을 입력하세요.")
	private String contents;
	
	private String image;
	private int ref;
	private int restep;
	private int relevel;
	private int readCount;
	private Date inputdate;
	private MultipartFile upload;
	private String upload2;
	private String name;
	private int thumbs;
	private String nickname;
	private int bestLetter;
	private int replycount;
	
	
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public int getBestLetter() {
		return bestLetter;
	}
	public void setBestLetter(int bestLetter) {
		this.bestLetter = bestLetter;
	}
	public BoardBean() {
		super();
		// TODO Auto-generated constructor stub
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
	public Date getInputdate() {
		return inputdate;
	}
	public void setInputdate(Date inputdate) {
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

}

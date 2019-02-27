package product.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	private int idx;
	private int catNumdetail;
	private int  memNum ;
	private String  memId ; //멤버 아이디
	private String name; //상품이름
	private  String contents ;
    private int price;
    private int quantity;
    private String image;
    private int point;
    private MultipartFile upload;
    private String deliverycharge;
    
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
	public ProductBean() {
		super();
	}
	public String getDeliverycharge() {
		return deliverycharge;
	}
	public void setDeliverycharge(String deliverycharge) {
		this.deliverycharge = deliverycharge;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx= idx;
	}
	public int getCatNumdetail() {
		return catNumdetail;
	}
	public void setCatNumdetail(int catNumdetail) {
		this.catNumdetail = catNumdetail;
	}
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public String getName() { 
		return name;
	}
	public void Name(String name) {
		this.name = name;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;

		if( this.upload != null){ 
			this.image = image;
			System.out.println("this.image:"+this.image);
		}
	}

}

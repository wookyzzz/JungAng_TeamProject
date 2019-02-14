package member.model;

//회원 테이블
public class MemberBean {
	private int idx;
	private String id;
	private String passwd;
	private String name;
	private String tel;
	private String hp;
	private String nick;
	private String email;
	private String postcode1;
	private String address1;
	private String detailaddress1;
	private String postcode2;
	private String address2;
	private String detailaddress2;
	private int salesauthority;
	private int cash;
	private int point;
	private String birthdayyeardate;
	private String birthdaymonth;
	private String birthdaydate;
	private String memlevel;
	
	public MemberBean(){
		super();
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostcode1() {
		return postcode1;
	}

	public void setPostcode1(String postcode1) {
		this.postcode1 = postcode1;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getDetailaddress1() {
		return detailaddress1;
	}

	public void setDetailaddress1(String detailaddress1) {
		this.detailaddress1 = detailaddress1;
	}

	public String getPostcode2() {
		return postcode2;
	}

	public void setPostcode2(String postcode2) {
		this.postcode2 = postcode2;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getDetailaddress2() {
		return detailaddress2;
	}

	public void setDetailaddress2(String detailaddress2) {
		this.detailaddress2 = detailaddress2;
	}

	public int getSalesauthority() {
		return salesauthority;
	}

	public void setSalesauthority(int salesauthority) {
		this.salesauthority = salesauthority;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getBirthdayyeardate() {
		return birthdayyeardate;
	}

	public void setBirthdayyeardate(String birthdayyeardate) {
		this.birthdayyeardate = birthdayyeardate;
	}

	public String getBirthdaymonth() {
		return birthdaymonth;
	}

	public void setBirthdaymonth(String birthdaymonth) {
		this.birthdaymonth = birthdaymonth;
	}

	public String getBirthdaydate() {
		return birthdaydate;
	}

	public void setBirthdaydate(String birthdaydate) {
		this.birthdaydate = birthdaydate;
	}

	public String getMemlevel() {
		return memlevel;
	}

	public void setMemlevel(String memlevel) {
		this.memlevel = memlevel;
	}

	@Override
	public String toString() {
		return "MemberBean [idx=" + idx + ", id=" + id + ", passwd=" + passwd + ", name=" + name + ", tel=" + tel
				+ ", hp=" + hp + ", nick=" + nick + ", email=" + email + ", postcode1=" + postcode1 + ", address1="
				+ address1 + ", detailaddress1=" + detailaddress1 + ", postcode2=" + postcode2 + ", address2="
				+ address2 + ", detailaddress2=" + detailaddress2 + ", salesauthority=" + salesauthority + ", cash="
				+ cash + ", point=" + point + ", birthdayyeardate=" + birthdayyeardate + ", birthdaymonth="
				+ birthdaymonth + ", birthdaydate=" + birthdaydate + ", memlevel=" + memlevel + "]";
	}

	public MemberBean(int idx, String id, String passwd, String name, String tel, String hp, String nick, String email,
			String postcode1, String address1, String detailaddress1, String postcode2, String address2,
			String detailaddress2, int salesauthority, int cash, int point, String birthdayyeardate,
			String birthdaymonth, String birthdaydate, String memlevel) {
		super();
		this.idx = idx;
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.tel = tel;
		this.hp = hp;
		this.nick = nick;
		this.email = email;
		this.postcode1 = postcode1;
		this.address1 = address1;
		this.detailaddress1 = detailaddress1;
		this.postcode2 = postcode2;
		this.address2 = address2;
		this.detailaddress2 = detailaddress2;
		this.salesauthority = salesauthority;
		this.cash = cash;
		this.point = point;
		this.birthdayyeardate = birthdayyeardate;
		this.birthdaymonth = birthdaymonth;
		this.birthdaydate = birthdaydate;
		this.memlevel = memlevel;
	}
	
}
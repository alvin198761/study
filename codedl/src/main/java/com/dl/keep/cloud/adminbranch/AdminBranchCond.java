package com.dl.keep.cloud.adminbranch;
import java.util.Date;
import com.dl.keep.common.util.base.BaseCondition;

/**
 * @类说明:admin_branch查询条件类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
public class AdminBranchCond extends BaseCondition  {

	/**
	 * @方法说明:拼加自定义条件;可添加新条件、属性字段,删除不用的条件、属性字段
	 **/
	@Override
	public void addCondition() { 
		add(id, " AND T.ID = ?");
		add(address, " AND T.ADDRESS LIKE ?", 3);
		add(bname, " AND T.BNAME LIKE ?", 3);
		add(city, " AND T.CITY LIKE ?", 3);
		add(country, " AND T.COUNTRY LIKE ?", 3);
		add(head, " AND T.HEAD LIKE ?", 3);
		add(lat, " AND T.LAT = ?");
		add(lng, " AND T.LNG = ?");
		add(phone, " AND T.PHONE LIKE ?", 3);
		add(province, " AND T.PROVINCE LIKE ?", 3);
		add(reg_date, " AND T.REG_DATE = ?");
		add(status, " AND T.STATUS = ?");
		add(gid, " AND T.GID = ?");
		add(member_no, " AND T.MEMBER_NO LIKE ?", 3);
	}

	//页面查询条件的ID名称、查询条可以自行增减、把不用条件清理掉
	private Long id;// id
	private String address;// address
	private String bname;// bname
	private String city;// city
	private String country;// country
	private String head;// head
	private Float lat;// lat
	private Float lng;// lng
	private String phone;// phone
	private String province;// province
	private Date reg_date;// reg_date
	private Boolean status;// status
	private Long gid;// gid
	private String member_no;// member_no

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public Float getLat() {
		return lat;
	}
	public void setLat(Float lat) {
		this.lat = lat;
	}
	public Float getLng() {
		return lng;
	}
	public void setLng(Float lng) {
		this.lng = lng;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Long getGid() {
		return gid;
	}
	public void setGid(Long gid) {
		this.gid = gid;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
}
package com.dl.keep.cloud.adminbranch;
import java.util.Date;

/**
 * @类说明:admin_branch实体类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
public class AdminBranch {

	//数据库中的字段
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

	//此处可添加查询显示辅助字段

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
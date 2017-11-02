package com.biyao.admin.sys.user.model;
import java.util.Date;
/**
 * 用户实体类
 *
 * @author GZZ
 * @date 2014-02-16 00:23:30
 */
public class User {

	private String id;// 主键
	private String organize_id;// 组织机构
	private String login_id;// 登录名
	private String password;// 登录密码
	private String user_type;// 用户类型
	private String sex_stat;// 性别
	private String name;// 姓名
	private String e_mail;// 电邮
	private String id_card;// 身份证号
	private String tel;// 联系电话
	private String remark;// 备注
	private Date ts;// 时间戳
	private Integer dr;// 删除标记
	
	//此处可添加查询显示辅助字段

	private String org_name;//区划名称
	
	private String pw1;// 修改密码辅助字段
	private String pw2;// 修改密码辅助字段
	
	public String getPw1() {
		return pw1;
	}
	public void setPw1(String pw1) {
		this.pw1 = pw1;
	}
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrganize_id() {
		return organize_id;
	}
	public void setOrganize_id(String organize_id) {
		this.organize_id = organize_id;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getSex_stat() {
		return sex_stat;
	}
	public void setSex_stat(String sex_stat) {
		this.sex_stat = sex_stat;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getTs() {
		return ts;
	}
	public void setTs(Date ts) {
		this.ts = ts;
	}
	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}
}
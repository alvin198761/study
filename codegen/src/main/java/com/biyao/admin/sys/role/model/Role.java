package com.biyao.admin.sys.role.model;
import java.util.Date;
/**
 * 角色实体类
 *
 * @author GZZ
 * @date 2014-02-15 12:59:49
 */
public class Role {

	private String id;// 主键
	private Date ts;// 时间戳
	private String remark;// 备注
	private Integer dr;// 删除标志
	private String name;// 名称
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getTs() {
		return ts;
	}
	public void setTs(Date ts) {
		this.ts = ts;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}
}
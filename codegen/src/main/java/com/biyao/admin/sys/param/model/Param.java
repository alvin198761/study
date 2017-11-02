package com.biyao.admin.sys.param.model;
import java.util.Date;
/**
 * 系统参数实体类
 *
 * @author GZZ
 * @date 2014-02-15 11:09:23
 */
public class Param {

	private String id;// 主键

	private String name;// 参数名称

	private String param_key;// 参数键

	private String remark;// 备注

	private Date ts;// 时间戳

	private String param_value;// 参数值

	private Integer dr;// 删除标记

	private Integer usable;// 是否启用

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getParam_key() {
		return param_key;
	}
	public void setParam_key(String param_key) {
		this.param_key = param_key;
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

	public String getParam_value() {
		return param_value;
	}
	public void setParam_value(String param_value) {
		this.param_value = param_value;
	}

	public Integer getDr() {
		return dr;
	}
	public void setDr(Integer dr) {
		this.dr = dr;
	}

	public Integer getUsable() {
		return usable;
	}
	public void setUsable(Integer usable) {
		this.usable = usable;
	}
}
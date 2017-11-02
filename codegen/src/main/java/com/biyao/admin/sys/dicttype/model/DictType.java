package com.biyao.admin.sys.dicttype.model;
import java.util.Date;
/**
 * 字典类型实体类
 *
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
public class DictType {

	private String id;// 主键

	private String type_code;// 类型标识

	private String type_name;// 类型名称

	private String remark;// 备注

	private Date ts;// 时间戳

	private Integer dr;// 删除标记

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}

	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
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
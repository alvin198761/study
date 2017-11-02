package com.biyao.admin.sys.dict.model;
import java.util.Date;
/**
 * 数据字典实体类
 *
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
public class Dict {

	private String id;// 主键
	private String type_code;// 类型编码
	private String data_key;// 数据键
	private String data_value;// 数据值
	private String type_id;// 类型名称
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
	public String getData_key() {
		return data_key;
	}
	public void setData_key(String data_key) {
		this.data_key = data_key;
	}
	public String getData_value() {
		return data_value;
	}
	public void setData_value(String data_value) {
		this.data_value = data_value;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
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
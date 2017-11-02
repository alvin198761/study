package com.biyao.admin.sys.systype.model;
import java.util.Date;

/**
 * @类说明:资产类型表实体类
 *
 * @author:高振中
 * @date:2014-07-30 14:07:07
 */
public class SysType {

	//数据库中的字段
	private String id;// 主键
	private String name;// 名称
	private String parent_id;// 父结点ID
	private Integer is_leaf;// 是否叶子
	private Date ts;// 时间戳
	private String remark;// 备注
	private String order_code;// 排序编号

	//此处可添加查询显示辅助字段

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
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public Integer getIs_leaf() {
		return is_leaf;
	}
	public void setIs_leaf(Integer is_leaf) {
		this.is_leaf = is_leaf;
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
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
}
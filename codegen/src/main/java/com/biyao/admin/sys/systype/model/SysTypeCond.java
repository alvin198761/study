package com.biyao.admin.sys.systype.model;
import java.util.Date;

import com.common.condition.BaseCondition;

/**
 * @类说明:资产类型表查询条件类
 *
 * @author:高振中
 * @date:2014-07-30 14:07:07
 */
public class SysTypeCond extends BaseCondition  {

	/**
	 * @方法说明:拼加自定义条件;可添加新条件、属性字段,删除不用的条件、属性字段
	 */
	@Override
	public void addCondition() { 
		add(id_c, " AND T.ID = ?");
		add(name_c, " AND T.NAME = ?");
		add(parent_id_c, " AND T.PARENT_ID = ?");
		add(is_leaf_c, " AND T.IS_LEAF = ?");
		add(ts_c, " AND T.TS = ?");
		add(remark_c, " AND T.REMARK = ?");
		add(order_code_c, " AND T.ORDER_CODE = ?");
	}

	//页面查询条件的ID名称
	private String id_c;// 主键
	private String name_c;// 名称
	private String parent_id_c;// 父结点ID
	private Integer is_leaf_c;// 是否叶子
	private Date ts_c;// 时间戳
	private String remark_c;// 备注
	private String order_code_c;// 排序编号

	public String getId_c() {
		return id_c;
	}
	public void setId_c(String id_c) {
		this.id_c = id_c;
	}
	public String getName_c() {
		return name_c;
	}
	public void setName_c(String name_c) {
		this.name_c = name_c;
	}
	public String getParent_id_c() {
		return parent_id_c;
	}
	public void setParent_id_c(String parent_id_c) {
		this.parent_id_c = parent_id_c;
	}
	public Integer getIs_leaf_c() {
		return is_leaf_c;
	}
	public void setIs_leaf_c(Integer is_leaf_c) {
		this.is_leaf_c = is_leaf_c;
	}
	public Date getTs_c() {
		return ts_c;
	}
	public void setTs_c(Date ts_c) {
		this.ts_c = ts_c;
	}
	public String getRemark_c() {
		return remark_c;
	}
	public void setRemark_c(String remark_c) {
		this.remark_c = remark_c;
	}
	public String getOrder_code_c() {
		return order_code_c;
	}
	public void setOrder_code_c(String order_code_c) {
		this.order_code_c = order_code_c;
	}

	public SysTypeCond(Object[][] obj) {super(obj);}
	public SysTypeCond(){}
}
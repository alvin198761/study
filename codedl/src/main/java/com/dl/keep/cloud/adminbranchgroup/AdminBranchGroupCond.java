package com.dl.keep.cloud.adminbranchgroup;
import com.dl.keep.common.util.base.BaseCondition;

/**
 * @类说明:admin_branch_group查询条件类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
public class AdminBranchGroupCond extends BaseCondition  {

	/**
	 * @方法说明:拼加自定义条件;可添加新条件、属性字段,删除不用的条件、属性字段
	 **/
	@Override
	public void addCondition() { 
		add(id, " AND T.ID = ?");
		add(name, " AND T.NAME LIKE ?", 3);
	}

	//页面查询条件的ID名称、查询条可以自行增减、把不用条件清理掉
	private Long id;// id
	private String name;// name

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
package com.dl.keep.cloud.adminbranchgroup;

/**
 * @类说明:admin_branch_group实体类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
public class AdminBranchGroup {

	//数据库中的字段
	private Long id;// id
	private String name;// name

	//此处可添加查询显示辅助字段

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
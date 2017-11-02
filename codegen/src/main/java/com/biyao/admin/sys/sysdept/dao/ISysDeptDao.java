package com.biyao.admin.sys.sysdept.dao;

import java.util.List;
import java.util.Map;

import com.biyao.admin.sys.sysdept.model.SysDept;
import com.biyao.admin.sys.sysdept.model.SysDeptCond;

/**
 * @类说明:组织机构Dao接口类
 *
 * @author:高振中
 * @date:2014-07-29 16:49:42
 */
public interface ISysDeptDao {

	/**
	 * @方法说明:新增记录
	 */
	public String insert(SysDept sysdept);

	/**
	 * @方法说明:物理删除记录(多条)
	 */
	public int delete(String id);

	/**
	 * @方法说明:按ID查找单个实体
	 */
	public SysDept findById(String id);

	/**
	 * @方法说明:更新记录
	 */
	public int update(SysDept sysdept);

	/**
	 * @方法说明:按条件查询分页列表
	 */
	public Map<String, Object> queryList(SysDeptCond cond, Map<String, Object> map);

	/**
	 * @方法说明:按条件查询不分页列表(使用范型)
	 */
	public List<SysDept> queryAllObj(SysDeptCond cond);

	/**
	 * @方法说明:按条件查询记录个数
	 */
	public int findCountByCond(SysDeptCond cond);

	/**
	 * @方法说明:逻辑删除记录(多条)
	 */
	public int deleteLogic(String id);

	/**
	 * @方法说明:修改叶子标志
	 */
	public int updateLeaf(Object[] obj);

	/**
	 * @方法说明:修改上级叶子标志
	 */
	public int updateParent(Object[] obj);
}
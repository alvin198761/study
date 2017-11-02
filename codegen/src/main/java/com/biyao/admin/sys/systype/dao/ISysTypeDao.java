package com.biyao.admin.sys.systype.dao;

import java.util.List;
import java.util.Map;

import com.biyao.admin.sys.systype.model.SysType;
import com.biyao.admin.sys.systype.model.SysTypeCond;

/**
 * @类说明:资产类型表Dao接口类
 *
 * @author:高振中
 * @date:2014-07-30 14:07:07
 */
public interface ISysTypeDao {

	/**
	 * @方法说明:新增记录
	 */
	public String insert(SysType systype);

	/**
	 * @方法说明:物理删除记录(多条)
	 */
	public int delete(String id);

	/**
	 * @方法说明:按ID查找单个实体
	 */
	public SysType findById(String id);

	/**
	 * @方法说明:更新记录
	 */
	public int update(SysType systype);

	/**
	 * @方法说明:按条件查询分页列表
	 */
	public Map<String, Object> queryList(SysTypeCond cond, Map<String, Object> map);

	/**
	 * @方法说明:按条件查询不分页列表(使用范型)
	 */
	public List<SysType> queryAllObj(SysTypeCond cond);

	/**
	 * @方法说明:按条件查询记录个数
	 */
	public int findCountByCond(SysTypeCond cond);

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
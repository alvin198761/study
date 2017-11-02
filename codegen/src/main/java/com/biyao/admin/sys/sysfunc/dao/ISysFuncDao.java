package com.biyao.admin.sys.sysfunc.dao;
import java.util.List;
import java.util.Map;

import com.biyao.admin.sys.sysfunc.model.SysFunc;
import com.biyao.admin.sys.sysfunc.model.SysFuncCond;

/**
 * @类说明:功能菜单Dao接口类
 *
 * @author:高振中
 * @date:2014-07-29 11:08:22
 */
public interface ISysFuncDao {

	/**
	 * @方法说明:新增记录
	 */
	public String insert(SysFunc sysfunc);

	/**
	 * @方法说明:物理删除记录(多条)
	 */
	public int delete(String id);

	/**
	 * @方法说明:按ID查找单个实体
	 */
	public SysFunc findById(String id);

	/**
	 * @方法说明:更新记录
	 */
	public int update(SysFunc sysfunc);

	/**
	 * @方法说明:按条件查询分页列表
	 */
	public Map<String, Object> queryList(SysFuncCond cond, Map<String, Object> map);

	/**
	 * @方法说明:按条件查询不分页列表(使用范型)
	 */
	public List<SysFunc> queryAllObj(SysFuncCond cond);

	/**
	 * @方法说明:按条件查询记录个数
	 */
	public int findCountByCond(SysFuncCond cond);

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
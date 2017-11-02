package com.biyao.admin.sys.systype.service;
import java.util.List;
import java.util.Map;

import org.dom4j.Element;

import com.biyao.admin.sys.systype.model.SysType;
import com.biyao.admin.sys.systype.model.SysTypeCond;

/**
 * @类说明:资产类型表Service接口类
 *
 * @author:高振中
 * @date:2014-07-30 14:07:07
 */
public interface ISysTypeService {

	/**
	 * @方法说明:查找全部子结点(递规)
	 */
	public void getSonElement(Element node, String type, SysTypeCond cond);

	/**
	 * @方法说明:新增记录
	 */
	public String insert(SysType systype);

	/**
	 * @方法说明:删除记录(多条)
	 */
	public String delete(String id);

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
}
package com.biyao.admin.sys.role.service;
import java.util.List;
import java.util.Map;

import com.biyao.admin.sys.role.model.Role;
import com.biyao.admin.sys.role.model.RoleCond;
/**
 * 角色Service接口类
 *
 * @author GZZ
 * @date 2014-02-15 12:59:49
 */
public interface IRoleService {
	/**
	 * 新增
	 */
	public int insert(Role role);
	/**
	 * 删除
	 */
	public int delete(String id);
	/**
	 * 按ID查找单个实体
	 */
	public Role findById(String id);
	/**
	 * 更新
	 */
	public int update(Role role);
	/**
	 * 按条件查询分页列表
	 */
	public Map<String, Object> queryList(RoleCond cond, Map<String, Object> map);
 	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	public List<Role> queryAllObj(RoleCond cond);
	/**
	 * 按条件查询不分页列表(不使用类型)
	 */
	public List<Map<String, Object>> queryAllMap(RoleCond cond);
	/**
	 * 按条件查询记录个数
	 */
	public int findCountByCond(RoleCond cond);
}
package com.biyao.admin.sys.user.dao;

import java.util.List;
import java.util.Map;

import com.biyao.admin.sys.user.model.User;
import com.biyao.admin.sys.user.model.UserCond;

/**
 * 用户Dao接口类
 *
 * @author GZZ
 * @date 2014-02-16 00:23:30
 */
public interface IUserDao {
	/**
	 * 新增
	 */
	public int insert(User user);

	/**
	 * 物理删除
	 */
	public int delete(String id);

	/**
	 * 按ID查找单个实体
	 */
	public User findById(String id);

	/**
	 * 更新
	 */
	public int update(User user);

	/**
	 * 按条件查询分页列表
	 */
	public Map<String, Object> queryList(UserCond cond, Map<String, Object> map);

	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	public List<User> queryAllObj(UserCond cond);

	/**
	 * 按条件查询记录个数
	 */
	public int findCountByCond(UserCond cond);

	/**
	 * 重置密码
	 */
	public int updatePas(User vo);
}
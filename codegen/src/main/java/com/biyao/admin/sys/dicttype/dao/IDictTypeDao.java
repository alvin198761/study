package com.biyao.admin.sys.dicttype.dao;
import java.util.Map;

import com.biyao.admin.sys.dicttype.model.DictType;
import com.biyao.admin.sys.dicttype.model.DictTypeCond;
/**
 * 字典类型Dao接口类
 *
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
public interface IDictTypeDao {
	/**
	 * 新增
	 */
	public int insert(DictType dicttype);
	/**
	 * 更新
	 */
	public int update(DictType dicttype);
	/**
	 * 删除
	 */
	public int delete(String id);
	/**
	 * 按ID查找单个实体
	 */
	public DictType findById(String id);
	/**
	 * 按条件查询分页列表
	 */
	public Map<String, Object> queryList(DictTypeCond cond, Map<String, Object> map);
	/**
	 * 按条件查询记录个数
	 */
	public int findCountByCond(DictTypeCond cond);
}
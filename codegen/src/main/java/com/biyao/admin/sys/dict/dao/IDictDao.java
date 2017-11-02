package com.biyao.admin.sys.dict.dao;

import java.util.List;
import java.util.Map;

import com.biyao.admin.sys.dict.model.Dict;
import com.biyao.admin.sys.dict.model.DictCond;

/**
 * 数据字典Dao接口类
 *
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
public interface IDictDao {
	/**
	 * 新增
	 */
	public int insert(Dict dict);

	/**
	 * 更新
	 */
	public int update(Dict dict);

	/**
	 * 更新类型编号
	 */
	public int updateType(Dict vo);

	/**
	 * 删除
	 */
	public int delete(String id);

	/**
	 * 按ID查找单个实体
	 */
	public Dict findById(String id);

	/**
	 * 按条件查询分页列表
	 */
	public Map<String, Object> queryList(DictCond cond, Map<String, Object> map);

	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	public List<Dict> queryAllObj(DictCond cond);

	/**
	 * 按条件查询记录个数
	 */
	public int findCountByCond(DictCond cond);
}
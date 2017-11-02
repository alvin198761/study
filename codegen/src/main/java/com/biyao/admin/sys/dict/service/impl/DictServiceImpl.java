package com.biyao.admin.sys.dict.service.impl;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biyao.admin.sys.dict.dao.IDictDao;
import com.biyao.admin.sys.dict.model.Dict;
import com.biyao.admin.sys.dict.model.DictCond;
import com.biyao.admin.sys.dict.service.IDictService;
/**
 * 数据字典Service实现类
 * 
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
@Service
public class DictServiceImpl implements IDictService {
	@Autowired
	private IDictDao dao;
	/**
	 * 新增
	 */
	@Override
	public int insert(Dict dict) {
		dict.setTs(new Date());
		dict.setDr(0);
		return dao.insert(dict);
	}
	/**
	 * 删除
	 */
	@Override
	public int delete(String id) {
		return dao.delete(id);
	}
	/**
	 * 按ID查找单个实体
	 */
	@Override
	public Dict findById(String id) {
		return dao.findById(id);
	}
	/**
	 * 更新
	 */
	@Override
	public int update(Dict dict) {
		dict.setTs(new Date());
		return dao.update(dict);
	}
	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList( DictCond cond, Map<String, Object> map) {
		return dao.queryList(cond, map);
	}
	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	@Override
	public List<Dict> queryAllObj(DictCond cond) {
		return dao.queryAllObj(cond);
	}
	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(DictCond cond) {
		return dao.findCountByCond(cond);
	}

}
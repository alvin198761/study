package com.biyao.admin.sys.dicttype.service.impl;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biyao.admin.sys.dict.dao.IDictDao;
import com.biyao.admin.sys.dict.model.Dict;
import com.biyao.admin.sys.dicttype.dao.IDictTypeDao;
import com.biyao.admin.sys.dicttype.model.DictType;
import com.biyao.admin.sys.dicttype.model.DictTypeCond;
import com.biyao.admin.sys.dicttype.service.IDictTypeService;
 
/**
 * 字典类型Service实现类
 *
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
@Service
public class DictTypeServiceImpl  implements IDictTypeService {
	@Autowired
	private IDictTypeDao dao;
	@Autowired
	private IDictDao dictDao;
	/**
	 * 新增
	 */
	@Override
	public int insert(DictType dicttype) {
		dicttype.setTs(new Date());
		dicttype.setDr(0);
		return dao.insert(dicttype);
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
	public DictType findById(String id) {
		return dao.findById(id);
	}
	/**
	 * 更新
	 */
	@Override
	public int update(DictType dicttype) {
		dicttype.setTs(new Date());
		Dict dict = new Dict();
		dict.setType_code(dicttype.getType_code());
		dict.setType_id(dicttype.getId());
		dict.setTs(new Date());
		dictDao.updateType(dict);
		return dao.update(dicttype);
	}
	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(DictTypeCond cond, Map<String, Object> map) {
		return dao.queryList(cond, map);
	}
	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(DictTypeCond cond) {
		return dao.findCountByCond(cond);
	}
}
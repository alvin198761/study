package com.dl.keep.sys.param.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.constant.Constant;
import com.dl.keep.sys.param.dao.IParamDao;
import com.dl.keep.sys.param.model.Param;
import com.dl.keep.sys.param.model.ParamCond;
import com.dl.keep.sys.param.service.IParamService;

/**
 * 系统参数Service实现类
 * 
 * @author GZZ
 * @date 2014-02-15 11:09:23
 */
@Service
public class ParamServiceImpl implements IParamService {
	@Autowired
	private IParamDao dao;

	@Autowired
	private Constant constant;

	/**
	 * 新增
	 */
	@Override
	public int insert(Param param) {
		return dao.insert(param);
	}

	/**
	 * 删除多条数据
	 */
	@Override
	public int delete(String ids) {
		return dao.delete(ids);
	}

	/**
	 * 按ID查找单个实体
	 */
	@Override
	public Param findById(String id) {
		return dao.findById(id);
	}

	/**
	 * 更新
	 */
	@Override
	public int update(Param param) {
		int count = dao.update(param);
		constant.initPageSize();
		return count;
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public void queryList(ParamCond cond, Map<String, Object> map) {
		dao.queryList(cond, map);
	}

	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	@Override
	public List<Param> queryAllObj(ParamCond cond) {
		return dao.queryAllObj(cond);
	}

	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(ParamCond cond) {
		return dao.findCountByCond(cond);
	}
}
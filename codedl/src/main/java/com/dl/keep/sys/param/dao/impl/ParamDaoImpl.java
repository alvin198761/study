package com.dl.keep.sys.param.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.common.util.UUIDGenerator;
import com.common.util.Util;
import com.dl.keep.sys.param.dao.IParamDao;
import com.dl.keep.sys.param.model.Param;
import com.dl.keep.sys.param.model.ParamCond;
import com.dl.keep.webdata.common.jdbc.BaseDao;

/**
 * 系统参数Dao实现类
 * 
 * @author GZZ
 * @date 2014-02-15 11:09:23
 */
@Repository
public class ParamDaoImpl extends BaseDao  implements IParamDao {

	private final String insertSql = "INSERT INTO SYS_PARA (ID,NAME,PARAM_KEY,REMARK,PARAM_VALUE) VALUES (?,?,?,?,?) ";
	private final String selectSql = "SELECT T.ID,T.NAME,T.PARAM_KEY,T.REMARK,T.PARAM_VALUE FROM SYS_PARA T WHERE 1=1";
	private final String updateSql = "UPDATE SYS_PARA SET NAME=?,PARAM_KEY=?,REMARK=?,PARAM_VALUE=? WHERE ID=? ";

	/**
	 * 新增
	 */
	@Override
	public int insert(Param vo) {
		Object[] params = { UUIDGenerator.getUUID(), vo.getName(), vo.getParam_key(), vo.getRemark(),
				vo.getParam_value() };
		return jdbcTemplate.update(insertSql, params);
	}

	/**
	 * 删除
	 */
	@Override
	public int delete(String ids) {
		String updateStr = "DELETE FROM SYS_PARA WHERE ID " + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * 更新
	 */
	@Override
	public int update(Param vo) {
		Object[] params = { vo.getName(), vo.getParam_key(), vo.getRemark(), vo.getParam_value(), vo.getId() };
		return jdbcTemplate.update(updateSql, params);
	}

	/**
	 * 按ID查找单个实体
	 */
	@Override
	public Param findById(String id) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + " AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[] { id },
				new BeanPropertyRowMapper<Param>(Param.class));
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public void queryList(ParamCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql);
		sb.append(cond.getCondition());
		queryPage(map, sb.toString(), cond, Param.class);
	}

	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	@Override
	public List<Param> queryAllObj(ParamCond cond) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql);
		sb.append(cond.getCondition());
		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<Param>(Param.class));
	}

	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(ParamCond cond) {
		String countSql = "SELECT COUNT(T.ID) FROM SYS_PARA T WHERE 1=1" + cond.getCondition();
		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);
	}
}
package com.biyao.admin.sys.param.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.param.dao.IParamDao;
import com.biyao.admin.sys.param.model.Param;
import com.biyao.admin.sys.param.model.ParamCond;
import com.common.dao.BaseDao;
import com.common.util.UUIDGenerator;
import com.common.util.Util;

/**
 * 系统参数Dao实现类
 * 
 * @author GZZ
 * @date 2014-02-15 11:09:23
 */
@Repository
public class ParamDaoImpl extends BaseDao implements IParamDao {

	private final String insertSql = "INSERT INTO SYS_PARA (ID,NAME,PARAM_KEY,REMARK,TS,PARAM_VALUE,DR,USABLE) VALUES (?,?,?,?,?,?,?,?) ";
	private final String selectSql = "SELECT T.ID,T.NAME,T.PARAM_KEY,T.REMARK,T.TS,T.PARAM_VALUE,T.DR,T.USABLE FROM SYS_PARA T WHERE 1=1";
	private final String updateSql = "UPDATE SYS_PARA SET NAME=?,PARAM_KEY=?,REMARK=?,TS=?,PARAM_VALUE=?, USABLE=? WHERE ID=? ";

	/**
	 * 新增
	 */
	@Override
	public int insert(Param vo) {
		Object[] params = new Object[] { UUIDGenerator.getUUID(), vo.getName(), vo.getParam_key(), vo.getRemark(), vo.getTs(), vo.getParam_value(), vo.getDr(), vo.getUsable() };
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
	 * 按ID查找单个实体
	 */
	@Override
	public Param findById(String id) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + " AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[] { id }, new BeanPropertyRowMapper<Param>(Param.class));
	}

	/**
	 * 按条件查找单个实体
	 */
	@Override
	public Param findByCond(ParamCond cond) {
		StringBuilder sb = new StringBuilder(selectSql);
		sb.append(cond.getCondition());
		return jdbcTemplate.queryForObject(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<Param>(Param.class));
	}

	/**
	 * 更新
	 */
	@Override
	public int update(Param vo) {
		Object[] params = new Object[] { vo.getName(), vo.getParam_key(), vo.getRemark(), vo.getTs(), vo.getParam_value(), vo.getUsable(), vo.getId() };
		return jdbcTemplate.update(updateSql, params);
	}

	/**
	 * 按键去更新值
	 */
	@Override
	public int updateByKey(Param vo) {
		String sql = "UPDATE SYS_PARA SET PARAM_VALUE=? WHERE PARAM_KEY=? ";
		Object[] params = new Object[] { vo.getParam_value(), vo.getParam_key() };
		return jdbcTemplate.update(sql, params);
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(ParamCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition());
		return page.getPage(map, sb.toString(), cond, cond.getArray(), Param.class);// (不使用范型)
	}

	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	@Override
	public List<Param> queryAllObj(ParamCond cond) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition());
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
package com.biyao.admin.sys.dict.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.dict.dao.IDictDao;
import com.biyao.admin.sys.dict.model.Dict;
import com.biyao.admin.sys.dict.model.DictCond;
import com.common.dao.BaseDao;
import com.common.util.DataUtil;
import com.common.util.UUIDGenerator;
import com.common.util.Util;

/**
 * 数据字典Dao实现类
 * 
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
@Repository
public class DictDaoImpl extends BaseDao implements IDictDao {

	private final String insertSql = "INSERT INTO SYS_DICT (ID,TYPE_CODE,DATA_KEY,DATA_VALUE,TYPE_ID,REMARK,TS,DR) VALUES (?,?,?,?,?,?,?,?) ";
	private final String selectSql = "SELECT T.ID,T.TYPE_CODE,T.DATA_KEY,T.DATA_VALUE,T.TYPE_ID,T.REMARK,T.TS,T.DR FROM SYS_DICT T WHERE 1=1";
	private final String updateSql = "UPDATE SYS_DICT SET TYPE_CODE=?,DATA_KEY=?,DATA_VALUE=?,TYPE_ID=?,REMARK=?,TS=? WHERE ID=? ";

	/**
	 * 新增
	 */
	@Override
	public int insert(Dict vo) {
		Object[] params = new Object[] { UUIDGenerator.getUUID(), vo.getType_code(), vo.getData_key(), vo.getData_value(), vo.getType_id(), vo.getRemark(), vo.getTs(), vo.getDr() };
		return jdbcTemplate.update(insertSql, params);
	}

	/**
	 * 删除
	 */
	@Override
	public int delete(String ids) {
		String updateStr = "DELETE FROM SYS_DICT WHERE ID " + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * 按ID查找单个实体
	 */
	@Override
	public Dict findById(String id) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + " AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[] { id }, new BeanPropertyRowMapper<Dict>(Dict.class));
	}

	/**
	 * 更新
	 */
	@Override
	public int update(Dict vo) {
		Object[] params = new Object[] { vo.getType_code(), vo.getData_key(), vo.getData_value(), vo.getType_id(), vo.getRemark(), vo.getTs(), vo.getId() };
		return jdbcTemplate.update(updateSql, params);
	}

	/**
	 * 更新类型编号
	 */
	@Override
	public int updateType(Dict vo) {
		String sql = "UPDATE SYS_DICT SET TYPE_CODE=?,TS=? WHERE TYPE_id=?";
		Object[] params = new Object[] { vo.getType_code(), vo.getTs(), vo.getType_id() };
		logger.debug(DataUtil.showSql(sql, params));// 显示SQL语句
		return jdbcTemplate.update(sql, params);
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(DictCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition() + " ORDER BY T.ID");
		return page.getPage(map, sb.toString(), cond, cond.getArray());// (不使用范型)
	}

	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	@Override
	public List<Dict> queryAllObj(DictCond cond) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition());
		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<Dict>(Dict.class));
	}

	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(DictCond cond) {
		String countSql = "SELECT COUNT(T.ID) FROM SYS_DICT T WHERE 1=1" + cond.getCondition();
		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);
	}
}
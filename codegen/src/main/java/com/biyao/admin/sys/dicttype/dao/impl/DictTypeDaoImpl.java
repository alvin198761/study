package com.biyao.admin.sys.dicttype.dao.impl;

import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.dicttype.dao.IDictTypeDao;
import com.biyao.admin.sys.dicttype.model.DictType;
import com.biyao.admin.sys.dicttype.model.DictTypeCond;
import com.common.dao.BaseDao;
import com.common.util.UUIDGenerator;
import com.common.util.Util;

/**
 * 字典类型Dao实现类
 *
 * @author GZZ
 * @date 2014-02-15 00:11:52
 */
@Repository
public class DictTypeDaoImpl extends BaseDao implements IDictTypeDao {

	private final String insertSql = "INSERT INTO SYS_DICT_TYPE (ID,TYPE_CODE,TYPE_NAME,REMARK,TS,DR) VALUES (?,?,?,?,?,?) ";
	private final String selectSql = "SELECT T.ID,T.TYPE_CODE,T.TYPE_NAME,T.REMARK,T.TS,T.DR FROM SYS_DICT_TYPE T WHERE 1=1";
	private final String updateSql = "UPDATE SYS_DICT_TYPE SET TYPE_CODE=?,TYPE_NAME=?,REMARK=?,TS=? WHERE ID=? ";

	/**
	 * 新增
	 */
	@Override
	public int insert(DictType vo) {
		Object[] params = new Object[] { UUIDGenerator.getUUID(), vo.getType_code(), vo.getType_name(), vo.getRemark(), vo.getTs(), vo.getDr() };
		return jdbcTemplate.update(insertSql, params);
	}

	/**
	 * 删除
	 */
	@Override
	public int delete(String ids) {
		String updateStr = "DELETE FROM SYS_DICT_TYPE WHERE ID " + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * 按ID查找单个实体
	 */
	@Override
	public DictType findById(String id) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + " AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[] { id }, new BeanPropertyRowMapper<DictType>(DictType.class));
	}

	/**
	 * 更新
	 */
	@Override
	public int update(DictType vo) {
		Object[] params = new Object[] { vo.getType_code(), vo.getType_name(), vo.getRemark(), vo.getTs(), vo.getId() };
		return jdbcTemplate.update(updateSql, params);
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(DictTypeCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition() + " ORDER BY T.ID");
		return page.getPage(map, sb.toString(), cond, cond.getArray(), DictType.class);// (不使用范型)
	}

	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(DictTypeCond cond) {
		String countSql = "SELECT COUNT(T.ID) FROM SYS_DICT_TYPE T WHERE 1=1" + cond.getCondition();
		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);
	}
}
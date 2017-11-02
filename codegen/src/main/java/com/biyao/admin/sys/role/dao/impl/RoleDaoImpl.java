package com.biyao.admin.sys.role.dao.impl;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.role.dao.IRoleDao;
import com.biyao.admin.sys.role.model.Role;
import com.biyao.admin.sys.role.model.RoleCond;
import com.common.dao.BaseDao;
import com.common.util.UUIDGenerator;
import com.common.util.Util;
/**
 * 角色Dao实现类
 * 
 * @author GZZ
 * @date 2014-02-15 12:59:49
 */
@Repository
public class RoleDaoImpl extends BaseDao implements IRoleDao {
	private final String insertSql = "INSERT INTO SYS_ROLE (ID,NAME,TS,REMARK,DR) VALUES (?,?,?,?,?) ";
	private final String selectSql = "SELECT T.ID,T.NAME,T.TS,T.REMARK,T.DR FROM SYS_ROLE T WHERE 1=1";
	private final String updateSql = "UPDATE SYS_ROLE SET NAME=?,TS=?,REMARK=? WHERE ID=? ";
	/**
	 * 新增
	 */
	@Override
	public int insert(Role vo) {
		Object[] params = new Object[]{UUIDGenerator.getUUID(), vo.getName(), vo.getTs(), vo.getRemark(), vo.getDr()};
		return jdbcTemplate.update(insertSql, params);
	}
	/**
	 * 物理删除
	 */
	@Override
	public int delete(String ids) {
		String updateStr = "DELETE FROM SYS_ROLE WHERE ID " + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}
	/**
	 * 按ID查找单个实体
	 */
	@Override
	public Role findById(String id) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + " AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[]{id}, new BeanPropertyRowMapper<Role>(Role.class));
	}
	/**
	 * 更新
	 */
	@Override
	public int update(Role vo) {
		Object[] params = new Object[]{vo.getName(), vo.getTs(), vo.getRemark(), vo.getId()};
		return jdbcTemplate.update(updateSql, params);
	}
	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(RoleCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition() + " ORDER BY T.ID");
		return page.getPage(map, sb.toString(), cond, cond.getArray());// (不使用范型)
	}
	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	@Override
	public List<Role> queryAllObj(RoleCond cond) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition());
		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<Role>(Role.class));
	}
	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(RoleCond cond) {
		String countSql = "SELECT COUNT(T.ID) FROM SYS_ROLE T WHERE 1=1" + cond.getCondition();
		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);
	}
	/**
	 * 按条件查询不分页列表(不使用类型)
	 */
	@Override
	public List<Map<String, Object>> queryAllMap(RoleCond cond) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT U.ID,U.ORGANIZE_ID, U.LOGIN_ID, U.PASSWORD, U.USER_TYPE, U.SEX_STAT, U.NAME, U.E_MAIL,");
		sb.append(" U.ID_CARD, U.TEL, U.REMARK, U.ts, RU.USER_ID U_ID, O.NAME ORA_NAME");
		sb.append(" FROM SYS_USER U");
		sb.append(" LEFT JOIN SYS_DEPT O ON O.ID = U.ORGANIZE_ID");
		sb.append(" LEFT JOIN (SELECT USER_ID FROM SYS_ROLE_USER WHERE 1 = 1");
		sb.append(cond.getCondition() + ") RU  ON U.ID = RU.USER_ID");
		sb.append(" WHERE U.DR = 0 ORDER BY U.ID");
		return jdbcTemplate.queryForList(sb.toString(), cond.getArray());
	}
}
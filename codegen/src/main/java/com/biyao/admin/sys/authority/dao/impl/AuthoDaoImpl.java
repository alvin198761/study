package com.biyao.admin.sys.authority.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.authority.dao.IAuthoDao;
import com.biyao.admin.sys.authority.model.Autho;
import com.common.dao.BaseDao;
import com.common.util.DataUtil;
import com.common.util.UUIDGenerator;

/**
 * 资源授权Dao实现类
 * 
 * @author GZZ
 * @date 2014-02-15 12:59:49
 */
@Repository
public class AuthoDaoImpl extends BaseDao implements IAuthoDao {

	private String insertSql = "INSERT INTO SYS_AUTH (AUTHORITY_ID,RESOURCE_ID,RESOURCE_TYPE,VISITOR_ID,REMARK,CREATE_DATE) VALUES (?,?,?,?,?,?)";
	private String deleteSql = "DELETE FROM SYS_AUTH WHERE VISITOR_ID = ? AND RESOURCE_TYPE= ?";

	/**
	 * 批量插入权限表数据
	 */
	@Override
	public int[] insertBatch(final List<Autho> list) {
		return jdbcTemplate.batchUpdate(insertSql, new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				Autho sysAuthority = list.get(i);
				ps.setString(1, UUIDGenerator.getUUID());
				ps.setString(2, sysAuthority.getResource_id());
				ps.setString(3, sysAuthority.getResource_type());
				ps.setString(4, sysAuthority.getVisitor_id());
				ps.setString(5, "");
				ps.setTimestamp(6, new Timestamp(new java.util.Date().getTime()));
			}

			public int getBatchSize() {
				return list.size();
			}
		});
	}

	/**
	 * 按访问者ID删除权限记录
	 */
	@Override
	public int delete(Object[] obj) {
		return jdbcTemplate.update(deleteSql, obj);
	}

	/**
	 * 是否已授权
	 */
	@Override
	public int HasLimit(Object[] obj, String condition) {
		StringBuffer sbsql = new StringBuffer("SELECT COUNT(AUTHORITY_ID) FROM SYS_AUTH WHERE VISITOR_ID =? AND RESOURCE_ID =?");
		sbsql.append(condition);
		logger.debug(DataUtil.showSql(sbsql.toString(), obj));//显示SQL语句
		return jdbcTemplate.queryForObject(sbsql.toString(), obj, Integer.class);
	}

}

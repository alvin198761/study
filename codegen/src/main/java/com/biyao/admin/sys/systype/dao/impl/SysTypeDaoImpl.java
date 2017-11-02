package com.biyao.admin.sys.systype.dao.impl;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.systype.dao.ISysTypeDao;
import com.biyao.admin.sys.systype.model.SysType;
import com.biyao.admin.sys.systype.model.SysTypeCond;
import com.common.dao.BaseDao;
import com.common.util.DataUtil;
import com.common.util.UUIDGenerator;
import com.common.util.Util;

/**
 * @类说明:资产类型表Dao实现类
 *
 * @author:高振中
 * @date:2014-07-30 14:07:07
 */
@Repository
public class SysTypeDaoImpl extends BaseDao implements ISysTypeDao {
	private final String insertSql = "INSERT INTO SYS_TYPE (ID,NAME,PARENT_ID,IS_LEAF,TS,REMARK,ORDER_CODE) VALUES (?,?,?,?,?,?,?) ";
	private final String updateSql = "UPDATE SYS_TYPE SET NAME=?,PARENT_ID=?,IS_LEAF=?,TS=?,REMARK=?,ORDER_CODE=? WHERE ID=? ";
	private StringBuilder selectSql = new StringBuilder();

	/**
	 * @方法说明:构造方法,用于拼加SELECT-SQL及其它的初始化工作
	 */
	public SysTypeDaoImpl () {
		selectSql.append("SELECT T.ID,T.NAME,T.PARENT_ID,T.IS_LEAF,T.TS,T.REMARK,T.ORDER_CODE FROM SYS_TYPE T WHERE 1=1");
	}

	/**
	 * @方法说明:新增记录
	 */
	@Override
	public String insert(SysType vo) {
		//DataUtil.trim(vo);//去掉字符串型字段值前后的空格
		//Integer id=jdbcTemplate.queryForObject("SELECT SYS_TYPE_SEQ.NEXTVAL FROM DUAL", Integer.class);
		String id = UUIDGenerator.getUUID();
		Object[] params = new Object[]{id, vo.getName(),vo.getParent_id(),vo.getIs_leaf(),vo.getTs(),vo.getRemark(),vo.getOrder_code()};
		logger.debug(DataUtil.showSql(insertSql, params));//显示SQL语句
		jdbcTemplate.update(insertSql, params);
		return id;
	}

	/**
	 * @方法说明:物理删除记录(多条)
	 */
	@Override
	public int delete(String ids) {
		String updateStr = "DELETE FROM SYS_TYPE WHERE ID" + Util.ArrayToIn(ids);//数值型ID使用ArrayToInNum
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * @方法说明:按ID查找单个实体
	 */
	@Override
	public SysType findById(String id) {
		StringBuilder sb = new StringBuilder(selectSql);
		sb.append(" AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[]{id}, new BeanPropertyRowMapper<SysType>(SysType.class));
	}

	/**
	 * @方法说明:更新记录
	 */
	@Override
	public int update(SysType vo) {
		Object[] params = new Object[]{vo.getName(),vo.getParent_id(),vo.getIs_leaf(),vo.getTs(),vo.getRemark(),vo.getOrder_code(),vo.getId()};
		return jdbcTemplate.update(updateSql, params);
	}

	/**
	 * @方法说明:按条件查询分页列表-根据需要替换成自己的SQL
	 */
	@Override
	public Map<String, Object> queryList( SysTypeCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder(selectSql);
		sb.append(cond.getCondition() + " ORDER BY T.ID");
		logger.debug(DataUtil.showSql(sb.toString(), cond.getArray()));//显示SQL语句
		//return page.getPage(map, sb.toString(), curPage, pageSize, cond.getArray(), SysType.class);//(使用范型)
		return page.getPage(map, sb.toString(), cond, cond.getArray());//(不使用范型)
	}

	/**
	 * @方法说明:按条件查询不分页列表(使用范型)-根据需要替换成自己的SQL
	 */
	@Override
	public List<SysType> queryAllObj(SysTypeCond cond) {
		StringBuilder sb = new StringBuilder(selectSql);
		sb.append(cond.getCondition());
		//sb.append(" ORDER BY ORDER_CODE");
		//logger.debug(DataUtil.showSql(sb.toString(), cond));//显示SQL语句
		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<SysType>(SysType.class));
	}

	/**
	 * @方法说明:按条件查询记录个数
	 */
	@Override
	public int findCountByCond(SysTypeCond cond) {
		String countSql = "SELECT COUNT(T.ID) FROM SYS_TYPE T WHERE 1=1" + cond.getCondition();
		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);
	}

	/**
	 * @方法说明:逻辑删除记录(多条)
	 */
	@Override
	public int deleteLogic(String ids) {
		String updateStr = "UDATE SYS_TYPE SET DR = 1 WHERE ID" + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * @方法说明:修改叶子标志
	 */
	@Override
	public int updateLeaf(Object[] obj) {
		String sbsql = "UPDATE  SYS_TYPE SET IS_LEAF = 0 WHERE ID = ? ";
		return jdbcTemplate.update(sbsql, obj);
	}

	/**
	 * @方法说明:修改上级叶子标志
	 */
	@Override
	public int updateParent(Object[] obj) {
		int count;
		String sql = "SELECT COUNT(P.ID) FROM SYS_TYPE P WHERE P.PARENT_ID = ?";
		count = jdbcTemplate.queryForObject(sql, obj, Integer.class);
		count = count == 0 ? 1 : 0;
		sql = "UPDATE SYS_TYPE SET IS_LEAF = " + count + " WHERE ID = ?";
		return jdbcTemplate.update(sql, obj);
	}
}
package com.biyao.admin.sys.user.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.user.dao.IUserDao;
import com.biyao.admin.sys.user.model.User;
import com.biyao.admin.sys.user.model.UserCond;
import com.common.dao.BaseDao;
import com.common.util.DataUtil;
import com.common.util.UUIDGenerator;
import com.common.util.Util;

/**
 * 用户Dao实现类
 * 
 * @author GZZ
 * @date 2014-02-16 00:23:30
 */
@Repository
public class UserDaoImpl extends BaseDao implements IUserDao {

	private String insertSql = "INSERT INTO SYS_USER (ID,ORGANIZE_ID,LOGIN_ID,PASSWORD,USER_TYPE,SEX_STAT,NAME,E_MAIL,ID_CARD,TEL,REMARK,TS,DR) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	private String updateSql = "UPDATE SYS_USER SET ORGANIZE_ID=?,LOGIN_ID=?,password=?,USER_TYPE=?,SEX_STAT=?,NAME=?,E_MAIL=?,ID_CARD=?,TEL=?,REMARK=?,TS=? WHERE ID=? ";
	private StringBuilder selectSql = new StringBuilder();

	/**
	 * 构造方法用于拼加SELECT-SQL及其它的初始化工作
	 */
	public UserDaoImpl() {
		selectSql.append("SELECT T.ID,T.ORGANIZE_ID,T.LOGIN_ID,T.PASSWORD,T.USER_TYPE,T.SEX_STAT,T.NAME,");
		selectSql.append("  T.E_MAIL,T.ID_CARD,T.TEL,T.REMARK,T.TS,T.DR,O.NAME ORG_NAME");
		selectSql.append("  FROM SYS_USER T");
		selectSql.append("  JOIN SYS_dept O ON T.ORGANIZE_ID = O.ID");
		selectSql.append(" WHERE 1 = 1");
	}

	/**
	 * 新增
	 */
	@Override
	public int insert(User vo) {
		Object[] params = new Object[] { UUIDGenerator.getUUID(), vo.getOrganize_id(), vo.getLogin_id(), vo.getPassword(), vo.getUser_type(), vo.getSex_stat(), vo.getName(), vo.getE_mail(),
				vo.getId_card(), vo.getTel(), vo.getRemark(), vo.getTs(), vo.getDr() };
		logger.debug(DataUtil.showSql(insertSql, params));// 显示SQL语句
		return jdbcTemplate.update(insertSql, params);
	}

	/**
	 * 物理删除
	 */
	@Override
	public int delete(String ids) {
		String updateStr = "DELETE FROM SYS_USER WHERE ID" + Util.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * 按ID查找单个实体
	 */
	@Override
	public User findById(String id) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + " AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[] { id }, new BeanPropertyRowMapper<User>(User.class));
	}

	/**
	 * 更新
	 */
	@Override
	public int update(User vo) {
		Object[] params = new Object[] { vo.getOrganize_id(), vo.getLogin_id(), vo.getPassword(), vo.getUser_type(), vo.getSex_stat(), vo.getName(), vo.getE_mail(), vo.getId_card(), vo.getTel(),
				vo.getRemark(), vo.getTs(), vo.getId() };
		return jdbcTemplate.update(updateSql, params);
	}

	/**
	 * 重置密码
	 */
	@Override
	public int updatePas(User vo) {
		String sql = "UPDATE SYS_USER SET  password=?  WHERE ID=? ";
		Object[] params = new Object[] { vo.getPassword(), vo.getId() };
		//logger.debug(DataUtil.showSql(sql, params));//显示SQL语句
		return jdbcTemplate.update(sql, params);
	}

	/**
	 * 按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(UserCond cond, Map<String, Object> map) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition());
		return page.getPage(map, sb.toString(), cond, cond.getArray());// (不使用范型)
	}

	/**
	 * 按条件查询不分页列表(使用类型)
	 */
	@Override
	public List<User> queryAllObj(UserCond cond) {
		StringBuilder sb = new StringBuilder();
		sb.append(selectSql + cond.getCondition());
		// logger.debug(DataUtil.showSql(sb.toString(), cond.getArray()));
		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<User>(User.class));
	}

	/**
	 * 按条件查询记录个数
	 */
	@Override
	public int findCountByCond(UserCond cond) {
		String countSql = "SELECT COUNT(T.ID) FROM SYS_USER T WHERE 1=1" + cond.getCondition();
		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);
	}

}
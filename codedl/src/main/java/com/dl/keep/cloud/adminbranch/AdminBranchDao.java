package com.dl.keep.cloud.adminbranch;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import com.dl.keep.common.util.SqlUtil;
import com.dl.keep.webdata.common.jdbc.BaseDao;
import com.dl.keep.common.util.Page;

/**
 * @类说明:admin_branchDao实现类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
@Repository
public class AdminBranchDao extends BaseDao{
	private StringBuilder selectSql = new StringBuilder();

	/**
	 * @方法说明:构造方法,用于拼加SELECT-SQL及其它的初始化工作
	 **/
	public AdminBranchDao () {
		selectSql.append("SELECT T.ID,T.ADDRESS,T.BNAME,T.CITY,T.COUNTRY,T.HEAD,T.LAT,T.LNG,T.PHONE,T.PROVINCE,T.REG_DATE,T.STATUS,T.GID,T.MEMBER_NO FROM ADMIN_BRANCH T WHERE 1=1");
	}

	/**
	 * @方法说明:新增记录
	 **/
	public int insert(AdminBranch vo) {
		String sql = "INSERT INTO ADMIN_BRANCH (ADDRESS,BNAME,CITY,COUNTRY,HEAD,LAT,LNG,PHONE,PROVINCE,REG_DATE,STATUS,GID,MEMBER_NO) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		Object[] params ={vo.getAddress(),vo.getBname(),vo.getCity(),vo.getCountry(),vo.getHead(),vo.getLat(),vo.getLng(),vo.getPhone(),vo.getProvince(),vo.getReg_date(),vo.getStatus(),vo.getGid(),vo.getMember_no()};
		//logger.debug(SqlUtil.showSql(sql, params));//显示SQL语句
		return jdbcTemplate.update(sql, params);
	}

	/**
	 * @方法说明:物理删除记录(多条)
	 **/
	public int delete(String ids) {
		String updateStr = "DELETE FROM ADMIN_BRANCH WHERE ID" + SqlUtil.ArrayToIn(ids);//数值型ID使用ArrayToInNum
		return jdbcTemplate.update(updateStr);
	}

	/**
	 * @方法说明:按ID查找单个实体
	 **/
	public AdminBranch findById(String id) {
		StringBuilder sb = new StringBuilder(selectSql);
		sb.append(" AND T.ID=?");
		return jdbcTemplate.queryForObject(sb.toString(), new Object[]{id}, new BeanPropertyRowMapper<AdminBranch>(AdminBranch.class));
	}

	/**
	 * @方法说明:更新记录
	 **/
	public int update(AdminBranch vo) {
		String sql = "UPDATE ADMIN_BRANCH SET ADDRESS=?,BNAME=?,CITY=?,COUNTRY=?,HEAD=?,LAT=?,LNG=?,PHONE=?,PROVINCE=?,REG_DATE=?,STATUS=?,GID=?,MEMBER_NO=? WHERE ID=? ";
		Object[] params = {vo.getAddress(),vo.getBname(),vo.getCity(),vo.getCountry(),vo.getHead(),vo.getLat(),vo.getLng(),vo.getPhone(),vo.getProvince(),vo.getReg_date(),vo.getStatus(),vo.getGid(),vo.getMember_no(),vo.getId()};
		return jdbcTemplate.update(sql, params);
	}

	/**
	 * @方法说明:按条件查询分页列表-根据需要替换成自己的SQL
	 **/
	public Page<AdminBranch> queryPage(AdminBranchCond cond) {
		StringBuilder sb = new StringBuilder(selectSql);
		sb.append(cond.getCondition());
		//sb.append(" ORDER BY T.ID")//;
		//logger.debug(SqlUtil.showSql(sb.toString(), cond.getArray()));//显示SQL语句
		return queryPage(sb.toString(), cond, AdminBranch.class);//(使用范型)
	}

	/**
	 * @方法说明:按条件查询不分页列表(使用范型)-根据需要替换成自己的SQL
	 **/
	public List<AdminBranch> queryList(AdminBranchCond cond) {
		StringBuilder sb = new StringBuilder(selectSql);
		sb.append(cond.getCondition());
		return jdbcTemplate.query(sb.toString(), cond.getArray(), new BeanPropertyRowMapper<AdminBranch>(AdminBranch.class));
	}

	/**
	 * @方法说明:按条件查询记录个数
	 **/
	public int queryCount(AdminBranchCond cond) {
		String countSql = "SELECT COUNT(T.ID) FROM ADMIN_BRANCH T WHERE 1=1" + cond.getCondition();
		return jdbcTemplate.queryForObject(countSql, cond.getArray(), Integer.class);
	}

	/**
	 * @方法说明:逻辑删除记录(多条)
	 **/
	public int deleteLogic(String ids) {
		String updateStr = "UPDATE ADMIN_BRANCH SET deleteRemark = 1 WHERE ID" + SqlUtil.ArrayToIn(ids);
		return jdbcTemplate.update(updateStr);
	}
}
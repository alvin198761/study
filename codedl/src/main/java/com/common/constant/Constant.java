package com.common.constant;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dl.keep.sys.param.dao.IParamDao;
import com.dl.keep.sys.param.model.Param;
import com.dl.keep.sys.param.model.ParamCond;

@Component
/**
 * @功能描述 系统变量及初始化
 * @author gzz
 * @date 2014-02-15 11:09:23
 */
public class Constant {

	// 登录时放到Session中使用
	public static String LOGIN_USER = "LOGIN_USER"; // 用户登录信息，存放user对象
	public static Integer PAGE_SIZE = 15;// 每页记录个数
	public static String OUT_MSG = "登录已过期,请重新登录!";// 登录过期提示信息
	public static String DATABASE;// 数据库类型
	public static String DBUSER;// 数据库用户名

	@Autowired
	private IParamDao dao;// 系统参数DAO
	@Autowired
	private JdbcTemplate jdbcTemplate;// JDBC模板
	private Log logger = LogFactory.getLog(getClass());// 日志工具

	@PostConstruct
	/**
	 * @功能描述 系统变量及初始化
	 */
	public void init() {
		DatabaseMetaData dbMetaData;
		try {
			dbMetaData = jdbcTemplate.getDataSource().getConnection().getMetaData();
			DATABASE = dbMetaData.getDatabaseProductName();
			ResultSet rs = dbMetaData.getTables(null, null, null, null);
			rs.next();
			DBUSER = rs.getString(1);
		} catch (SQLException e) {
			logger.error("获取数据产品名称时出错");
			e.printStackTrace();
		}
		initPageSize();
	}

	/**
	 * @功能描述 每页记录数及初始化
	 */
	public void initPageSize() {
		ParamCond cond = new ParamCond();
		cond.setParam_key_c("PAGE_SIZE");
		List<Param> list = dao.queryAllObj(cond);
		Param param = list.get(0);
		if (!"".equals(param.getParam_value())) {
			PAGE_SIZE = Integer.valueOf(param.getParam_value());
			logger.info(PAGE_SIZE);
		}
	}
}

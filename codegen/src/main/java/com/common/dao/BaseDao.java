package com.common.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.common.page.Page;
/**
 * @功能描述:dao类公共类变量
 * @author gzz
 */
public class BaseDao {
	protected final Log logger = LogFactory.getLog(BaseDao.class);// 日志类
	@Autowired
	protected JdbcTemplate jdbcTemplate;// jdbc模版类
	@Autowired
	protected NamedParameterJdbcTemplate namedJdbcTemplate;// jdbc模版类
	@Autowired
	protected Page page;// 分页类
}
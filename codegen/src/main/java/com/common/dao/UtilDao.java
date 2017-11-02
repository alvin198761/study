package com.common.dao;

import java.io.File;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.param.model.Param;
import com.biyao.admin.sys.param.model.ParamCond;
import com.biyao.admin.sys.param.service.IParamService;
import com.common.constant.Constant;
import com.common.util.DataUtil;
import com.common.util.FileUtil;

@Repository
public class UtilDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private IParamService service;
	public final String NXET_FIRST_CODE = "001";// 每级第一个编码
	public final String NXET_CODE_FORMAT = "000";// 编码显示格式
	public final String FIRST_CODE = "0001";// 每级第一个编码
	public final String CODE_FORMAT = "0000";// 编码显示格式
	private Log logger = LogFactory.getLog(getClass());

	/**
	 * @author GZZ 功能: 构建树型编码
	 * @param tablename表名
	 * @param parent_code上级编码
	 * @return code total_code需要自己写=parent_code+code
	 */

	public String getCode(String tablename, String parent_code) {// 每次传参调用
		String nextcode = null;
		int len = parent_code.length() + 1;
		String substring = "substr";
		if (Constant.DATABASE.equals("Microsoft SQL Server")) {// 数断数据库类型
			substring = "substring";
		}
		String sql = "select max(" + substring + "(t.total_code," + len + ",3)) code from " + tablename + " t where t.total_code like '" + parent_code + "%' ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		String maxcode = null;
		Map<String, Object> map;
		if (null != list.get(0)) {
			map = list.get(0);
			maxcode = (String) map.get("code");
		}
		if (null == maxcode || "".equals(maxcode)) {
			nextcode = NXET_FIRST_CODE;
		} else {
			int nextnumber = Integer.parseInt(maxcode) + 1;
			DecimalFormat df = new DecimalFormat(NXET_CODE_FORMAT);
			nextcode = df.format(nextnumber);
		}
		return nextcode;
	}

	/**
	 * @author CRL
	 * @功能: 检测子表记录存在与否
	 * @param tableName表名数组
	 * @param ID记录主键
	 * @return 存在与否的信息
	 */
	public String checkId(String id, String[] tableName, String[] fidname) {
		StringBuffer tableStr = new StringBuffer("");
		for (int i = 0; i < tableName.length; i++) {
			StringBuffer sql = new StringBuffer("SELECT COUNT(*) FROM ");
			sql.append(tableName[i]);
			sql.append(" WHERE " + fidname[i] + "= ? ");
			int count = jdbcTemplate.queryForObject(sql.toString(), new Object[] { id }, Integer.class);
			if (0 != count) {
				tableStr.append(",");
				tableStr.append(tableName[i]);
				tableStr.append("的");
				tableStr.append(count);
				tableStr.append("条记录");
			}
		}
		String ts = tableStr.toString();
		if ("".equals(ts)) {
			return null;
		} else {
			tableStr.delete(0, 1);
		}
		return tableStr.toString();
	}

	/**
	 * @author GZZ
	 * @功能描述:拼加权限字符串
	 * @param resourceType资源类型
	 * @param userId用户ID
	 * @return 权限字符串
	 * @throws Exception
	 */
	public String getLimtCondition(String resourceType, String userId) throws Exception {
		StringBuffer Condition = new StringBuffer();// ID字符串
		StringBuffer limitStr = new StringBuffer();//
		// logger.debug(resourceType+userId);
		if (StringUtils.isNotEmpty(userId)) {// 如果userId不为空
			if (!userId.equals("1")) {// admin以外的用户
				StringBuffer sb = new StringBuffer();
				sb.append(" SELECT au.resource_id ");
				sb.append("  FROM sys_role_user ru ");
				sb.append("  JOIN sys_role r ON ru.role_id = r.id ");
				sb.append("  JOIN sys_user u ON ru.user_id = u.id ");
				sb.append("  JOIN sys_auth au ON au.visitor_id = r.id ");
				sb.append(" WHERE u.id = ?");
				sb.append("   AND au.resource_type = ?");
				logger.info(DataUtil.showSql(sb.toString(), new Object[] { userId, resourceType }));
				List<Map<String, Object>> list = jdbcTemplate.queryForList(sb.toString(), new Object[] { userId, resourceType });
				if (list.size() > 0) {
					limitStr = limitStr.append(" IN (");
					for (Map<String, Object> map : list) {
						Condition = Condition.append(",'" + map.get("resource_id") + "'");
					}
					Condition = Condition.delete(0, 1);
					limitStr.append(Condition);
					limitStr.append(") ");
				} else {
					limitStr = new StringBuffer(" AND 1=0 ");
				}
			}

		} else {
			limitStr = new StringBuffer(" AND 1=0 ");
			throw new Exception("用户ID为空,可能登录已过期或没有登录或者用户ID有误！");
		}

		return limitStr.toString();
	}

	/**
	 * 参数表按键找值
	 */
	public String findValue(String key) {
		String svalue = "";
		ParamCond cond = new ParamCond();
		cond.setParam_key_c(key);
		List<Param> list = service.queryAllObj(cond);
		if (null != list && list.size() > 0) {
			svalue = list.get(0).getParam_value();
		}
		return svalue;
	}

	/**
	 * @author GZZ
	 * @功能描述:按钮权限
	 * @param userId用户ID
	 * @return 权限字符串
	 * @throws Exception
	 */
	public boolean getButtonLimt(String userId, String key) throws Exception {
		boolean hasLimit = false;
		if (StringUtils.isNotEmpty(userId)) {// 如果userId不为空
			if (!userId.equals("1")) {// admin以外的用户
				StringBuilder sb = new StringBuilder();
				sb.append("SELECT count(au.resource_id) FROM sys_role_user ru");
				sb.append("  JOIN sys_role r ON ru.role_id = r.id");
				sb.append("  JOIN sys_user u ON ru.user_id = u.id");
				sb.append("  JOIN sys_auth au ON au.visitor_id = r.role_id");
				sb.append("  JOIN sys_func f ON f.func_id = au.resource_id");
				sb.append(" WHERE f.url =? AND u.user_id =? AND f.type = 'BUTTON'");
				int count = jdbcTemplate.queryForObject(sb.toString(), new Object[] { key, userId }, Integer.class);
				if (count > 0) {
					hasLimit = true;
				}
			}
		} else {
			throw new Exception("用户ID为空,可能登录已过期或没有登录或者用户ID有误！");
		}
		return hasLimit;
	}

	/**
	 * 跨平台路径处理方法
	 * 
	 * @param oldPath
	 * @return
	 */
	public String pathUtil(String oldPath) {
		String newPath = FileUtil.isWindows() ? findValue("img_url_windows") : findValue("img_url_linux");
		return newPath + oldPath.replaceAll("\\\\", "\\" + File.separator).replaceAll("/", "\\" + File.separator);
	}

}

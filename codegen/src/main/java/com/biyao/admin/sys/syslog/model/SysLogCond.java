package com.biyao.admin.sys.syslog.model;
import java.util.Date;

import com.common.condition.BaseCondition;
/**
 * 系统日志条件查询类
 * 
 * @author GZZ
 * @date 2014-02-15 23:24:48
 */
public class SysLogCond extends BaseCondition {
	@Override
	public void addCondition() {
		add(log_type_c, " AND T.LOG_TYPE LIKE ?", 3);
		add(position_c, " AND T.POSITION LIKE ?", 3);
		add(ip_c, " AND T.IP LIKE ?", 3);
		add(user_name_c, " AND T.USER_NAME LIKE ?", 3);
		add(detail_c, " AND T.DETAIL LIKE ?", 3);
		add(start_time, " AND OCCUR_TIME >= ?");
		add(end_time, " AND OCCUR_TIME <= ?");
	}
	private String log_type_c;// 类型
	private String position_c;// 发生位置
	private String ip_c;// IP地址
	private String user_name_c;// 操作用户
	private String detail_c;// 详细
	private String remark_c;// 备注
	private Date start_time;
	private Date end_time;

	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getLog_type_c() {
		return log_type_c;
	}
	public void setLog_type_c(String log_type_c) {
		this.log_type_c = log_type_c;
	}

	public String getPosition_c() {
		return position_c;
	}
	public void setPosition_c(String position_c) {
		this.position_c = position_c;
	}

	public String getIp_c() {
		return ip_c;
	}
	public void setIp_c(String ip_c) {
		this.ip_c = ip_c;
	}

	public String getUser_name_c() {
		return user_name_c;
	}
	public void setUser_name_c(String user_name_c) {
		this.user_name_c = user_name_c;
	}

	public String getDetail_c() {
		return detail_c;
	}
	public void setDetail_c(String detail_c) {
		this.detail_c = detail_c;
	}

	public String getRemark_c() {
		return remark_c;
	}
	public void setRemark_c(String remark_c) {
		this.remark_c = remark_c;
	}
}
package com.biyao.admin.sys.syslog.model;
import java.util.Date;
/**
 * 系统日志实体类
 *
 * @author GZZ
 * @date 2014-02-15 23:24:48
 */
public class SysLog {

	private String id;// 主键

	private String log_type;// 类型

	private String position;// 发生位置

	private String ip;// IP地址

	private String user_name;// 操作用户

	private String detail;// 详细

	private String remark;// 备注

	private String dr;// 删除标志

	private Date occur_time;// 发生时间

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getLog_type() {
		return log_type;
	}
	public void setLog_type(String log_type) {
		this.log_type = log_type;
	}

	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDr() {
		return dr;
	}
	public void setDr(String dr) {
		this.dr = dr;
	}

	public Date getOccur_time() {
		return occur_time;
	}
	public void setOccur_time(Date occur_time) {
		this.occur_time = occur_time;
	}
}
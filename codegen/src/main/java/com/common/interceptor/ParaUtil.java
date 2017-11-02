package com.common.interceptor;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.common.dao.UtilDao;
import com.common.md5.CryptUtil;
/**
 * @初始化用户参数
 * @author gzz
 */
@Component
public class ParaUtil {
	private final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private UtilDao dao;
	public static boolean is_out = true;// 默认是过期的
//	@PostConstruct
	//启动应用时执行一次检测
//	@Scheduled(cron = "0 24 1 * * ?")
	//@Scheduled(cron = "0/10 * * * * ?")
	// 每天的第一个小时的第24分钟的第零秒执行一次检测
	public void checkTimeOut() {// 注入后执行过期验证
		String cur_time = dao.findValue("time_second");

		byte[] c;
		try {
			c = CryptUtil.decryptBASE64(cur_time);
			cur_time = new String(c, "UTF-8");
		} catch (Exception e1) {
			logger.debug("初始化数据失败,有可能软件过期或配置错误!!");
			is_out = true;
			e1.printStackTrace();
		}

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date cur_date = new Date();
		Date innerdate = null;
		try {
			innerdate = df.parse(cur_time);
			is_out = cur_date.after(innerdate);// 当前日期在内部日期的前面
			logger.debug("初始化数据成功!");
		} catch (ParseException e) {
			logger.debug("初始化数据失败,有可能软件过期或配置错误!!");
			is_out = true;
			e.printStackTrace();
		}

	}

}

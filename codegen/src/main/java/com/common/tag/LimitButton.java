package com.common.tag;
import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;

import com.biyao.admin.sys.user.model.User;
import com.common.constant.Constant;
import com.common.dao.UtilDao;
import com.common.util.SpringContextUtil;
/**
 * 权限按钮标签
 * 
 * @author GZZ
 */
public class LimitButton extends TagSupport {
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	private final Log logger = LogFactory.getLog(getClass());
	private String key;
	public int doEndTag() {
		String htmlstr = " disabled ";
		ApplicationContext ac = SpringContextUtil.getApplicationContext();
		UtilDao utildao = ac.getBean(UtilDao.class);
		HttpSession session = pageContext.getSession();
		User user = (User) session.getAttribute(Constant.LOGIN_USER);
		try {
			if (null != user && utildao.getButtonLimt(user.getId(), key)) {
				htmlstr = "";
			}
			pageContext.getOut().print(htmlstr);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 6;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
}

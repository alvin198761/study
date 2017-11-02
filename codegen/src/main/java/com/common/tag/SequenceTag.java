package com.common.tag;

import java.io.IOException;

import javax.servlet.jsp.tagext.TagSupport;

import com.common.constant.Constant;

/**
 * 自定义记录序号标签
 * 
 * @author GZZ
 */
public class SequenceTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	int index;
	public SequenceTag() {
	}
	public int doEndTag() {
		int current_page = 0;
		if (null != pageContext.getRequest().getAttribute("curPage")) {
			current_page = new Integer(pageContext.getRequest().getAttribute("curPage").toString());
		}
		int page_size = Integer.valueOf(Constant.PAGE_SIZE);
		if (null != pageContext.getRequest().getAttribute("rows")) {
			page_size = new Integer(pageContext.getRequest().getAttribute("rows").toString());
		}
		try {
			pageContext.getOut().print((current_page - 1) * page_size + index);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 6;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}

}

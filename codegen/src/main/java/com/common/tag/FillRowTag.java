package com.common.tag;

import java.io.IOException;

import javax.servlet.jsp.tagext.TagSupport;

import com.common.constant.Constant;

/**
 * 补充表格行数标签定义
 * 
 * @author GZZ
 * @2012-08-01
 */
public class FillRowTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	private int recordNumber;
	private int tdNumber;
	public int doEndTag() {
		StringBuilder sb = new StringBuilder();
		int page_size = Integer.valueOf(Constant.PAGE_SIZE);
		if (recordNumber < page_size) {
			for (int i = 0; i < page_size - recordNumber; i++) {
				sb.append("<tr>");
				for (int j = 0; j < tdNumber; j++) {
					sb.append("<td></td>");
				}
				sb.append("</tr>");
			}
		}
		try {
			pageContext.getOut().print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 6;
	}
	public int getRecordNumber() {
		return recordNumber;
	}
	public void setRecordNumber(int recordNumber) {
		this.recordNumber = recordNumber;
	}
	public int getTdNumber() {
		return tdNumber;
	}
	public void setTdNumber(int tdNumber) {
		this.tdNumber = tdNumber;
	}

}

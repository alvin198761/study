package com.codegen.mvc.dao;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.dl.keep.webdata.common.jdbc.BaseDao;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:32:55
 * @功能描述:代码生成器基本DAO类
 */
public abstract class CodeDao extends BaseDao {

	/**
	 * @date:2015年1月19日下午4:05:09
	 * @功能描述: 替换掉注释中的回车换行
	 */
	protected List<Field> replaceComments(List<Field> list) {
		for (Field field : list) {
			String comments = field.getComments();
			field.setComments(comments.replace("\r\n", ""));
		}
		return list;
	}
}

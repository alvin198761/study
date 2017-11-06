package com.codegen.mvc.dao;

import java.util.List;

import com.codegen.mvc.model.Field;
import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:37:44
 * @功能描述:代码生成器数据访问接口类
 */
public interface IDao {
	/**
	 * @功能描述: 查询表名列表
	 */
	public List<Table> queryTableList(InitPara para);

	/**
	 * @功能描述: 查询字段名列表
	 */
	public List<Field> queryColumnList(String tablename);
}

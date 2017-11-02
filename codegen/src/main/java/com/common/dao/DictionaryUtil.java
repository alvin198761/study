package com.common.dao;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.biyao.admin.sys.dict.model.Dict;
import com.biyao.admin.sys.dict.model.DictCond;
import com.biyao.admin.sys.dict.service.IDictService;

@Repository
public class DictionaryUtil {
	@Autowired
	private IDictService service;
	static Log logger = LogFactory.getLog(DictionaryUtil.class);

	/**
	 * 功能: 构建下拉框参照Map
	 * 
	 * @param typeCode
	 *            :字典类型关键字
	 * @param addBlank
	 *            :是否填加空选项
	 * @return hasmap
	 * @author 高振中
	 */
	public LinkedHashMap<String, Object> getSelect(String typeCode, boolean addBlank) {
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		if (addBlank) {
			map.put(null, "--请选择--");
		}
		/*
		 * DictCond cond = new DictCond(); cond.setType_code_c(typeCode); for (Dict vo : service.queryAllObj(cond)) {
		 */

		for (Dict vo : service.queryAllObj(new DictCond(new Object[][] { { "type_code_c", typeCode } }))) {
			map.put(vo.getData_key(), vo.getData_value());
		}
		return map;
	}

	/**
	 * 功能: 构建下拉框参照Map
	 * 
	 * @param typeCode
	 *            :字典类型关键字
	 * @return hasmap
	 * @author 高振中
	 */
	public LinkedHashMap<String, Object> getSelect(String typeCode) {
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		/*
		 * DictCond cond = new DictCond(); cond.setType_code_c(typeCode); for (Dict vo : service.queryAllObj(cond)) {
		 */

		for (Dict vo : service.queryAllObj(new DictCond(new Object[][] { { "type_code_c", typeCode } }))) {
			map.put(vo.getData_key(), vo.getData_value());
		}
		return map;
	}

	/**
	 * 按类型与关键字查找对象
	 */
	public Dict findDict(Integer typecode, Integer datakey) {
		Dict dict = null;
		List<Dict> list = service.queryAllObj(new DictCond(new Object[][] { { "type_code_c", typecode }, { "data_key_c", datakey } }));
		if (list.size() > 0) {
			dict = list.get(0);
		}
		return dict;
	}

	/**
	 * 按类型与关键字查找对象
	 */
	public String findDictValue(Integer typecode, Integer datakey) {
		return findDict(typecode, datakey).getData_value();
	}

	public static void main(String[] args) {
		String mm = "123456";
		logger.debug(mm.substring(0, mm.length() - 1));
	}
}

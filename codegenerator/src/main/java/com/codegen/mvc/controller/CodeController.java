package com.codegen.mvc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegen.mvc.model.InitPara;
import com.codegen.mvc.model.Table;
import com.codegen.mvc.service.BaseService;
import com.codegen.mvc.service.IService;
import com.codegen.mvc.service.ServiceAdapter;

/**
 * @author gzz_gzz@163.com
 * @date 2015年3月27日下午2:12:42
 * @功能描述:代码生成器控制器类
 */
@Controller
@RequestMapping("/code")
public class CodeController {

	private IService service;// 生成器业务罗辑接口
	@Autowired
	private BaseService baseService;// 生成器基本业务罗辑
	@SuppressWarnings("unused")
	private final Log logger = LogFactory.getLog(getClass());// 日志
	@Autowired
	private ServiceAdapter serviceAdapter;// 业层适配类

	/**
	 * @功能描述: 查询数据库中表名列表
	 */
	@RequestMapping("/list")
	public String queryTableList(Map<String, Object> map, @ModelAttribute("para") InitPara para, HttpServletRequest request) {
		List<Table> list = baseService.queryTableList(para);
		map.put("dataList", list);
		map.put("ok", "ok");
		return "/sys/code/gencodelist";
	}

	/**
	 * @功能描述: 查询表中字段列表
	 */
	@RequestMapping("/listclo")
	public String qyertColumnList(Map<String, Object> map, @RequestParam String tname) {
		map.put("dataList", baseService.queryColumnList(tname));
		return "/sys/code/setField";
	}

	/**
	 * @功能描述: 生成代码
	 */
	@RequestMapping("/gen")
	public String genCode(Map<String, Object> map, @ModelAttribute("para") InitPara para) {
		service = serviceAdapter.getService(para.getCodeType());
		int num = -1;
		String color = "red";
		String msg = "生成失败，文件已经存在,请先备份代码，删除后重新生成!";
		try {
			num = service.gencode(para);
			color = "blue";
			msg = "代码生成成功,请刷新当前工程!";
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("ok", num);
		map.put("color", color);
		map.put("msg", msg);
		return "/sys/code/result";
	}
}

package com.biyao.admin.sys.syslog.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.biyao.admin.sys.syslog.model.SysLogCond;
import com.biyao.admin.sys.syslog.service.ISysLogService;
/**
 * 系统日志控制器类
 * 
 * @author GZZ
 * @date 2014-02-15 23:24:48
 */
@Controller
@RequestMapping("/syslog")
public class SysLogController {
	@Autowired
	private ISysLogService service;
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public String delete(Map<String, Object> map, @RequestParam String id) {
		service.delete(id);
		return "redirect:/syslog/list";
	}
	/**
	 * 按条件查询分页列表
	 */
	@RequestMapping("/list")
	public String queryList(Map<String, Object> map, @ModelAttribute("cond") SysLogCond cond ) {
		service.queryList( cond, map);
		return "/sys/syslog/list";
	}
	/**
	 * 日期属性编辑器
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// true允许为空
	}
}
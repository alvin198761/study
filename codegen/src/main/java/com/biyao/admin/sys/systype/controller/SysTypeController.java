package com.biyao.admin.sys.systype.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biyao.admin.sys.systype.model.SysType;
import com.biyao.admin.sys.systype.model.SysTypeCond;
import com.biyao.admin.sys.systype.service.ISysTypeService;
import com.common.util.Util;

/**
 * @类说明:资产类型表控制器类
 *
 * @author:高振中
 * @date:2014-07-30 14:07:07
 */
@Controller
@RequestMapping("/systype")
public class SysTypeController {
	@SuppressWarnings("unused")
	private final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private ISysTypeService service; // 资产类型表Service

	/**
	 * @方法说明:生成树型XML
	 */
	@RequestMapping("/tree")
	@ResponseBody
	public void showTree(@RequestParam String id, @RequestParam(required = false) String selectID, @RequestParam(required = false) String type,
			HttpServletResponse response) {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("tree");// tree
		root.addAttribute("id", "0");
		Element node = root.addElement("item");// root
		SysType systype = service.findById(id);
		node.addAttribute("id", id).addAttribute("text", systype.getName()).addAttribute("open", "1").addAttribute("call", "1").addAttribute("select", "1");
		if (("radio").equals(type)) {
			root.addAttribute(type, "0");
			node.addAttribute(type, "0");
		}
		SysTypeCond cond = new SysTypeCond();
		cond.setParent_id_c(id);
		// cond.setType_c(ftype);
		service.getSonElement(node, type, cond);
		if (StringUtils.isNotEmpty(selectID)) {// 反回页面时选中指定结点
			Element el = (Element) document.selectSingleNode("//item[@id='" + selectID + "']");
			el.addAttribute("select", "1").addAttribute("call", "1");// 指定打开并选中的结点,执行本结点对应的click方法
		}
		Util.writeXml(response, document);
	}

	/**
	 * @方法说明:转到树型展示页面
	 */
	@RequestMapping("/totree")
	public String toMaintain(@RequestParam(required = false) String id, Map<String, Object> map) {
		if (StringUtils.isNotEmpty(id)) {
			map.put("id", id);
		}
		return "/sys/systype/tree";
	}

	/**
	 * @方法说明:跳转到新增页面
	 */
	@RequestMapping("/toAdd")
	public String toAdd(Map<String, Object> map, @ModelAttribute("systype") SysType systype, String id) {
		systype.setParent_id(id);
		systype.setIs_leaf(1);
		return "/sys/systype/insert";
	}

	/**
	 * @方法说明:新增记录
	 */
	@RequestMapping("/insert")
	public void Add(Map<String, Object> map, @ModelAttribute("systype") SysType systype, BindingResult result, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String id = service.insert(systype);
		response.getWriter().append(Util.writeJS("/systype/totree?id=" + id, request)).flush();
	}

	/**
	 * @方法说明:删除记录(多条)
	 */
	@RequestMapping("/delete")
	public void delete(Map<String, Object> map, @RequestParam String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid = service.delete(id);
		response.getWriter().append(Util.writeJS("/systype/totree?id=" + pid, request)).flush();
	}

	/**
	 * @方法说明:跳转到修改页面
	 */
	@RequestMapping("/toUpdate")
	public String toUpdate(Map<String, Object> map, @RequestParam String id) {
		map.put("systype", service.findById(id));
		return "/sys/systype/update";
	}

	/**
	 * @方法说明:修改记录
	 */
	@RequestMapping("/update")
	public void update(Map<String, Object> map, @ModelAttribute("systype") SysType systype, BindingResult result, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String id = systype.getId();
		service.update(systype);
		response.getWriter().append(Util.writeJS("/systype/totree?id=" + id, request)).flush();
	}

	/**
	 * @方法说明:跳转到详细页面
	 */
	@RequestMapping("/detail")
	public String detail(Map<String, Object> map, @RequestParam String id) {
		map.put("systype", service.findById(id));
		return "/sys/systype/detail";
	}

	/**
	 * @方法说明:按条件查询分页列表页面
	 */
	@RequestMapping("/list")
	public String queryList(Map<String, Object> map, @ModelAttribute("cond") SysTypeCond cond, String id) {
		cond.setParent_id_c(id);
		service.queryList(cond, map);
		return "/sys/systype/list";
	}

	/**
	 * @方法说明:日期属性编辑器(新增/修改/查询条件中String自动转换成Date)
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// true允许为空
	}

	/**
	 * @方法说明:参照选择页
	 */
	@RequestMapping("/ref")
	public String queryRef(Map<String, Object> map, @ModelAttribute("cond") SysTypeCond cond) {
		return "/sys/systype/ref";
	}

	/**
	 * @方法说明:简单列表;带查询,无增删改,分页可选
	 */
	@RequestMapping("/listSimple")
	public String queryListSimple(Map<String, Object> map, @ModelAttribute("cond") SysTypeCond cond) {
		map.put("dataList", service.queryAllObj(cond));// 不分页
		return "/sys/systype/listSimple";
	}
}
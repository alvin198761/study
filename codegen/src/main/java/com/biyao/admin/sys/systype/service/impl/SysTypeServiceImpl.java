package com.biyao.admin.sys.systype.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.dom4j.Element;

import com.biyao.admin.sys.systype.dao.ISysTypeDao;
import com.biyao.admin.sys.systype.model.SysType;
import com.biyao.admin.sys.systype.model.SysTypeCond;
import com.biyao.admin.sys.systype.service.ISysTypeService;

/**
 * @类说明:资产类型表Service实现类
 *
 * @author:高振中
 * @date:2014-07-30 14:07:07
 */
@Service
public class SysTypeServiceImpl implements ISysTypeService {
	@SuppressWarnings("unused")
	private Log logger = LogFactory.getLog(getClass());
	@Autowired
	private ISysTypeDao dao; // 资产类型表Dao

	/**
	 * @方法说明:查找全部子结点(递规)
	 */
	@Override
	public void getSonElement(Element node, String type, SysTypeCond cond) {
		List<SysType> chlist = dao.queryAllObj(cond);
		for (SysType systype : chlist) {
			Element nodeSon = node.addElement("item");
			nodeSon.addAttribute("id", systype.getId()).addAttribute("text", systype.getName());
			// Element userdata = nodeSon.addElement("userdata");
			// userdata.addAttribute("name", "data01").setText(systype.getUrl()
			// != null ? systype.getUrl() : "NO");
			// 自定义结点图标
			// nodeSon.addAttribute("im0", "folderClosed.gif");// 非叶子结点关闭图标
			// nodeSon.addAttribute("im1", "folderOpen.gif");// 非叶子结点打开图标
			// nodeSon.addAttribute("im2", "folderClosed.gif");// 叶子结点图标
			if (("radio").equals(type)) {
				nodeSon.addAttribute(type, "0");
			}
			if (systype.getIs_leaf() != 1) {// 不是叶子结点,继续查找子结点
				cond.setParent_id_c(systype.getId());
				getSonElement(nodeSon, type, cond);
			}
		}
	}

	/**
	 * @方法说明:新增记录
	 */
	@Override
	public String insert(SysType systype) {
		dao.updateLeaf(new Object[] { systype.getParent_id() });
		systype.setIs_leaf(1);
		systype.setTs(new Date());
		return dao.insert(systype);
	}

	/**
	 * @方法说明:删除记录(多条)
	 */
	@Override
	public String delete(String id) {
		SysType systype = dao.findById(id);
		String pid = systype.getParent_id();
		dao.delete(id);
		dao.updateParent(new Object[] { pid });
		return pid;
	}

	/**
	 * @方法说明:按ID查找单个实体
	 */
	@Override
	public SysType findById(String id) {
		return dao.findById(id);
	}

	/**
	 * @方法说明:更新记录
	 */
	@Override
	public int update(SysType systype) {
		systype.setTs(new Date());
		return dao.update(systype);
	}

	/**
	 * @方法说明:按条件查询分页列表
	 */
	@Override
	public Map<String, Object> queryList(SysTypeCond cond, Map<String, Object> map) {
		return dao.queryList(cond, map);
	}

	/**
	 * @方法说明:按条件查询不分页列表(使用范型)
	 */
	@Override
	public List<SysType> queryAllObj(SysTypeCond cond) {
		return dao.queryAllObj(cond);
	}

	/**
	 * @方法说明:按条件查询记录个数
	 */
	@Override
	public int findCountByCond(SysTypeCond cond) {
		return dao.findCountByCond(cond);
	}
}
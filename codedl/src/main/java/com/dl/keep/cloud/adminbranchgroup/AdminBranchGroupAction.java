package com.dl.keep.cloud.adminbranchgroup;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.dl.keep.common.util.Page;

/**
 * @类说明:admin_branch_group控制器类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
@RestController
@RequestMapping("/adminbranchgroup")
public class AdminBranchGroupAction {
	@SuppressWarnings("unused")
	private final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private AdminBranchGroupBus bus; //admin_branch_groupService

	/**
	 * @方法说明:新增记录
	 **/
	@RequestMapping("/insert")
	public Integer insert(@RequestBody AdminBranchGroup adminbranchgroup) {
		return bus.insert(adminbranchgroup);
	}

	/**
	 * @方法说明:删除记录(多条)
	 **/
	@RequestMapping("/delete")
	public Integer delete(@RequestParam("id") String id) {
		return bus.delete(id);
	}

	/**
	 * @方法说明:修改记录
	 **/
	@RequestMapping("/update")
	public Integer update(@RequestBody AdminBranchGroup adminbranchgroup) {
		return bus.update(adminbranchgroup);
	}

	/**
	 * @方法说明:按条件查询分页列表页面
	 **/
	@RequestMapping("/queryPage")
	public Page<AdminBranchGroup> queryPage(@RequestBody AdminBranchGroupCond cond ){
		return bus.queryPage(cond);
	}

	/**
	 * @方法说明:按条件查询列表页面
	 **/
	@RequestMapping("/queryList")
	public List<AdminBranchGroup> queryList(@RequestBody AdminBranchGroupCond cond ){
		return bus.queryList(cond);
	}

	/**
	 * @方法说明:跳转到详细页面
	 **/
	@RequestMapping("/findById")
	public AdminBranchGroup findById(@RequestParam("id") String id) {
		return bus.findById(id);
	}
}
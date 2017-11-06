package com.dl.keep.cloud.adminbranch;
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
 * @类说明:admin_branch控制器类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
@RestController
@RequestMapping("/adminbranch")
public class AdminBranchAction {
	@SuppressWarnings("unused")
	private final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private AdminBranchBus bus; //admin_branchService

	/**
	 * @方法说明:新增记录
	 **/
	@RequestMapping("/insert")
	public Integer insert(@RequestBody AdminBranch adminbranch) {
		return bus.insert(adminbranch);
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
	public Integer update(@RequestBody AdminBranch adminbranch) {
		return bus.update(adminbranch);
	}

	/**
	 * @方法说明:按条件查询分页列表页面
	 **/
	@RequestMapping("/queryPage")
	public Page<AdminBranch> queryPage(@RequestBody AdminBranchCond cond ){
		return bus.queryPage(cond);
	}

	/**
	 * @方法说明:按条件查询列表页面
	 **/
	@RequestMapping("/queryList")
	public List<AdminBranch> queryList(@RequestBody AdminBranchCond cond ){
		return bus.queryList(cond);
	}

	/**
	 * @方法说明:跳转到详细页面
	 **/
	@RequestMapping("/findById")
	public AdminBranch findById(@RequestParam("id") String id) {
		return bus.findById(id);
	}
}
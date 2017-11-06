package com.dl.keep.cloud.adminbranchgroup;
import java.util.List;
//import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.dl.keep.common.util.Page;

/**
 * @类说明:admin_branch_group客户端类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
//@FeignClient("dl-keep-web-data/adminbranchgroup")
@RequestMapping("/adminbranchgroup")
public interface IAdminBranchGroupClient {

	/**
	 * @方法说明:新增记录
	 **/
	@RequestMapping("/insert")
	Integer insert(@RequestBody AdminBranchGroup adminbranchgroup);

	/**
	 * @方法说明:删除记录(多条)
	 **/
	@RequestMapping("/delete")
	Integer delete(@RequestParam("id") String id);

	/**
	 * @方法说明:修改记录
	 **/
	@RequestMapping("/update")
	Integer update(@RequestBody AdminBranchGroup adminbranchgroup);

	/**
	 * @方法说明:按条件查询分页列表页面
	 **/
	@RequestMapping("/queryPage")
	Page<AdminBranchGroup> queryPage(@RequestBody AdminBranchGroupCond cond );

	/**
	 * @方法说明:按条件查询列表页面
	 **/
	@RequestMapping("/queryList")
	List<AdminBranchGroup> queryList(@RequestBody AdminBranchGroupCond cond );

	/**
	 * @方法说明:按条件查询记录个数
	 **/
	@RequestMapping("/queryCount")
	public Integer queryCount(@RequestBody AdminBranchGroupCond cond );

	/**
	 * @方法说明:跳转到详细页面
	 **/
	@RequestMapping("/findById")
	AdminBranchGroup findById(@RequestParam("id") String id);
}
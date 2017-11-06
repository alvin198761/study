package com.dl.keep.cloud.adminbranch;
import java.util.List;
//import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.dl.keep.common.util.Page;

/**
 * @类说明:admin_branch客户端类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
//@FeignClient("dl-keep-web-data/adminbranch")
@RequestMapping("/adminbranch")
public interface IAdminBranchClient {

	/**
	 * @方法说明:新增记录
	 **/
	@RequestMapping("/insert")
	Integer insert(@RequestBody AdminBranch adminbranch);

	/**
	 * @方法说明:删除记录(多条)
	 **/
	@RequestMapping("/delete")
	Integer delete(@RequestParam("id") String id);

	/**
	 * @方法说明:修改记录
	 **/
	@RequestMapping("/update")
	Integer update(@RequestBody AdminBranch adminbranch);

	/**
	 * @方法说明:按条件查询分页列表页面
	 **/
	@RequestMapping("/queryPage")
	Page<AdminBranch> queryPage(@RequestBody AdminBranchCond cond );

	/**
	 * @方法说明:按条件查询列表页面
	 **/
	@RequestMapping("/queryList")
	List<AdminBranch> queryList(@RequestBody AdminBranchCond cond );

	/**
	 * @方法说明:按条件查询记录个数
	 **/
	@RequestMapping("/queryCount")
	public Integer queryCount(@RequestBody AdminBranchCond cond );

	/**
	 * @方法说明:跳转到详细页面
	 **/
	@RequestMapping("/findById")
	AdminBranch findById(@RequestParam("id") String id);
}
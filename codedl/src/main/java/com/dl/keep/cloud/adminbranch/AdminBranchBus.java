package com.dl.keep.cloud.adminbranch;
import java.util.List;
import com.dl.keep.common.util.Page;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @类说明:admin_branchService实现类
 * @author:gzz_gzz@163.com
 * @date:2017-11-06 19:58:00
 **/
@Service
public class AdminBranchBus {
	@SuppressWarnings("unused")
	private Log logger = LogFactory.getLog(getClass());
	@Autowired
	private IAdminBranchClient client; //admin_branchDao

	/**
	 * @方法说明:新增记录
	 **/
	public int insert(AdminBranch adminbranch) {
		return client.insert(adminbranch);
	}

	/**
	 * @方法说明:删除记录(多条)
	 **/
	public int delete(String id) {
		//return dao.deleteLogic(id);//逻辑删除
		return client.delete(id);//物理删除
	}

	/**
	 * @方法说明:按ID查找单个实体
	 **/
	public AdminBranch findById(String id) {
		return client.findById(id);
	}

	/**
	 * @方法说明:更新记录
	 **/
	public int update(AdminBranch adminbranch) {
		return client.update(adminbranch);
	}

	/**
	 * @方法说明:按条件查询分页列表
	 **/
	public Page<AdminBranch> queryPage(AdminBranchCond cond) {
		return client.queryPage(cond);
	}

	/**
	 * @方法说明:按条件查询不分页列表(使用范型)
	 **/
	public List<AdminBranch> queryList(AdminBranchCond cond) {
		return client.queryList(cond);
	}

	/**
	 * @方法说明:按条件查询记录个数
	 **/
	public int queryCount(AdminBranchCond cond) {
		return client.queryCount(cond);
	}
}
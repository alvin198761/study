package TestJdbc;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.biyao.admin.sys.sysdept.model.SysDept;
import com.biyao.admin.sys.sysdept.service.ISysDeptService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class TestOrg {
	private final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private ISysDeptService service;

	// @Test
	public void testOrg() {
		List<SysDept> queryList = service.queryAllObj(null);
		logger.debug("---------------" + queryList.size());
		int i = 0;
		for (SysDept so : queryList) {
			logger.debug("-------" + (i++) + so.getName() + so.getIs_leaf() + so.getParent_id());
		}
	}

}

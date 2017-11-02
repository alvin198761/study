package TestJdbc;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.common.dao.DictionaryUtil;
import com.common.dao.UtilDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class TestUtil {
	private final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private UtilDao utilDao;
	@Autowired
	private DictionaryUtil dutil;

	// @Test
	public void findlist() {

		String str1 = null;
		String str2 = null;
		try {
			str1 = utilDao.getLimtCondition("Menu", "101");
			str2 = utilDao.getLimtCondition("Area", "101");
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.debug("功能权限：" + str1);
		logger.debug("数据权限：" + str2);
	}

}

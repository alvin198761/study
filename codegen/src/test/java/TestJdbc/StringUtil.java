package TestJdbc;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;

public class StringUtil {
	private final Log logger = LogFactory.getLog(getClass());

	@Test
	public void findlist() {
		logger.debug("---" + StringUtils.trimToEmpty("saljfskadfj") + "---");
	}
}

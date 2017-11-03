package com.example.demo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {
	private Log logger = LogFactory.getLog(getClass());// 定义日志工具
	@Autowired
	private RedisTemplate<String, String> redisTemplate;// 注入redis模板

	@Test
	public void queryBanners() {
		ValueOperations<String, String> ops = redisTemplate.opsForValue();
		ops.set("new", "testtest");
		logger.info(ops.get("new"));

	}

}

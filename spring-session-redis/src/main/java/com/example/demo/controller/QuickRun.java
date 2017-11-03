package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QuickRun {

	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/put")
	public Map<String, Object> firstResp() {
		Map<String, Object> map = new HashMap<>();
		String id = session.getId();
		map.put("sessionId", id);
		session.setAttribute("sessionId", id);
		return map;
	}

	@RequestMapping(value = "/get")
	public Object sessions() {
		Map<String, Object> map = new HashMap<>();
		map.put("sessionId", session.getAttribute("sessionId"));
		return map;
	}
}

package com.biyao.ws;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.common.dao.UtilDao;

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)  
public class Hello extends SpringBeanAutowiringSupport{ 
	@Autowired
	private UtilDao dao;
	@WebMethod
	public String sayHello(String name) {
		String size = dao.findValue("PAGE_SIZE");
		System.out.println("hello" + name + size);
		return "hello" + name;
	}
	@WebMethod
	public String sayHello1(String name) {
		System.out.println("hello" + name);
		return "hello" + name;
	}
	@WebMethod
	public String sayHello2(String name) {
		System.out.println("hello" + name);
		return "hello" + name;
	}
}

/**
 * wsimport -keep -p client -verbose http://localhost:7070/Ebay?wsdl
 */

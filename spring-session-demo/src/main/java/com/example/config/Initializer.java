package com.example.config;

import org.springframework.session.web.context.AbstractHttpSessionApplicationInitializer;

public class Initializer extends AbstractHttpSessionApplicationInitializer {
	
	public Initializer() {
		System.out.println("Initializer");
	}

}
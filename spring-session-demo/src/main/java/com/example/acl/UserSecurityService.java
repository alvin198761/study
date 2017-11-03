package com.example.acl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

 
@Component
public class UserSecurityService implements UserDetailsService {
	
	private Log logger =LogFactory.getLog(getClass());

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info(username);
		return null;
	}
  
}

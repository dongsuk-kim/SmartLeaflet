package com.covely.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@GetMapping("/accessError")
	public void accessError(Authentication auth, Model model) {
		
		log.error(auth.getCredentials());
		log.error(auth.getAuthorities());
		log.info("auth:"+auth);
		
	}
	
	@GetMapping("/customLogin")
	public void customLogin() {
		
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
	
	
}

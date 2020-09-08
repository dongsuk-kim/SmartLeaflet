package com.covely.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TestController {
	
	// @PathVariable을 연습하기 위한 예제임.
	@RequestMapping("/page/{var}")
	public String page(@PathVariable("var") String var){
		
		log.info("getList.............................................");
	    String returnUrl = "";
	    if(var.equals("one")) {
	        returnUrl = "page1";
	    } else if(var.equals("two")) {
	        returnUrl = "page2";
	    }
	    return returnUrl;
	}
	
	
	@RequestMapping("/{key1}")
	public void resultByPath(@PathVariable String key1){
		
		if(key1 == "a") {
			System.out.println("key1:: " + key1);
		}
		

	}

	
}

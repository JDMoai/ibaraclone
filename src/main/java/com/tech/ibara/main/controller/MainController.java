package com.tech.ibara.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		
		return "main/main";
	}
	
	@RequestMapping("mainSearchView")
	public String mainSearchView() {
		
		return "main/mainSearchView";
	}
}
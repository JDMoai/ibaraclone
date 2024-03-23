package com.tech.ibara.modal.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MController {

	@RequestMapping(value = "modal/mMain", method = RequestMethod.GET)
	public String mMain(Model model) {
		
		return "modal/mMain";
	}
	@RequestMapping(value = "modal/mSize", method = RequestMethod.GET)
	public String mSize(Model model) {
		
		return "modal/mSize";
	}
}

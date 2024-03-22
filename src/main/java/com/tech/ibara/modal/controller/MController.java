package com.tech.ibara.modal.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MController {

	@RequestMapping(value = "/modal", method = RequestMethod.GET)
	public String modal(Model model) {
		
		return "/modal/mmain";
	}

}

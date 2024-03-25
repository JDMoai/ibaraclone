package com.tech.ibara.modal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class ModalController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/modal/mMain", method = RequestMethod.GET)
	public String mMain(Model model) {
		
		return "modal/mMain";
	}
	@RequestMapping("/modal/mStandard")
	public String mStandard(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		return "modal/mStandard";
	}
//	@RequestMapping("/modal/mStandard")
//	public String mStandard(@RequestParam("selectedSize") String selectedSize, @RequestParam("selectedService") String selectedService, Model model) {
//		modalService.processModalData(selectedSize, selectedService);
//	    model.addAttribute("selectedSize", selectedSize);
//	    model.addAttribute("selectedService", selectedService);
//	    return "modal/mStandard";
//	}

}

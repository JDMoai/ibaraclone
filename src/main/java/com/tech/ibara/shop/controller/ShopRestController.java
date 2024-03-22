package com.tech.ibara.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tech.ibara.shop.service.ProductOptionSetService;
import com.tech.ibara.shop.service.ShopService;

@RestController
public class ShopRestController {

	@Autowired
	private SqlSession sqlSession;
	
	private ShopService shopService;
	
	@RequestMapping("/shop/optionSet")
	public Object optionSet(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		shopService = new ProductOptionSetService(sqlSession);
		shopService.execute(model);
		
		return model.asMap().get("subOptions");
	}
}

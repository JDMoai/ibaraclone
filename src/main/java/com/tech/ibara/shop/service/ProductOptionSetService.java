package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;

public class ProductOptionSetService implements ShopService {

	private SqlSession sqlSession;
	
	public ProductOptionSetService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int option_id = Integer.parseInt(request.getParameter("option_id"));
		
		OptionDto optionDto = dao.selectOptionById(option_id);
		OptionSetDto subOptionSetDto = dao.selectOptionSetById(optionDto.getSub_option_set_id());
		ArrayList<OptionDto> optionDtoList = null;
		if (subOptionSetDto == null) {
			
		} else {
			optionDtoList = dao.selectOptionsByOptionSetId(subOptionSetDto.getOption_set_id());	
		}
		
		model.addAttribute("subOptions", optionDtoList);
		
		System.out.println(product_id);
		System.out.println(option_id);
		
	}

}

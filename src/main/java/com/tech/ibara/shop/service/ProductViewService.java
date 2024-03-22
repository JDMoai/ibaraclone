package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDataDto;
import com.tech.ibara.shop.dto.ProductDto;

public class ProductViewService implements ShopService {

	private SqlSession sqlSession;
	
	public ProductViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		ProductDto productDto = dao.selectProductById(product_id);
		OptionSetDto optionSetDto = dao.selectOptionSetByProductId(product_id);
		
		int optionSetId = optionSetDto.getOption_set_id();
		
		
		OptionDto singleOptionDto = null;
		OptionSetDto subOptionSetDto = null;
		
		ArrayList<OptionDto> optionDtoList = null;
		
		optionDtoList = dao.selectOptionsByOptionSetId(optionSetId);
		
		if (optionDtoList.size() == 1) {
			singleOptionDto = dao.selectOptionJoinProductDataByOptionSetId(optionSetId);
		} else {
			OptionDto optionDto = optionDtoList.get(0);
			if (optionDto.getSub_option_set_id() == null) {
				optionDtoList = dao.selectOptionsJoinProductDataByOptionSetId(optionSetId);
			} else {
				subOptionSetDto = dao.selectOptionSetById(optionDto.getSub_option_set_id());
			}
		}
		
		
		model.addAttribute("product", productDto);
		model.addAttribute("optionSet", optionSetDto);

		model.addAttribute("singleOption", singleOptionDto);
		
		model.addAttribute("options", optionDtoList);
		
		model.addAttribute("subOptionSet", subOptionSetDto);
	}

}

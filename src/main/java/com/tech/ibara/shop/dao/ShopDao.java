package com.tech.ibara.shop.dao;

import java.util.ArrayList;

import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.LevelCategoryDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDataDto;
import com.tech.ibara.shop.dto.ProductDto;

public interface ShopDao {

	public ArrayList<ProductDto> selectProductsByCategory(int category_id);
	public ArrayList<ProductDto> selectProductsByCategories(ArrayList<CategoryDto> categoryList);
	
	public ArrayList<CategoryDto> selectAllSubCategoriesById(int category_id);
	public ArrayList<CategoryDto> selectSubCategoriesById(int category_id);
	
	public CategoryDto selectCategoryById(int category_id);
	public CategoryDto selectUpCategoryById(int category_id);
	
	public ArrayList<String> selectAllCategories();
	
	public ArrayList<LevelCategoryDto> selectAllLevelCategories();
	
	public ProductDto selectProductById(int product_id);
	
	public OptionSetDto selectOptionSetByProductId(int product_id);
	public OptionSetDto selectOptionSetById(int option_set_id);
	
	public ArrayList<OptionDto> selectOptionsByOptionSetId(int option_set_id);
	public OptionDto selectOptionById(int option_id);
	
	public ProductDataDto selectProductDataById(int product_data_id);
	
	public OptionDto selectOptionJoinProductDataByOptionSetId(int option_set_id);
	public ArrayList<OptionDto> selectOptionsJoinProductDataByOptionSetId(int option_set_id);
}

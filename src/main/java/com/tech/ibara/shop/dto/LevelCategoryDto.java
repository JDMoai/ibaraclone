package com.tech.ibara.shop.dto;

public class LevelCategoryDto extends CategoryDto {

	private int level;

	public LevelCategoryDto() {
		super();
	}
	
	public LevelCategoryDto(int level, int category_id, int up_category_id, String name) {
		super(category_id, up_category_id, name);
		this.level = level;
	}
	
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

}

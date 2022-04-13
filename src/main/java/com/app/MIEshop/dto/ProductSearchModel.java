package com.app.MIEshop.dto;

/**
 * chứa tất cả các thông tin cần tìm kiếm
 * 
 * @author daing
 *
 */
public class ProductSearchModel extends BaseSearchModel {

	// tìm theo keyword
	public String keyword;

	// tìm theo category
	public Integer categoryId;

	public String seo;

	public Boolean isHot;

	public String getKeyword() {
		return keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public String getSeo() {
		return seo;
	}
}

package com.app.MIEshop.services;

import java.util.List;

import com.app.MIEshop.entities.BaseEntity;


public class PagerData<E extends BaseEntity> {
	private List<E> data;
	
	private int totalPage;
	
	private int currentPage;

	public List<E> getData() {
		return data;
	}

	public void setData(List<E> data) {
		this.data = data;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	

}

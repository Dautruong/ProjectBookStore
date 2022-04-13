package com.app.MIEshop.services;

import org.springframework.stereotype.Service;

import com.app.MIEshop.entities.ProductImages;

@Service // Định nghĩa bean service
public class ProductImagesService extends BaseService<ProductImages>{

	@Override
	protected Class<ProductImages> clazz() {
		// TODO Auto-generated method stub
		return ProductImages.class;
		
	}
	
}

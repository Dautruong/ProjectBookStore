package com.app.MIEshop.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.app.MIEshop.dto.CategorySearchModel;
import com.app.MIEshop.entities.Categories;



@Service // Định nghĩa bean service
public class CategoriesService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
		
	}
	public PagerData<Categories> search(CategorySearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_category c WHERE 1=1";

		if (searchModel != null) {
			//tìm theo seo
			if (!StringUtils.isEmpty(searchModel.getSeo())) {
				sql += " and c.seo = '" + searchModel.getSeo() + "'";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
	}
}

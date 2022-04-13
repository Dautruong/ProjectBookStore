package com.app.MIEshop.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.MIEshop.controller.BaseController;
import com.app.MIEshop.dto.CategorySearchModel;
import com.app.MIEshop.dto.ProductSearchModel;
import com.app.MIEshop.entities.Categories;
import com.app.MIEshop.entities.Product;
import com.app.MIEshop.services.CategoriesService;
import com.app.MIEshop.services.PagerData;
import com.app.MIEshop.services.ProductService;



@Controller // Đây là Bean tạo Controller 
public class IndexController extends BaseController {
	@Autowired 
	private CategoriesService categoryService;
	@Autowired
	private ProductService productService;
//		public String home(final Model model,
//							final HttpServletRequest request,
//							final HttpServletResponse response) throws IOException{
//			//,@PathVariable("seo") String seo
//			String name = request.getParameter("name");
//			String age = request.getParameter("age");
//			System.out.println("Name" + name + "Age " + age);
//			//System.out.println("Seo: " +seo);
//			//
//			return "customer/seo"; // Đường dẫn tới view
//		}
		@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
		public String home(	final Model model, 
							final HttpServletRequest request, 
							final HttpServletResponse response,
							@ModelAttribute("product") Product product)throws IOException {
//			model.addAttribute("totalItems", 100);
//			model.addAttribute("itemsOnPage", 10);
			List<Product> products = productService.findAll();
			model.addAttribute("products", products);
			ProductSearchModel searchModel = new ProductSearchModel();
			searchModel.keyword = request.getParameter("keyword");
			searchModel.setPage(getCurrentPage(request));
			searchModel.categoryId = super.getInteger(request, "categoryId");
			searchModel.page = getCurrentPage(request);
			model.addAttribute("productsWithPaging", productService.search(searchModel));
			model.addAttribute("searchModel", searchModel);
			model.addAttribute("productsData", productService.search(null));
			return "customer/index"; 
		}
		@RequestMapping(value = { "/details/{seo}" }, method = RequestMethod.GET)
		public String details(	final Model model, final HttpServletRequest request, 
								final HttpServletResponse response, 
								@PathVariable("seo") String seo) throws IOException {
			
			ProductSearchModel productSearchModel = new ProductSearchModel();
			productSearchModel.seo = seo;
			PagerData<Product> pagerData = productService.search(productSearchModel);
			Product product = pagerData.getData().get(0);
			model.addAttribute("product", product);
			
			return "customer/details"; 
		}

		@RequestMapping(value = { "/category/{seo}" }, method = RequestMethod.GET)
		public String category(	final Model model, 
								final HttpServletRequest request,
								final HttpServletResponse response,
								@PathVariable("seo") String seo) throws IOException {
							CategorySearchModel categorySearchModel = new CategorySearchModel();
							categorySearchModel.setSeo(seo);
							Categories categories = categoryService.search(categorySearchModel).getData().get(0);
							model.addAttribute("CurrentCategory", categories);
							
							ProductSearchModel productSearchModel = new ProductSearchModel();
							productSearchModel.categoryId = categories.getId();
							model.addAttribute("productsData", productService.search(productSearchModel));
		
			return "customer/categories"; 
		}
}

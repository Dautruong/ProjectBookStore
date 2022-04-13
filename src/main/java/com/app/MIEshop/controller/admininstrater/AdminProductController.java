package com.app.MIEshop.controller.admininstrater;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.MIEshop.controller.BaseController;
import com.app.MIEshop.dto.ProductSearchModel;
import com.app.MIEshop.entities.Product;
import com.app.MIEshop.services.CategoriesService;
import com.app.MIEshop.services.ProductService;


@Controller
public class AdminProductController extends BaseController{
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoriesService categoriesService;
	@RequestMapping(value = { "/admin/product/list","/admin/list-product"}, method = RequestMethod.GET)
	public String adminProductList(final Model model, 
									final HttpServletRequest request,
									final HttpServletResponse response,
									@ModelAttribute("product") Product product) throws IOException {
			List<Product> products = productService.findAll();
			model.addAttribute("products", products);
			ProductSearchModel searchModel = new ProductSearchModel();
			searchModel.keyword = request.getParameter("keyword");
			searchModel.setPage(getCurrentPage(request));
			searchModel.categoryId = super.getInteger(request, "categoryId");
			searchModel.page = getCurrentPage(request);
			model.addAttribute("productsWithPaging", productService.search(searchModel));
			model.addAttribute("searchModel", searchModel);
			return "administrator/productList"; 
	}

	@RequestMapping(value = { "/admin/product/addOrUpdate"}, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(	final Model model, 
											final HttpServletRequest request,
											final HttpServletResponse response) throws IOException {
			model.addAttribute("categories",categoriesService.findAll());	
			model.addAttribute("product", new Product()); 
			return "administrator/productAddOrUpdate"; 
	}
	@RequestMapping(value = { "/admin/product/addOrUpdate"}, method = RequestMethod.POST)
	public String addProduct(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product,
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productPictures") MultipartFile[] productPictures 
			) throws IOException {
				
			if(product.getId() == null || product.getId() <= 0) { 
				productService.add(product, productAvatar, productPictures);
			} 
			else {
				productService.update(product, productAvatar, productPictures);			
				}
		return "administrator/productAddOrUpdate"; 
	}
	
	@RequestMapping(value = { "/admin/productedit/{productId}"}, method = RequestMethod.GET)
	public String EditProductAddOrUpdate( final Model model, 
											final HttpServletRequest request,
											final HttpServletResponse response,
											@PathVariable("productId") int productId) throws IOException {		
			model.addAttribute("categories",categoriesService.findAll());
			Product product = productService.getById(productId);
			model.addAttribute("product", product);
			return "administrator/productAddOrUpdate"; 
	}
	

}

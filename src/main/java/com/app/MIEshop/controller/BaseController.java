package com.app.MIEshop.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.app.MIEshop.entities.Categories;
import com.app.MIEshop.services.CategoriesService;

public abstract class BaseController {

	@Autowired
	private CategoriesService categoryService;
//
//	private List<String> roles() {
//		List<String> roles = new ArrayList<String>();
//		User logined = getUserLogined();
//		
//		if(logined == null) return roles;
//		for(Role r : logined.getRoles()) {
//			roles.add(r.getAuthority());
//		}
//		
//		return roles;
//	}
	
//	@ModelAttribute("isAdmin")
//	public boolean isAdmin() {
//		for(String role : roles()) {
//			if(role.equalsIgnoreCase("admin")) return true;
//		}
//		return false;
//	}
//	
//	@ModelAttribute("isMember")
//	public boolean isMember() {
//		for(String role : roles()) {
//			if(role.equalsIgnoreCase("member")) return true;
//		}
//		return false;
//	}
	
//	@ModelAttribute("userLogined")
//	public User getUserLogined() {
//		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		if(userLogined != null && userLogined instanceof UserDetails)
//			return (User) userLogined;
//		
//		return null;
//	}
//	
	/**
	 * tất cả các controller mà extens từ đây
	 * thì các action sẽ luôn sẵn danh sách categories.
	 * @return
	 */
	@ModelAttribute("categories")
	public List<Categories> categories() {
		return categoryService.findAll();
	}

	/**
	 * lấy current page, mặc định trả về 1
	 * @param request
	 * @return
	 */
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
	public String dateNow() {
		LocalDateTime current = LocalDateTime.now();
	    
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
	    String formatted = current.format(formatter);
		return formatted;
	}
	
} 

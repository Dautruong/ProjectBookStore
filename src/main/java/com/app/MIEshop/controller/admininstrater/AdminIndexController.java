package com.app.MIEshop.controller.admininstrater;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminIndexController {
	
	
	@RequestMapping(value = {"/admin1", "/adminindex", "/admin/index"}, method = RequestMethod.GET)
	public String admin(
						final Model model,
						final HttpServletRequest request,
						final HttpServletResponse response
						) throws IOException {
	
		return  "administrator/admin";// Duong dan toi view
	}

}

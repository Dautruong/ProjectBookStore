package com.app.MIEshop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController extends BaseController {

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET) // -> action
	public String login(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		// cac views se duoc dat tai thu muc: /src/main/webapp/WEB-INF/views
		return "login"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET) // 
	public String register(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		return "register";
	}
	
}

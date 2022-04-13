package com.app.MIEshop.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.MIEshop.controller.BaseController;
import com.app.MIEshop.dto.ContactModel;
import com.app.MIEshop.entities.Contact;
import com.app.MIEshop.services.ContactService;

@Controller // -> đây là 1 BEAN cho loại CONTROLLER.
public class ContactController extends BaseController {

	@Autowired
	private ContactService contactService;
	
	// định nghĩa action
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String get_contect(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// đẩy thông báo xuống tầng view
		ContactModel contactModel = new ContactModel();
		contactModel.setThongBao(
				"Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within a matter of hours to help you.");
		model.addAttribute("contact", new Contact());

		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "customer/contact"; // -> đường dẫn tới View.
	}
	
	// định nghĩa action
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String post_contact(final Model model, 
										final HttpServletRequest request,
								        final HttpServletResponse response,
					        			@ModelAttribute("contact") Contact contact) throws IOException {
		// đẩy thông báo xuống tầng view
//		ContactModel contactModel = new ContactModel();
//		contactModel.setThongBao(
//				"Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within a matter of hours to help you.");
//		model.addAttribute("contactModel", contactModel);

		// đọc dữ liệu từ người dùng submit lên
//		String yourName = request.getParameter("name");
//		String yourEmail = request.getParameter("email");

		contactService.saveOrUpdate(contact);
		
		//reset data
		model.addAttribute("contact", new Contact());
		model.addAttribute("message", "Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within a matter of hours to help you.");
		
		// đẩy dữ liệu người dùng nhập xuống view
//		model.addAttribute("DuLieuBanNhapLa", contactModel.getEmail() + contactModel.getName());
		
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		/// WEB-INF/views/user/index.jsp
		return "customer/contact"; // -> đường dẫn tới View.
	}
	
	@RequestMapping(value = { "/ajax/contact" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody ContactModel contactModel) {
		System.out.println("ContactModel[Email]: " + contactModel.getEmail());

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", contactModel);
		return ResponseEntity.ok(jsonResult);
	}
	
}

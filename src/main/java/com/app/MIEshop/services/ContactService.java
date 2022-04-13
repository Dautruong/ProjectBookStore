package com.app.MIEshop.services;

import org.springframework.stereotype.Service;

import com.app.MIEshop.entities.Contact;
@Service // Định nghĩa bean service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
		
	}
	
}

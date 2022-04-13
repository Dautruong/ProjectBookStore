package com.app.MIEshop.services;

import org.springframework.stereotype.Service;

import com.app.MIEshop.entities.Role;


@Service // Định nghĩa bean service
public class RolesService extends BaseService<Role>{

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
		
	}
	
}

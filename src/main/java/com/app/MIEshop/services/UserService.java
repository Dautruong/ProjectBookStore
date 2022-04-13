package com.app.MIEshop.services;

import java.util.List;
import org.springframework.stereotype.Service;
import com.app.MIEshop.entities.User;

@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}
	
	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<User> users = this.runTransactQuerySQL(sql, 0).getData();
		
		if(users == null || users.size() <= 0) return null;
		return users.get(0);
	}

	
}

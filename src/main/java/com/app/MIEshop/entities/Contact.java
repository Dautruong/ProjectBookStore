package com.app.MIEshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity {
	@Column(name = "first_name", length = 45,nullable = false)
	private String fistName;
	
	@Column(name = "last_name", length = 45,nullable = false)
	private String lastName;

	@Column(name = "email", length = 45,nullable = false)
	private String email;

	
	@Column(name = "message", length = 1000,nullable = false)
	private String message;

	public String getFistName() {
		return fistName;
	}

	public void setFistName(String fistName) {
		this.fistName = fistName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lasName) {
		this.lastName = lasName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

//	public String getRequestType() {
//		return requestType;
//	}
//
//	public void setRequestType(String requestType) {
//		this.requestType = requestType;
//	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}

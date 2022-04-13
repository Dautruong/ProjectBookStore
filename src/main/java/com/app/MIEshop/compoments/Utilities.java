package com.app.MIEshop.compoments;


import java.util.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.github.slugify.Slugify;

public class Utilities {
	public static String slugify(String text) {
		return new Slugify().slugify(text);
	}
	public static void main(String[] args) {
		
		
		//System.out.println(new BCryptPasswordEncoder(4).encode("123456780"));;
		Date date=java.util.Calendar.getInstance().getTime();   System.out.println(date); 
	}
}

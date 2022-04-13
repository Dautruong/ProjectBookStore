package com.app.MIEshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StartServer {
	public static void main(String[] args) {
		System.out.println("Start Server web Bookshop...");
		SpringApplication.run(StartServer.class, args);
	}
}
 
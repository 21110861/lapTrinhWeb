//package io.hcmute.springbootstarter.controllers;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//@Controller
//public class MainController {
//	
//	@GetMapping("/login")
//	public String login() {
//		return "login";
//	}
//
//	@GetMapping("/searchForm")
//	public String searchForm() {
//		return "searchForm";
//	}
//
//	@GetMapping("/admin")
//	public String home() {
//		return "index";
//	}
//
//
//	@GetMapping("/login-security")
//	public String admin() {
//		// Lấy đối tượng xác thực
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//
//		boolean isCustomer= authentication.getAuthorities().stream()
//				.anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_USER"));
//
//		if (isCustomer) {
//			return "searchForm";
//		} else {
//			return "index";
//		}
//	}
//}

package io.hcmute.springbootstarter.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;

import io.hcmute.springbootstarter.models.Users;
import io.hcmute.springbootstarter.services.UsersService;

@Controller
public class LoginController {
	@Autowired
	private UsersService userService;

	@GetMapping("/login")
	public String showLoginForm(Model model) {
		// Điều kiện cần thiết khác có thể được thêm vào đây nếu cần
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String pass, HttpSession session, Model model) {
		Users user = userService.login(email, pass);

		if (user != null) {
			// Login successful
			session.setAttribute("user", user.getName());
			session.setAttribute("isAdmin", user.getRole().equals("admin"));
			return "redirect:/"; // Redirect to the home page or wherever you want
		} else {
			// Login failed
			model.addAttribute("error", "Invalid username or password.");
			return "redirect:/login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate(); // Xóa session
		return "redirect:/"; // Chuyển hướng về trang chủ hoặc trang nào đó khác
	}

	@GetMapping("/registration")
	public String showRegistrationForm(Model model) {
		// Thêm model attribute để bind dữ liệu từ form
		model.addAttribute("user", new Users());
		return "registration"; // Trả về tên của trang JSP
	}

	@PostMapping("/registration")
	public String processRegistration(Users user) {
		String success = "true";
		String message = "You've successfully registered to our awesome app!";

		if (userService.hasOverLapEmail(user.getEmail()) == false) {
			user.setRole("user");
			userService.addUser(user);		
			
		}
		else {
			success = "false";
			message = "email has been used. sorry !!";
		}
		// Build the redirect URL with properly encoded parameters
	    UriComponentsBuilder builder = UriComponentsBuilder.fromPath("/registration")
	        .queryParam("success", success)
	        .queryParam("message", message);

	    // Redirect to the constructed URL
	    return "redirect:" + builder.toUriString();
	}
}

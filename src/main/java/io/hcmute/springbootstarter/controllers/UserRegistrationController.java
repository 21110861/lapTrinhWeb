package io.hcmute.springbootstarter.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import io.hcmute.springbootstarter.models.UserRegistration;
import io.hcmute.springbootstarter.services.UsersService;

@Controller
@RequestMapping("/registration")
public class UserRegistrationController {

	private UsersService userService;

	public UserRegistrationController(UsersService userService) {
		super();
		this.userService = userService;
	}
	
	@ModelAttribute("user")
    public UserRegistration userRegistrationDto() {
        return new UserRegistration();
    }
	
	@GetMapping
	public String showRegistrationForm() {
		return "registration";
	}
	
	@PostMapping
	public String registerUserAccount(@ModelAttribute("user") UserRegistration registrationDto) {
		userService.save(registrationDto);
		return "redirect:/registration?success";
	}
}

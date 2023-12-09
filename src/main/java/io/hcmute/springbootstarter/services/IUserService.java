package io.hcmute.springbootstarter.services;

import org.springframework.security.core.userdetails.UserDetailsService;

import io.hcmute.springbootstarter.models.UserRegistration;
import io.hcmute.springbootstarter.models.Users;

public interface IUserService extends UserDetailsService{
	Users save(UserRegistration registrationDto);
}

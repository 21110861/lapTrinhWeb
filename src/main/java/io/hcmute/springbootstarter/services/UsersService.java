package io.hcmute.springbootstarter.services;

import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import io.hcmute.springbootstarter.models.Role;
import io.hcmute.springbootstarter.models.UserRegistration;
import io.hcmute.springbootstarter.models.Users;
import io.hcmute.springbootstarter.repositories.UserRepository;

@Service
public class UsersService implements IUserService{

	private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UsersService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UsersService() {
        this.userRepository = null; // or initialize it appropriately
        this.passwordEncoder = null; // or initialize it appropriately
    }
	public UsersService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
		this.passwordEncoder = new BCryptPasswordEncoder();
	}

	@Override
	public Users save(UserRegistration registrationDto) {
		Users user = new Users(registrationDto.getUserName(),
				registrationDto.getEmail(),
				passwordEncoder.encode(registrationDto.getPassword()), Arrays.asList(new Role("ROLE_USER")));
		
		return userRepository.save(user);
	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		Users user = userRepository.findByEmail(username);
		if(user == null)
		{
			throw new UsernameNotFoundException("Invalid username or password.");
		}
		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), mapRolesToAuthorities(user.getRoles()));		
	}
	
	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles){
		return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
	}



}

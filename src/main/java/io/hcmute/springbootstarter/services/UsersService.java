package io.hcmute.springbootstarter.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.hcmute.springbootstarter.models.Users;
import io.hcmute.springbootstarter.repositories.UserRepository;

@Service
public class UsersService {
	@Autowired
	private UserRepository userRepository;

	public Users login(String email, String pass) {
		return userRepository.findByEmailAndPass(email, pass);
	}

	public void deleteUser(int id) {
		userRepository.deleteById(id);
	}

	public Users addUser(Users user) {
		Users newUser = userRepository.save(user);
		return newUser;
	}

	public List<Users> getAllUsers() {
		List<Users> users = new ArrayList<>();
		userRepository.findAll().forEach(users::add);
		return users;
	}

	public boolean hasOverLapEmail(String email) {
		Users findUser = userRepository.findByEmail(email);
		if (findUser != null)
			return true;
		return false;
	}

	public void updateUser(Users user) {
		Optional<Users> old = userRepository.findById(user.getId());
		if(old.isPresent()) {
			user.setPass(old.get().getPass());
		}
	}

}

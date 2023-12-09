package io.hcmute.springbootstarter.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import io.hcmute.springbootstarter.models.UserRegistration;
import io.hcmute.springbootstarter.models.Users;

@Repository
public interface UserRepository extends JpaRepository<Users, Integer>{
	Users findByEmail(String email);
	Users save(UserRegistration registrationDto);
}

package com.app.et.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.et.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	Optional<User> findByUsernameOrEmail(String username, String email);

	Optional<User> findByUsernameOrEmailAndPassword(String username, String email, String encodePassword);

	Optional<User> findByUsername(String username);

}

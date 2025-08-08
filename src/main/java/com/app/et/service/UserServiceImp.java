package com.app.et.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.app.et.entity.User;
import com.app.et.exception.UserNotFound;
import com.app.et.repository.UserRepository;
import com.app.et.util.PasswordEncoder;

@Service
public class UserServiceImp implements UserService {

	private UserRepository userRepository;

	private PasswordEncoder passwordEncoder;

	public UserServiceImp(UserRepository userRepository, PasswordEncoder passwordEncoder) {
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public boolean registerUser(User user) {
		Optional<User> opt = userRepository.findByUsernameOrEmail(user.getUsername(), user.getEmail());
		if (opt.isPresent()) {
			// Already register with give email or username
			return false;
		} else {
			// register successfully
			user.setPassword(passwordEncoder.encodePassword(user.getPassword()));
			userRepository.save(user);
			return true;
		}
	}

	@Override
	public boolean login(String username, String password) {
		return userRepository.findByUsernameAndPassword(username, passwordEncoder.encodePassword(password)).isPresent();
	}

	@Override
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username).orElseThrow(() -> new UserNotFound("User Not Registered"));
	}

}

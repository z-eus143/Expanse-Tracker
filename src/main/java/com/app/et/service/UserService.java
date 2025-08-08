package com.app.et.service;

import com.app.et.entity.User;

public interface UserService {

	boolean registerUser(User user);

	boolean login(String username, String password);

	User findByUserName(String userName);

}

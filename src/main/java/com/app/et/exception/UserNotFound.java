package com.app.et.exception;

public class UserNotFound extends RuntimeException {

	private String message;

	public UserNotFound() {
	}

	public UserNotFound(String message) {
		this.message = message;
	}

	@Override
	public String getMessage() {
		return this.getMessage();
	}

}

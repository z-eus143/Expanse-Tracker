package com.app.et.config;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession(false);

		// Allow public pages without login
		String uri = request.getRequestURI();
		if (uri.equals("/") || uri.startsWith("/login") || uri.startsWith("/register") || uri.startsWith("/logout")
				|| uri.startsWith("/passwordreset")) {
			return true;
		}

		// Check session
		if (session != null && session.getAttribute("username") != null) {
			return true; // logged in
		}

		// If not logged in, redirect to login
		response.sendRedirect("/login");
		return false;
	}
}

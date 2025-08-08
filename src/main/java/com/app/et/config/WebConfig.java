package com.app.et.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new SessionInterceptor()).addPathPatterns("/**") // apply to all URLs
				.excludePathPatterns("/", "/login", "/register", "/css/**", "/js/**", "/images/**"); // allow public
																										// pages and
																										// static files
	}
}

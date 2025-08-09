package com.app.et.config;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

	@Bean
	DataSource dataSource() {
		return DataSourceBuilder.create()
				.url(System.getenv("DB_URL"))
				.username(System.getenv("DB_USER"))
				.password(System.getenv("DB_PASSWORD"))
				.driverClassName("org.postgresql.Driver")
				.build();
	}
}

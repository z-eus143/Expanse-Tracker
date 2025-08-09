package com.app.et.config;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.github.cdimascio.dotenv.Dotenv;

@Configuration
public class AppConfig {

	@Bean
	DataSource dataSource() {
		Dotenv dotenv = Dotenv.load();

		return DataSourceBuilder.create().url(dotenv.get("DATABASE_URL")).username(dotenv.get("PGUSER"))
				.password(dotenv.get("PGPASSWORD")).driverClassName("org.postgresql.Driver").build();
	}
}

package com.utfpr.ativadi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan(basePackages={"com.utfpr.ativadi"})
@EnableJpaRepositories(basePackages="com.utfpr.ativadi.repositories")
@EnableTransactionManagement
@EntityScan(basePackages="com.utfpr.ativadi.entities")
public class AtivadiApplication {

	public static void main(String[] args) {
		SpringApplication.run(AtivadiApplication.class, args);
	}
}



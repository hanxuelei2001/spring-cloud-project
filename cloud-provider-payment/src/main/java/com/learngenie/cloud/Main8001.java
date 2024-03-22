package com.learngenie.cloud;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
import tk.mybatis.spring.annotation.MapperScan;

// 入住注册中心
@EnableDiscoveryClient
@SpringBootApplication
@MapperScan("com.learngenie.cloud.mapper")
public class Main8001 {
    public static void main(String[] args) {
        SpringApplication.run(Main8001.class, args);
    }

    @Value("${info}")
    private String info;

    @Bean
    public CommandLineRunner commandLineRunner() {
        return new CommandLineRunner() {

            @Override
            public void run(String... args) throws Exception {
                System.out.println("get info from consul" + info);
            }
        };
    }
}
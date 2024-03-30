package com.learngenie.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class Main8083 {
    public static void main(String[] args) {
        SpringApplication.run(Main8083.class, args);
    }
}
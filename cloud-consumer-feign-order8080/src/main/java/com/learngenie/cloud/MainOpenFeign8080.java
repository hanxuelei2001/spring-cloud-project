package com.learngenie.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

// 入住注册中心
@EnableDiscoveryClient
@SpringBootApplication
@EnableFeignClients // 启用 feign 客户端，定义服务 + 绑定接口，以声明方式优雅而简单的实现服务调用
public class MainOpenFeign8080 {
    public static void main(String[] args) {
        SpringApplication.run(MainOpenFeign8080.class, args);
    }
}
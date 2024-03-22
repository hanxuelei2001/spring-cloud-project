package com.learngenie.cloud.config;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTemplateConfig {

    @Bean
    @LoadBalanced // 由于 consul 默认支持 loadBalance 所以这里要在 restTemplate 这里添加上
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}

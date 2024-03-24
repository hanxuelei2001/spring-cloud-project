package com.learngenie.cloud.config;

import feign.Logger;
import feign.Retryer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignConfig {

    @Bean
    public Retryer customerRetryer() {
         //return Retryer.NEVER_RETRY; // 默认是不进行 retry 的
        // 最大请求次数为 3 ( 1 + 2), 初始间隔为 100 ms，重试间隔最大为 1 s
        return new Retryer.Default(100, 1, 3);
    }

    @Bean
    public Logger.Level feignLoggerLevel() {
        // 开启内容最详细的日志
        return Logger.Level.FULL;
    }
}

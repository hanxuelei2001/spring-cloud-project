package com.learngenie.cloud.config;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Swagger3Config {

    @Bean
    public GroupedOpenApi payApi() {
        return GroupedOpenApi.builder()
                .group("支付微服务模块")
                .pathsToMatch("/api/v1/pay/**")
                .build();
    }

    @Bean
    public GroupedOpenApi otherApi() {
        return GroupedOpenApi.builder()
                .group("其他微服务模块")
                .pathsToMatch("/api/v1/other/**", "/api/v1/others")
                .build();
    }

    @Bean
    public OpenAPI docsOpenApi() {
        return new OpenAPI()
                .info(new Info().title("Cloud 2024")
                        .description("通用设计 rest")
                        .version("v1.0")
                )
                .externalDocs(new ExternalDocumentation()
                        .description("test.web.learngenie.com")
                        .url("https://yiyan.baidu.com/"));

    }
}

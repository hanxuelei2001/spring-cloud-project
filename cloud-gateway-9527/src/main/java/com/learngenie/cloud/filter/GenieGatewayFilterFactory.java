package com.learngenie.cloud.filter;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;
import java.util.List;

/**
 * 自定义的 gateway filter
 */
@Slf4j
@Component
public class GenieGatewayFilterFactory  extends AbstractGatewayFilterFactory<GenieGatewayFilterFactory.Config> {

    public static final String STATUS = "status";

    public GenieGatewayFilterFactory() {
        super(Config.class);
    }

    @Override
    public GatewayFilter apply(GenieGatewayFilterFactory.Config config) {
        log.info("GatewayFilter: {}", config.getStatus());
        return (exchange, chain) -> {
            ServerHttpRequest request = exchange.getRequest();
            if (request.getQueryParams().containsKey("genie")) {
                return chain.filter(exchange);
            }
            log.info(config.getStatus());
            exchange.getResponse().setStatusCode(HttpStatus.BAD_REQUEST);
            return exchange.getResponse().setComplete();
        };
    }

    @Override
    public List<String> shortcutFieldOrder() {
        return List.of(STATUS);
    }

    @Setter
    @Getter
    @Validated
    public static class Config {

        /**
         * 设置一个状态值，匹配成功之后执行某些事情
         */
        @NotNull
        private String status;

    }
}

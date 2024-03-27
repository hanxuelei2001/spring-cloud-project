package com.learngenie.cloud.predicted;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cloud.gateway.handler.predicate.AbstractRoutePredicateFactory;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.server.ServerWebExchange;

import java.util.Collections;
import java.util.List;
import java.util.function.Predicate;

/**
 * 需求说明：自定义配置会员等级 userType ，按照 钻/金/银/yml 配置的会员等级，已适配是否可以访问
 * @author hanxuelei
 * @date 2024/03/27
 */
@Component
public class GenieRoutePredicateFactory extends AbstractRoutePredicateFactory<GenieRoutePredicateFactory.Config> {

    public static final String DATETIME_KEY = "userType";

    public GenieRoutePredicateFactory() {
        super(GenieRoutePredicateFactory.Config.class);
    }

    @Override
    public List<String> shortcutFieldOrder() {
        return Collections.singletonList(DATETIME_KEY);
    }

    @Override
    public Predicate<ServerWebExchange> apply(Config config) {
        return new Predicate<ServerWebExchange>() {
            @Override
            public boolean test(ServerWebExchange serverWebExchange) {
                // 获取对应的 request 对象
                ServerHttpRequest request = serverWebExchange.getRequest();
                // 从 request 中获取 userType 的参数
                String userType = request.getQueryParams().getFirst("userType");
                // 如果参数不存在，那么就直接返回 false，不通过
                if (!StringUtils.hasText(userType)) {
                    return false;
                }
                // 如果 userType 适配的
                if (userType.equalsIgnoreCase(config.getUserType())) {
                    // 校验成功，返回成功
                    return true;
                }
                return false;
            }
        };
    }

    @Setter
    @Getter
    @Validated
    public static class Config {
        @NotNull
        private String userType;

        public Config() {
        }

    }
}

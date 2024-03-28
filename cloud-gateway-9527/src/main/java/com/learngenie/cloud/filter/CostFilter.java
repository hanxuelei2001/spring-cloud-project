package com.learngenie.cloud.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Objects;


@Slf4j
@Component
public class CostFilter implements GlobalFilter, Ordered {

    private static final String BEGIN_VISIT_TIME = "begin_visit_time";
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        exchange.getAttributes().put(BEGIN_VISIT_TIME, System.currentTimeMillis());
        return chain.filter(exchange).then(Mono.fromRunnable(() -> {
            Long beginTime = exchange.getAttribute(BEGIN_VISIT_TIME);

            if (Objects.nonNull(beginTime)) {
                log.info("访问接口主机： {}", exchange.getRequest().getURI().getHost());
                log.info("访问接口端口： {}", exchange.getRequest().getURI().getPort());
                log.info("访问接口URL： {}", exchange.getRequest().getURI().getPath());
                log.info("访问接口参数： {}", exchange.getRequest().getURI().getRawQuery());
                log.info("访问接口时长： {} 毫秒", System.currentTimeMillis() - beginTime);
            }
        }));
    }

    /**
     * 数字越小，优先级越高
     * @return int
     */
    @Override
    public int getOrder() {
        return 0;
    }
}

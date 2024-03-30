package com.learngenie.cloud.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class RateLimitController {

    @GetMapping(value = "/rateLimit/byUrl")
    public String byUrl () {
        return "按照 url 地址限流测试 OK";
    }

    @SentinelResource(value = "byResourceSentinelResource", blockHandler = "handlerBlockHandler")
    @GetMapping(value = "/rateLimit/byResource")
    public String byResource () {
        return "按照 Resource 名称限流测试 OK";
    }

    public String handlerBlockHandler(BlockException blockException) {
        return "服务不可用，触发了 @SentinelResource 启动";
    }

    /**
     * fallback 是熔断的时候生效
     * blockHandler 是限流的时候生效
     * @param p1
     * @return
     */
    @GetMapping(value = "/rateLimit/doAction/{p1}")
    @SentinelResource(value = "doActionSentinelResource", fallback = "doActionFallback",
    blockHandler = "doActionBlockHandler")
    public String doAction(@PathVariable("p1") Integer p1) {
        if (p1 == 0) {
            throw  new RuntimeException("p1 等于零直接异常");
        }
        return "doAction";
    }

    public String doActionBlockHandler(@PathVariable("p1") Integer p1,
                                       BlockException blockException) {
        log.error("sentinel 配置自定义限流了", blockException);
        return "sentinel 配置自定义限流了";
    }

    public String doActionFallback(@PathVariable("p1") Integer p1,
                                   Throwable t) {
        log.error("程序逻辑异常了", t);
        return "程序逻辑异常了 \t" + t.getMessage();
    }
}

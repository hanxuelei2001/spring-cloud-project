package com.learngenie.cloud.controller;

import com.learngenie.cloud.apis.PayFeignApi;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderCircuitController {

    @Resource
    private PayFeignApi payFeignApi;

    @GetMapping(value = "/feign/pay/circuit/{id}")
    @CircuitBreaker(name = "cloud-payment-service", fallbackMethod = "myCircuitFallback")
    public String myCircuitBreaker(@PathVariable("id") Integer id) {
        return payFeignApi.myCircuit(id);
    }

    /**
     * CircuitBreaker 中填写的 fallback 的方法
     * @param throwable
     * @return {@link String}
     */
    public String myCircuitFallback(Integer id, Throwable throwable) {
        return id + "myCircuitFallback 系统繁忙，请稍后重试";
    }
}

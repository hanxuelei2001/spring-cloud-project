package com.learngenie.cloud.controller;

import com.learngenie.cloud.apis.PayFeignApi;
import io.github.resilience4j.bulkhead.annotation.Bulkhead;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import io.github.resilience4j.ratelimiter.annotation.RateLimiter;
import jakarta.annotation.Resource;
import org.apache.hc.core5.concurrent.CompletedFuture;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

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

    //@GetMapping(value = "/feign/pay/bulkhead/{id}")
    //@Bulkhead(name = "cloud-payment-service", fallbackMethod = "myCircuitFallback", type = Bulkhead.Type.SEMAPHORE)
    //public String myBulkhead(@PathVariable("id") Integer id) {
    //    return payFeignApi.myBulkhead(id);
    //}

    //@GetMapping(value = "/feign/pay/bulkhead/{id}")
    //@Bulkhead(name = "cloud-payment-service", fallbackMethod = "myCircuitThreadFallback", type = Bulkhead.Type.THREADPOOL)
    //public CompletableFuture<String> myBulkhead2(@PathVariable("id") Integer id) throws InterruptedException {
    //    TimeUnit.SECONDS.sleep(10);
    //    return CompletableFuture.supplyAsync(() -> {
    //        return payFeignApi.myBulkhead(id);
    //    });
    //}
    //
    //public CompletableFuture<String> myCircuitThreadFallback(Integer id, Throwable throwable) {
    //    return CompletableFuture.supplyAsync(() -> {
    //        return id + "myCircuitFallback 系统繁忙，请稍后重试";
    //    });
    //}


    @GetMapping(value = "/feign/pay/ratelimit/{id}")
    @RateLimiter(name = "cloud-payment-service", fallbackMethod = "myCircuitFallback")
    public String myBulkhead2(@PathVariable("id") Integer id) throws InterruptedException {
        return payFeignApi.myBulkhead(id);
    }
}

package com.learngenie.cloud.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

@RestController
public class PayCircuitController {

    /**
     * 关于限流熔断的测试
     * @param id
     * @return {@link String}
     */
    @GetMapping(value = "/pay/circuit/{id}")
    public String myCircuit(@PathVariable("id") Integer id) {
        if (id == -4) {
            throw new RuntimeException("-- circuit 不能是 负数");
        }
        if (id == 9999) {
            try {
                TimeUnit.SECONDS.sleep(5);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        return "Hello Circuit" + id + "\t" + UUID.randomUUID().toString();
    }

    /**
     * 关于舱闭隔离的测试逻辑
     * @param id
     * @return {@link String}
     */
    @GetMapping(value = "/pay/bulkhead/{id}")
    public String myBulkhead(@PathVariable("id") Integer id) {
        if (id == -4) {
            throw new RuntimeException("-- bulkhead 不能是 负数");
        }
        if (id == 9999) {
            try {
                TimeUnit.SECONDS.sleep(5);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        return "Hello bulkhead" + id + "\t" + UUID.randomUUID().toString();
    }
}

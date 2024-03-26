package com.learngenie.cloud.controller;

import com.learngenie.cloud.apis.PayFeignApi;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderMicrometerController {

    @Resource
    private PayFeignApi payFeignApi;

    @GetMapping(value = "/feign/micrometer/{id}")
    public String myMicrometer(@PathVariable("id") String id) {
        return payFeignApi.myMicrometer(id);
    }
}

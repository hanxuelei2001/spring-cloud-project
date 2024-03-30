package com.learngenie.cloud.controller;

import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping(value = "/order/nacos")
public class OrderNacosController {

    @Resource
    private RestTemplate restTemplate;

    @Value("${service-url.nacos-user-service}")
    private String serviceName;

    @GetMapping(value = "{id}")
    public String paymentInfo(@PathVariable("id") String id) {
        String result = restTemplate.getForObject(serviceName + "/pay/nacos/" + id, String.class);
        return result + "\t" + "我是 OrderNacosController 8083 调用者。。。。。。";
    }
}

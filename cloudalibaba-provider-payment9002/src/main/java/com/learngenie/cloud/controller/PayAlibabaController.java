package com.learngenie.cloud.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping(value = "/pay/nacos")
@RestController
public class PayAlibabaController {

    @Value("${server.port}")
    private String serverPort;

    @GetMapping(value = "{id}")
    public String getPayInfo(@PathVariable("id") String id) {
        return "nacos registry, serverPort: " + serverPort + "\t id" + id;
    }
}

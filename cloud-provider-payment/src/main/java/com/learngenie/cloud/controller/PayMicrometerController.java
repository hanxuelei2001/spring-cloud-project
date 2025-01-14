package com.learngenie.cloud.controller;

import cn.hutool.core.util.IdUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PayMicrometerController {

    @GetMapping(value = "/pay/micrometer/{id}")
    public String myMicrometer(@PathVariable("id") String id) {
        return "hello micrometer inputId ： " + id + "\t 服务返回" + IdUtil.randomUUID();
    }
}

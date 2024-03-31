package com.learngenie.cloud.controller;

import com.learngenie.cloud.apis.PayFeignSentinelApi;
import com.learngenie.cloud.response.ResultData;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/feign/nacos")
public class OrderFeignNacosController {

    @Resource
    private PayFeignSentinelApi payFeignSentinelApi;

    @GetMapping(value = "/get/{orderNo}")
        public ResultData<String> getPayByOrderNo(@PathVariable("orderNo") String orderNo) {
        return payFeignSentinelApi.getPayByOrderNo(orderNo);
    }

}

package com.learngenie.cloud.controller;

import cn.hutool.core.date.DateUtil;
import com.learngenie.cloud.service.FlowLimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FlowLimitController {

    @Autowired
    private FlowLimitService flowLimitService;

    /**
     * 直接限流 - 直接，即如果发生了超过阈值的，直接进行 fallback
     * @return {@link String}
     */
    @GetMapping(value = "/testA")
    public String testA() {
        return "------------testA";
    }


    /**
     * 间接限流 - 直接，即如果 testB 发生了超过阈值的，直接进行 fallback testA
     * @return {@link String}
     */
    @GetMapping(value = "/testB")
    public String testB() {
        return "------------testB";
    }


    /**
     * 限流-链路，即认定 common 的 SentinelResource，如果 SentinelResource 被调用了多次，那么限制给定的入口
     * @return {@link String}
     */
    @GetMapping(value = "/testC")
    public String testC() {
        return "------------testC" + flowLimitService.common();
    }

    @GetMapping(value = "/testD")
    public String testD() {
        return "------------testD" + flowLimitService.common();
    }

    /**
     * 流控效果，排队等待
     * @return {@link String}
     */
    @GetMapping(value = "/testE")
    public String testE() {
        return "------------testE 流控效果，排队等待" + DateUtil.now();
    }
}

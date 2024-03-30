package com.learngenie.cloud.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class EmpowerController {

    @GetMapping(value = "/empower")
    public String requestSentinel4() {
        log.info("测试 sentinel 的授权规则 empower");
        return "sentinel 授权规则";
    }
}

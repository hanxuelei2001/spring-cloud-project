package com.learngenie.cloud.service.impl;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.learngenie.cloud.service.FlowLimitService;
import org.springframework.stereotype.Service;

@Service
public class FlowLimitServiceImpl implements FlowLimitService {

    @SentinelResource(value = "common")
    @Override
    public String common() {
        return "---------FlowLimitService come in";
    }
}

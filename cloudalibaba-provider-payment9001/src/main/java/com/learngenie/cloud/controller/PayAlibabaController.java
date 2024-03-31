package com.learngenie.cloud.controller;

import cn.hutool.core.util.IdUtil;
import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.fastjson.JSON;
import com.learngenie.cloud.entities.PayDto;
import com.learngenie.cloud.enums.ReturnCodeEnum;
import com.learngenie.cloud.response.ResultData;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;


@RequestMapping(value = "/pay/nacos")
@RestController
public class PayAlibabaController {

    @Value("${server.port}")
    private String serverPort;

    @GetMapping(value = "{id}")
    public String getPayInfo(@PathVariable("id") String id) {
        return "nacos registry, serverPort: " + serverPort + "\t id" + id;
    }

    @GetMapping(value = "/get/{orderNo}")
    @SentinelResource(value = "getPayByOrderNo", blockHandler = "handlerBlockHandler")
    public ResultData<String> getPayByOrderNo(@PathVariable("orderNo") String orderNo) {
        // 模拟从数据库查询出数据并复制给 DTO
        PayDto payDto = new PayDto();
        payDto.setId(1024);
        payDto.setOrderNo(orderNo);
        payDto.setAmount(BigDecimal.valueOf(9.9));
        payDto.setPayNo("pay:" + IdUtil.fastUUID());
        payDto.setUserId(1);

        return ResultData.success(JSON.toJSONString(payDto));
    }

    public ResultData<String> handlerBlockHandler(@PathVariable("orderNo") String orderNo) {
        return ResultData.fail(ReturnCodeEnum.RC500.getCode(), "getPayByOrderNo" +
                "服务不可用，触发 sentinel 流控配置规则");
    }
}

package com.learngenie.cloud.controller;

import com.learngenie.cloud.apis.PayFeignApi;
import com.learngenie.cloud.entities.PayDto;
import com.learngenie.cloud.response.ResultData;
import io.swagger.v3.oas.annotations.Operation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/api/v1/order")
public class OrderController {

    private static final Logger log = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private PayFeignApi feignApi;

    @GetMapping("/consumer/pay/add")
    @Operation(summary = "新增", description = "新增支付流水方法， json 作为参数")
    public ResultData<Integer> addOrder(PayDto payDto) {
        return feignApi.addPay(payDto);
    }

    @GetMapping("/consumer/pay/del/{id}")
    @Operation(summary = "删除", description = "删除支付流水方法， id 作为路径参数")
    public ResultData<Integer> delOrder(@PathVariable("id") Integer id) {
        feignApi.deletePay(id);
        return ResultData.success(id);
    }

    @GetMapping("/consumer/pay/update")
    @Operation(summary = "更新", description = "更新支付流水方法， json 作为参数")
    public ResultData<PayDto> updatePay(PayDto payDto) {
        feignApi.updatePay(payDto);
        return ResultData.success(payDto);
    }

    @GetMapping("/consumer/pay/get/{id}")
    @Operation(summary = "查询", description = "查询支付流水方法， id 作为路径参数")
    public ResultData<PayDto> getPay(@PathVariable("id") Integer id) {
        return feignApi.getPay(id);
    }

    @GetMapping("/consumer/pay/get/all")
    @Operation(summary = "查询全部", description = "查询全部支付流水方法")
    public ResultData<List<PayDto>> getAll() {
        return feignApi.getAll();
    }
}

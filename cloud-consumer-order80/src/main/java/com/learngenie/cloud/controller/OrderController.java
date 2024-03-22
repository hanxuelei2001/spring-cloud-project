package com.learngenie.cloud.controller;

import com.learngenie.cloud.entities.PayDto;
import com.learngenie.cloud.response.ResultData;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
@RequestMapping("/api/v1/order")
public class OrderController {

    //public static final String PaymentSrv_URL = "http://localhost:8001/api/v1/pay";
    public static final String PaymentSrv_URL = "http://cloud-payment-service/api/v1/pay";

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/consumer/pay/add")
    @Operation(summary = "新增", description = "新增支付流水方法， json 作为参数")
    public ResultData<Integer> addOrder(PayDto payDto) {
        return restTemplate.postForObject(PaymentSrv_URL + "/add", payDto, ResultData.class);
    }

    @GetMapping("/consumer/pay/del/{id}")
    @Operation(summary = "删除", description = "删除支付流水方法， id 作为路径参数")
    public ResultData<Integer> delOrder(@PathVariable("id") Integer id) {
        restTemplate.delete(PaymentSrv_URL + "/del/" + id, id);
        return ResultData.success(id);
    }

    @GetMapping("/consumer/pay/update")
    @Operation(summary = "更新", description = "更新支付流水方法， json 作为参数")
    public ResultData<PayDto> updatePay(PayDto payDto) {
        restTemplate.put(PaymentSrv_URL + "/update", payDto);
        return ResultData.success(payDto);
    }

    @GetMapping("/consumer/pay/get/{id}")
    @Operation(summary = "查询", description = "查询支付流水方法， id 作为路径参数")
    public ResultData getPay(@PathVariable("id") Integer id) {
        return restTemplate.getForObject(PaymentSrv_URL + "/get/" + id, ResultData.class, id);
    }

    @GetMapping("/consumer/pay/get/all")
    @Operation(summary = "查询全部", description = "查询全部支付流水方法")
    public ResultData getAll() {
        return restTemplate.getForObject(PaymentSrv_URL + "/get/all", ResultData.class);
    }

}

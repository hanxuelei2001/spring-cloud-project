package com.learngenie.cloud.apis;

import com.learngenie.cloud.apis.impl.PayFeignSentinelApiFallBack;
import com.learngenie.cloud.response.ResultData;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

// 如果是对内的，则使用服务名
@FeignClient(value = "nacos-payment-service", fallback = PayFeignSentinelApiFallBack.class)
public interface PayFeignSentinelApi {
    @GetMapping(value = "/pay/nacos/get/{orderNo}")
    ResultData<String> getPayByOrderNo(@PathVariable("orderNo") String orderNo);
}

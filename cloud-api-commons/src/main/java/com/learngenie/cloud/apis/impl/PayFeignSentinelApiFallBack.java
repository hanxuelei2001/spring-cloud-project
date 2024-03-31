package com.learngenie.cloud.apis.impl;

import com.learngenie.cloud.apis.PayFeignSentinelApi;
import com.learngenie.cloud.enums.ReturnCodeEnum;
import com.learngenie.cloud.response.ResultData;
import org.springframework.stereotype.Component;

@Component
public class PayFeignSentinelApiFallBack implements PayFeignSentinelApi {
    @Override
    public ResultData<String> getPayByOrderNo(String orderNo) {
        return ResultData.fail(ReturnCodeEnum.RC500.getCode(), "对方服务器宕机或者不可用，FallBack 服务宕机不可用");
    }
}

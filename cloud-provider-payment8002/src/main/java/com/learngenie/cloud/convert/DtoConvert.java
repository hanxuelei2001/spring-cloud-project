package com.learngenie.cloud.convert;

import com.learngenie.cloud.entities.Pay;
import com.learngenie.cloud.entities.PayDto;

import java.util.Date;

public class DtoConvert {

    public static Pay convertDtoEntity(PayDto dto) {
        Pay pay = new Pay();
        pay.setId(dto.getId());
        pay.setPayNo(dto.getPayNo());
        pay.setOrderNo(dto.getOrderNo());
        pay.setUserId(dto.getUserId());
        pay.setAmount(dto.getAmount());
        pay.setDeleted((byte) 0);
        pay.setCreateTime(new Date());
        pay.setUpdateTime(new Date());
        return pay;
    }
}

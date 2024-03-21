package com.learngenie.cloud.controller;

import com.learngenie.cloud.convert.DtoConvert;
import com.learngenie.cloud.entities.Pay;
import com.learngenie.cloud.entities.PayDto;
import com.learngenie.cloud.response.SuccessResponse;
import com.learngenie.cloud.service.PayService;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController("/api/v1/pay")
@Slf4j
public class PayController {

    @Autowired
    private PayService payService;

    @PostMapping("/add")
    public SuccessResponse addPay(@RequestBody Pay pay) {
        return payService.add(pay);
    }

    @DeleteMapping("/del/{id}")
    public SuccessResponse deletePay(@PathVariable("id") Integer id) {
        return payService.delete(id);
    }

    @PutMapping("/udpate")
    public SuccessResponse updatePay(@RequestBody PayDto payDto) {
        // 使用转化器转化，可以比 Bean 拷贝要高效
        Pay pay = DtoConvert.convertDtoEntity(payDto);
        return payService.update(pay);
    }

    @GetMapping("/get/{id}")
    public Pay getPay(@PathVariable("id") Integer id) {
        return payService.getById(id);
    }

    @GetMapping("/get/all")
    public List<Pay> getAll() {
        return payService.getAll();
    }
}

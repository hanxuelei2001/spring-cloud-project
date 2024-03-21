package com.learngenie.cloud.controller;

import com.learngenie.cloud.convert.DtoConvert;
import com.learngenie.cloud.entities.Pay;
import com.learngenie.cloud.entities.PayDto;
import com.learngenie.cloud.response.ResultData;
import com.learngenie.cloud.service.PayService;
import java.util.List;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/pay")
@Slf4j
@Tag(name = "支付服务模块的", description = "支付 CRUD")
public class PayController {

    @Autowired
    private PayService payService;

    @PostMapping("/add")
    @Operation(summary = "新增", description = "新增支付流水方法， json 作为参数")
    public ResultData<Integer> addPay(@RequestBody Pay pay) {
        return ResultData.success(payService.add(pay));
    }

    @DeleteMapping("/del/{id}")
    @Operation(summary = "删除", description = "删除支付流水方法， id 作为路径参数")
    public ResultData<Integer> deletePay(@PathVariable("id") Integer id) {
        return ResultData.success(payService.delete(id));
    }

    @PutMapping("/udpate")
    @Operation(summary = "更新", description = "更新支付流水方法， json 作为参数")
    public ResultData<Integer> updatePay(@RequestBody PayDto payDto) {
        // 使用转化器转化，可以比 Bean 拷贝要高效
        Pay pay = DtoConvert.convertDtoEntity(payDto);
        return ResultData.success(payService.update(pay));
    }

    @GetMapping("/get/{id}")
    @Operation(summary = "查询", description = "查询支付流水方法， id 作为路径参数")
    public ResultData<Pay> getPay(@PathVariable("id") Integer id) {
        return ResultData.success(payService.getById(id));
    }

    @GetMapping("/get/all")
    @Operation(summary = "查询全部", description = "查询全部支付流水方法")
    public ResultData<List<Pay>> getAll() {
        return ResultData.success(payService.getAll());
    }
}

package com.learngenie.cloud.controller;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import com.learngenie.cloud.convert.DtoConvert;
import com.learngenie.cloud.entities.Pay;
import com.learngenie.cloud.entities.PayDto;
import com.learngenie.cloud.response.ResultData;
import com.learngenie.cloud.service.PayService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/pay/gateway")
@Slf4j
@Tag(name = "支付服务网关模块的", description = "支付 CRUD")
public class PayGatewayController {

    @Autowired
    private PayService payService;

    @Value("${server.port}")
    private String port;
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

    @PutMapping("/update")
    @Operation(summary = "更新", description = "更新支付流水方法， json 作为参数")
    public ResultData<Integer> updatePay(@RequestBody PayDto payDto) {
        // 使用转化器转化，可以比 Bean 拷贝要高效
        Pay pay = DtoConvert.convertDtoEntity(payDto);
        return ResultData.success(payService.update(pay));
    }

    @GetMapping("/get/{id}")
    @Operation(summary = "查询", description = "查询支付流水方法， id 作为路径参数")
    public ResultData<Pay> getPay(@PathVariable("id") Integer id, @Value("${info}") String info) throws InterruptedException {
        log.info("info: {}, port: {}",info, port);
        return ResultData.success(payService.getById(id));
    }

    @GetMapping("/get/all")
    @Operation(summary = "查询全部", description = "查询全部支付流水方法")
    public ResultData<List<Pay>> getAll() {
        return ResultData.success(payService.getAll());
    }

    @GetMapping(value = "filter")
    public ResultData<String> getGatewayFilter(HttpServletRequest request) {
        String result = "";

        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headName = headerNames.nextElement();
            String headerValue = request.getHeader(headName);
            log.info("请求头是 ： {}，请求头的值是 ： {}", headName, headerValue);
            if (headName.equalsIgnoreCase("X-Request-learngenie1") ||
                    headName.equalsIgnoreCase("X-Request-learngenie2")) {
                result = result + headName + "\t" + headerValue + "  ";
            }
        }

        Enumeration<String> parameterNames = request.getParameterNames();
        while(parameterNames.hasMoreElements()) {
            String parameter = parameterNames.nextElement();
            String parameterValue = request.getParameter(parameter);
            log.info("请求参数 ： {}，请求参数的值是 ： {}", parameter, parameterValue);
        }
        return ResultData.success("gatewayFilter 过滤器 test： "+ result + "\t" + DateUtil.now());
    }
}

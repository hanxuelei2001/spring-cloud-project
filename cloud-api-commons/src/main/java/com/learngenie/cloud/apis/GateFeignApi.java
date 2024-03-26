package com.learngenie.cloud.apis;

import com.learngenie.cloud.entities.PayDto;
import com.learngenie.cloud.response.ResultData;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

// 如果是对外的，则使用网关
@FeignClient(value = "cloud-gateway")
public interface GateFeignApi {


	/**
	 * 新增一条 pay 记录
	 * @param payDto
	 * @return {@link ResultData}<{@link Integer}>
	 */
	@PostMapping("/pay/gateway/add")
	ResultData<Integer> gatewayAdd(@RequestBody PayDto payDto);

	/**
	 * 通过 id 删除一条流水记录
	 * @param id
	 * @return {@link ResultData}<{@link Integer}>
	 */
	@DeleteMapping("/pay/gateway/del/{id}")
	ResultData<Integer> gatewayDeletePay(@PathVariable("id") Integer id);

	/**
	 * 通过 id 更新一条流水记录
	 * @param payDto
	 * @return {@link ResultData}<{@link Integer}>
	 */
	@PutMapping("/pay/gateway/update")
	ResultData<Integer> gatewayUpdatePay(@RequestBody PayDto payDto);


	/**
	 * 通过 id 查询一条流水记录
	 * @param id
	 * @return {@link ResultData}<{@link PayDto}>
	 */
	@GetMapping("/pay/gateway/get/{id}")
	ResultData<PayDto> gatewayGetPay(@PathVariable("id") Integer id);

	/**
	 * 获取所有的流水记录
	 * @return {@link ResultData}<{@link List}<{@link PayDto}>>
	 */
	@GetMapping("/pay/gateway/get/all")
	ResultData<List<PayDto>> gatewayGetAll();
}
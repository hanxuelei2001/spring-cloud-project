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

@FeignClient(value = "cloud-payment-service")
public interface PayFeignApi {
	/**
	 * 新增一条 pay 记录
	 * @param payDto
	 * @return {@link ResultData}<{@link Integer}>
	 */
	@PostMapping("/api/v1/pay/add")
	ResultData<Integer> addPay(@RequestBody PayDto payDto);

	/**
	 * 通过 id 删除一条流水记录
	 * @param id
	 * @return {@link ResultData}<{@link Integer}>
	 */
	@DeleteMapping("/api/v1/pay/del/{id}")
	ResultData<Integer> deletePay(@PathVariable("id") Integer id);

	/**
	 * 通过 id 更新一条流水记录
	 * @param payDto
	 * @return {@link ResultData}<{@link Integer}>
	 */
	@PutMapping("/api/v1/pay/update")
	ResultData<Integer> updatePay(@RequestBody PayDto payDto);


	/**
	 * 通过 id 查询一条流水记录
	 * @param id
	 * @return {@link ResultData}<{@link PayDto}>
	 */
	@GetMapping("/api/v1/pay/get/{id}")
	ResultData<PayDto> getPay(@PathVariable("id") Integer id);

	/**
	 * 获取所有的流水记录
	 * @return {@link ResultData}<{@link List}<{@link PayDto}>>
	 */
	@GetMapping("/api/v1/pay/get/all")
	ResultData<List<PayDto>> getAll();

	/**
	 * 断路器
	 * @param id
	 * @return {@link String}
	 */
	@GetMapping(value = "/pay/circuit/{id}")
	String myCircuit(@PathVariable("id") Integer id);


	/**
	 * 舱闭
	 * @param id
	 * @return {@link String}
	 */
	@GetMapping(value = "/pay/bulkhead/{id}")
	public String myBulkhead(@PathVariable("id") Integer id);

	/**
	 * 链路追踪
	 * @param id
	 * @return {@link String}
	 */
	@GetMapping(value = "/pay/micrometer/{id}")
	public String myMicrometer(@PathVariable("id") String id);
}
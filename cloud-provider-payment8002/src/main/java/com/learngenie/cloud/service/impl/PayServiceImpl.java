package com.learngenie.cloud.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.learngenie.cloud.entities.Pay;
import com.learngenie.cloud.exception.BusinessException;
import com.learngenie.cloud.mapper.PayMapper;
import com.learngenie.cloud.response.ResultData;
import com.learngenie.cloud.service.PayService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.Sqls;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Service
public class PayServiceImpl implements PayService {

    @Resource
    private PayMapper payMapper;

    @Override
    public int add(Pay pay) {
        // 参数校验
        if (Objects.isNull(pay)) {
            throw new BusinessException();
        }
        // 获取插入的结果
        int res = payMapper.insertSelective(pay);
        // 如果插入成功
        if (res > 0) {
            return res;
        }
        throw new BusinessException();
    }

    @Override
    public int delete(Integer id) {
        // 参数校验
        if (Objects.isNull(id)) {
            throw new BusinessException();
        }
        int res = payMapper.deleteByPrimaryKey(id);
        // 如果删除成功
        if (res > 0) {
            return res;
        }
        throw new BusinessException();
    }

    @Override
    public int update(Pay pay) {
        // 参数校验
        if (Objects.isNull(pay)) {
            throw new BusinessException();
        }
        int res = payMapper.updateByPrimaryKeySelective(pay);
        // 如果更新成功
        if (res > 0) {
            return res;
        }
        throw new BusinessException();
    }

    @Override
    public Pay getById(Integer id) {
        // 参数校验
        if (Objects.isNull(id)) {
            return new Pay();
        }
        return payMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Pay> getAll() {
        return payMapper.selectAll();
    }

    @Override
    public List<Pay> getByIds(List<Integer> ids) {
        // 如果 ids 是空的
        if (CollectionUtil.isNotEmpty(ids)) {
            return Collections.emptyList();
        }
        // 构建 example
        Example queryExample = Example.builder(Pay.class)
                .where(Sqls.custom().andIn("id", ids))
                .orderByDesc("amount")
                .build();

        // 构建查询条件
        return payMapper.selectByExample(queryExample);
    }
}

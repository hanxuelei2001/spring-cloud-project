package com.learngenie.cloud.service;

import com.learngenie.cloud.entities.Pay;
import com.learngenie.cloud.response.ResultData;

import java.util.List;

public interface PayService {

    int add(Pay pay);
    int delete(Integer id);
    int update(Pay pay);

    Pay getById(Integer id);

    List<Pay> getAll();

    List<Pay> getByIds(List<Integer> ids);
}

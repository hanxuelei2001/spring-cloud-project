package com.learngenie.cloud.service;

import com.learngenie.cloud.entities.Pay;
import com.learngenie.cloud.response.SuccessResponse;

import java.util.List;

public interface PayService {

    SuccessResponse add(Pay pay);
    SuccessResponse delete(Integer id);
    SuccessResponse update(Pay pay);

    Pay getById(Integer id);

    List<Pay> getAll();

    List<Pay> getByIds(List<Integer> ids);
}

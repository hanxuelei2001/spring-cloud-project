package com.learngenie.cloud.exception;

import com.learngenie.cloud.enums.ReturnCodeEnum;
import com.learngenie.cloud.response.ResultData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResultData<String> exception(Exception e) {
        log.error("has error: {}", e.getMessage());
        return ResultData.fail(ReturnCodeEnum.RC500.getCode(), e.getMessage());
    }
}

package com.learngenie.cloud.enums;


import java.util.Arrays;

public enum ReturnCodeEnum {

    RC999("999", "操作 XXX 失败"),

    RC200("200", "success"),

    RC201("201", "服务开启降级保护，请稍后再试！"),

    RC202("202", "热点参数限流，请稍后再试"),

    RC203("203", "系统规则不满足要求，请稍后再试"),

    RC204("204", "授权规则不通过，请稍后再试"),

    RC403("403", "无访问权限，请联系管理员授予权限"),

    RC401("401", "匿名用户访问无权限资源时的异常"),

    RC404("404", "404 页面找不到的异常"),

    RC500("500", "系统异常，请稍后重试"),

    RC375("375", "数字运算异常，请稍后重试"),

    INVALID_TOKEN("2001", "访问令牌不合法"),

    ACCESS_DENIED("2003", "没有权限访问该资源"),

    CLIENT_AUTHENTICATION_FAILED("1001", "客户端认证失败"),

    USERNAME_OR_PASSWORD_ERROR("1002", "用户名或密码错误"),

    BUSINESS_ERROR("1004", "业务逻辑异常"),

    UNSUPPORTED_GRANT_TYPE("1003", "不支持的认证模式");

    // 如何定义一个通用的枚举类，对于枚举的编写
    // 举值-构造-遍历
    private final String code;
    private final String message;

    ReturnCodeEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    // 遍历
    public static ReturnCodeEnum getReturnCodeEnum(String matchCode) {
        return Arrays.stream(ReturnCodeEnum.values())
                .filter(x -> x.code.equalsIgnoreCase(matchCode))
                .findFirst().orElse(null);
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}

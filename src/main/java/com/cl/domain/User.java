package com.cl.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class User {
    private Integer id; //用户id
    private String name; //用户名
    private String email; //用户邮箱
    private String password; //用户密码
    private String identity; //身份
    private String province; //省
    private String city; //市
    private String county; //县
    private String place; //详细地址
}

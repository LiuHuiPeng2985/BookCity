package com.cl.service;

import com.cl.domain.User;

import java.util.List;


public interface UserService {

    //登录
    User login(User user);

    //注册
    void register(User user);

    //查找邮箱
    User searchEmail(User user);

    //查看个人资料
    User searchUser(Integer id);

    //修改个人资料
    void updateInformation(User user);

    //查询所有用户
    List<User> listUser();

}

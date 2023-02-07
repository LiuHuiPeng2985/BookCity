package com.cl.service.impl;

import com.cl.domain.User;
import com.cl.mapper.UserMapper;
import com.cl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //登录
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    //注册
    @Override
    public void register(User user) {
        userMapper.register(user);
    }

    //查找邮箱
    @Override
    public User searchEmail(User user) {
        return userMapper.searchEmail(user);
    }

    //查看个人信息
    @Override
    public User searchUser(Integer id) {
        return userMapper.searchUser(id);
    }

    //修改个人消息
    @Override
    public void updateInformation(User user) {
        userMapper.updateInformation(user);
    }

    //查询所有用户
    @Override
    public List<User> listUser() {
        return userMapper.listUser();
    }

}

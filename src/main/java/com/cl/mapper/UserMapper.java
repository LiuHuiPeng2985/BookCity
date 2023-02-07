package com.cl.mapper;

import com.cl.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserMapper {

    //登录
    @Select("select * from user where user_email = #{email} AND user_password = #{password}")
    @Results(id = "userMap",value = {
            @Result(id = true,column = "user_id",property = "id"),
            @Result(column = "user_name",property = "name"),
            @Result(column = "user_email",property = "email"),
            @Result(column = "user_password",property = "password"),
            @Result(column = "user_identity",property = "identity"),
            @Result(column = "user_province",property = "province"),
            @Result(column = "user_city",property = "city"),
            @Result(column = "user_county",property = "county"),
            @Result(column = "user_place",property = "place")
    })
    User login(User user);

    //注册
    @Insert("insert into user(user_name,user_email,user_password,user_identity) values(#{name},#{email},#{password},#{identity})")
    @ResultMap("userMap")
    void register(User user);

    //查找邮箱
    @Select("select * from user where user_email = #{email}")
    @ResultMap("userMap")
    User searchEmail(User user);

    //查看个人资料
    @Select("select * from user where user_id = #{id}")
    @ResultMap("userMap")
    User searchUser(Integer id);

    //修改个人信息
    @Update("update user set user_name = #{name},user_province = #{province},user_city = #{city},user_county = #{county},user_place = #{place} where user_id = #{id}")
    @ResultMap("userMap")
    void updateInformation(User user);

    //查询所有用户
    @Select("select * from user where user_identity = 0")
    @ResultMap("userMap")
    List<User> listUser();
}

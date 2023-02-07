package com.cl.mapper;

import com.cl.domain.Book;
import com.cl.domain.Cart;
import com.cl.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/27 14:11
 */
@Repository
public interface CartMapper {

    //加入购物车
    @Insert("insert into cart(user_id,book_id,cart_num,status) values(#{userId},#{bookId},#{cartNum},#{status})")
//    @Results(id = "cartMap",value = {
//            @Result(id = true,column = "cart_id",property = "cartId"),
//            @Result(column = "user_id",property = "userId"),
//            @Result(column = "book_id",property = "bookId"),
//            @Result(column = "cart_num",property = "cartNum"),
//            @Result(column = "status",property = "status")
//
//    })
    @ResultMap("cartMap")
    void addCart(Cart cart);

    //查看购物车单书信息
    @Select("select * from cart where book_id = #{bookId} and user_id = #{userId}")
    @Results(id = "cartMap",value = {
            @Result(id = true,column = "cart_id",property = "cartId"),
            @Result(column = "user_id",property = "userId"),
            @Result(column = "book_id",property = "bookId"),
            @Result(column = "cart_num",property = "cartNum"),
            @Result(column = "status",property = "status")

    })
    Cart findCartBook(@Param("bookId") Integer bookId,@Param("userId") Integer userId);

    //更新购物车书籍数量
    @Update("update cart set cart_num = #{cartNum} where book_id = #{bookId} and user_id = #{userId}")
    @ResultMap("cartMap")
    void updateCartNum(Cart cart);

    //查询用户购物车信息
    @Select("select * from cart where user_id = #{userId}")
    @ResultMap("cartMap")
    List<Cart> findCartBookByUser(Integer userId);

    //删除购物车里的书
    @Delete("delete from cart where book_id = #{bookId} and user_id = #{userId}")
    @ResultMap("cartMap")
    void deleteBook(Cart cart);

    //修改购物车里的书的勾选状态
    @Update("update cart set status = #{status} where book_id = #{bookId} and user_id = #{userId}")
    @ResultMap("cartMap")
    void updateCartBookStatus(Cart cart);

    //修改购物车里的所有书的勾选状态
    @Update("update cart set status = #{status} where user_id = #{userId}")
    @ResultMap("cartMap")
    void updateCartBookAllStatus(Cart cart);

    //删除已结算的书籍
    @Delete("delete from cart where status = 1 and user_id = #{userId} ")
    @ResultMap("cartMap")
    void deleteCartBookByStatus(Cart cart);
}

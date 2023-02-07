package com.cl.service;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/27 14:11
 */

import com.cl.domain.Cart;
import com.cl.domain.User;

import java.util.List;

public interface CartService {

    //加入购物车
    void addCart(Cart cart);

    //查看购物车单书信息
    Cart findCartBook(Integer bookId,Integer userId);

    //更新购物车书籍数量
    void updateCartNum(Cart cart);

    //查询用户购物车信息
    List<Cart> findCartBookByUser(Integer userId);

    //删除购物车里的书
    void deleteBook(Cart cart);

    //修改购物车里的书的勾选状态
    void updateCartBookStatus(Cart cart);

    //修改购物车里的所有书的勾选状态
    void updateCartBookAllStatus(Cart cart);

    //删除已结算的书籍
    void deleteCartBookByStatus(Cart cart);

}

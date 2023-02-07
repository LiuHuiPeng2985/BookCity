package com.cl.service.impl;

import com.cl.domain.Cart;
import com.cl.domain.User;
import com.cl.mapper.CartMapper;
import com.cl.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/27 14:11
 */
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    //加入购物车
    @Override
    public void addCart(Cart cart) {
        cartMapper.addCart(cart);
    }

    //查看购物车单书信息
    @Override
    public Cart findCartBook(Integer bookId,Integer userId) {
        return cartMapper.findCartBook(bookId,userId);
    }

    //更新购物车书籍数量
    @Override
    public void updateCartNum(Cart cart) {
        cartMapper.updateCartNum(cart);
    }

    //查询用户购物车信息
    @Override
    public List<Cart> findCartBookByUser(Integer userId) {
        return cartMapper.findCartBookByUser(userId);
    }

    //删除购物车里的书
    @Override
    public void deleteBook(Cart cart) {
        cartMapper.deleteBook(cart);
    }


    //修改购物车里的书的勾选状态
    @Override
    public void updateCartBookStatus(Cart cart) {
        cartMapper.updateCartBookStatus(cart);
    }

    //修改购物车里的所有书的勾选状态
    @Override
    public void updateCartBookAllStatus(Cart cart) {
        cartMapper.updateCartBookAllStatus(cart);
    }

    //删除已结算的书籍
    @Override
    public void deleteCartBookByStatus(Cart cart) {
        cartMapper.deleteCartBookByStatus(cart);
    }

}

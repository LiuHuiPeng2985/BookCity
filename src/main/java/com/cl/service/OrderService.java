package com.cl.service;

/*
 * @author  LiuHuiPeng
 * @date    2022/5/1 11:35
 */

import com.cl.domain.Order;

import java.util.List;

public interface OrderService {

    //订单生成
    void createOrder(Order order);

    //查询订单(用户)
    List<Order> selectOrder(Integer id);

    //删除订单(用户)
    void orderIsDeleted(Integer id);

    //收货(用户)
    void receiving(Integer id);

    //查询所有订单(管理员)
    List<Order> listOrders();

    //申请退单(用户)
    void chargeback(Integer id);

    //查看订单详情
    Order orderById(Integer id);

    //发货(管理员)
    void deliverGoods(Integer id);

    //同意退单(管理员)
    void agreeChargeback(Integer id);
}

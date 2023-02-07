package com.cl.service.impl;

import com.cl.domain.Order;
import com.cl.mapper.OrderMapper;
import com.cl.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @author  LiuHuiPeng
 * @date    2022/5/1 11:35
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    //订单生成
    @Override
    public void createOrder(Order order) {
        orderMapper.createOrder(order);
    }

    //查询订单(用户)
    @Override
    public List<Order> selectOrder(Integer id) {
        return orderMapper.selectOrder(id);
    }

    //删除订单(用户)
    @Override
    public void orderIsDeleted(Integer id) {
        orderMapper.orderIsDeleted(id);
    }

    //收货(用户)
    @Override
    public void receiving(Integer id) {
        orderMapper.receiving(id);
    }

    //查询所有订单(管理员)
    @Override
    public List<Order> listOrders() {
        return orderMapper.listOrders();
    }

    //申请退单(用户)
    @Override
    public void chargeback(Integer id) {
        orderMapper.chargeback(id);
    }

    //查看订单详情
    @Override
    public Order orderById(Integer id) {
        return orderMapper.orderById(id);
    }

    //发货(管理员)
    @Override
    public void deliverGoods(Integer id) {
        orderMapper.deliverGoods(id);
    }

    //同意退单(管理员)
    @Override
    public void agreeChargeback(Integer id) {
        orderMapper.agreeChargeback(id);
    }


}

package com.cl.domain;

/*
 * @author  LiuHuiPeng
 * @date    2022/5/1 11:34
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.List;


@Getter
@Setter
public class Order {
    private Integer orderId;
    private String orderNum;    //订单编号
    private Integer userId;     //购书人
    private String state;       //状态(0：申请退单，1：未发货；2：已发货，3：已签收，4：已退单)
    private Double price;       //总价
    private String orderTime;   //下单时间
    private String bookIds;     //书id
    private String bookNums;    //书数量
    private String address;     //地址
    private String isDeleted;   //是否被用户删除(0：未被删除，1：已被删除)
    User user;
    Book book;
    List<Cart> cartList;
}

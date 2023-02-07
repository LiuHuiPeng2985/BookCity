package com.cl.mapper;

import com.cl.domain.Book;
import com.cl.domain.Order;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
 * @author  LiuHuiPeng
 * @date    2022/5/1 11:35
 */
@Repository
public interface OrderMapper {

    //订单生成
    @Insert("insert into orders(order_num,user_id,state,price,order_time,book_ids,book_nums,address) values(#{orderNum},#{userId},#{state},#{price},#{orderTime},#{bookIds},#{bookNums},#{address})")
//    @Results(id = "orderMap",value = {
//            @Result(id = true,column = "order_id",property = "orderId"),
//            @Result(column = "order_num",property = "orderNum"),
//            @Result(column = "user_id",property = "userId"),
//            @Result(column = "state",property = "state"),
//            @Result(column = "price",property = "price"),
//            @Result(column = "order_time",property = "orderTime"),
//            @Result(column = "book_ids",property = "bookIds"),
//            @Result(column = "book_nums",property = "bookNums"),
//            @Result(column = "address",property = "address"),
//            @Result(column = "is_deleted",property = "isDeleted")
//    })
    @ResultMap("orderMap")
    void createOrder(Order order);

    //查询订单(用户)
    @Select("select * from orders where user_id = #{userId} and is_deleted = 0 order by state asc,order_time desc")
    @Results(id = "orderMap",value = {
            @Result(id = true,column = "order_id",property = "orderId"),
            @Result(column = "order_num",property = "orderNum"),
            @Result(column = "user_id",property = "userId"),
            @Result(column = "state",property = "state"),
            @Result(column = "price",property = "price"),
            @Result(column = "order_time",property = "orderTime"),
            @Result(column = "book_ids",property = "bookIds"),
            @Result(column = "book_nums",property = "bookNums"),
            @Result(column = "address",property = "address"),
            @Result(column = "is_deleted",property = "isDeleted")
    })
    List<Order> selectOrder(Integer id);

    //删除订单(用户)
    @Update("update orders set is_deleted = 1 where order_id = #{orderId}")
    @ResultMap("orderMap")
    void orderIsDeleted(Integer id);

    //收货(用户)
    @Update("update orders set state = 3 where order_id = #{orderId}")
    @ResultMap("orderMap")
    void receiving(Integer id);

    //查询所有订单(管理员)
    @Select("select * from orders order by state asc,order_time desc")
    @ResultMap("orderMap")
    List<Order> listOrders();

    //申请退单(用户)
    @Update("update orders set state = 0 where order_id = #{orderId}")
    @ResultMap("orderMap")
    void chargeback(Integer id);

    //查看订单详情
    @Select("select * from orders where order_id = #{orderId}")
    @ResultMap("orderMap")
    Order orderById(Integer id);

    //发货(管理员)
    @Update("update orders set state = 2 where order_id = #{orderId}")
    @ResultMap("orderMap")
    void deliverGoods(Integer id);

    //同意退单(管理员)
    @Update("update orders set state = 4 where order_id = #{orderId}")
    @ResultMap("orderMap")
    void agreeChargeback(Integer id);
}

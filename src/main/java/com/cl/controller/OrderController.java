package com.cl.controller;

import com.cl.domain.Book;
import com.cl.domain.Cart;
import com.cl.domain.Order;
import com.cl.domain.User;
import com.cl.entity.Result;
import com.cl.service.BookService;
import com.cl.service.CartService;
import com.cl.service.OrderService;
import com.cl.service.UserService;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 * @author  LiuHuiPeng
 * @date    2022/5/1 11:34
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private BookService bookService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserService userService;


    //订单生成
    @ResponseBody
    @RequestMapping("/addOrderByCart")
    public void addOrderByCart(double prices, HttpServletRequest request, String bookIdArray, String bookNumArray){
        User user= (User) request.getSession().getAttribute("USER_SESSION");

        //创建时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = sdf.format(new java.util.Date());
        //订单编号
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String str = formatter.format(new Date());
        str = (str) + (int)((Math.random() * 9 + 1) * 10);
        //地址
        User user1 = userService.searchUser(user.getId());

        Order order = new Order();
        order.setOrderNum(str);
        order.setUserId(user.getId());
        order.setState("1");
        order.setPrice(prices);
        order.setOrderTime(createTime);
        order.setBookIds(bookIdArray);
        order.setBookNums(bookNumArray);
        order.setAddress(user1.getProvince()+user1.getCity()+user1.getCounty()+user1.getPlace());
        orderService.createOrder(order);
        //更新对应书籍库存和销量
        String[] ids=bookIdArray.split(",");
        String[] nums=bookNumArray.split(",");
        int index=0;
        for(String id:ids){
            int i=Integer.parseInt(id);
            Book book=bookService.bookDetails(i);
            book.setNumber(book.getNumber()-Integer.parseInt(nums[index]));
            book.setSales(book.getSales()+Integer.parseInt(nums[index]));
            bookService.updateBook(book);
            index++;
        }
        //删除购物车
        Cart cart = new Cart();
        cart.setUserId(user.getId());
        cartService.deleteCartBookByStatus(cart);
    }

    //订单主页
    @RequestMapping("/order")
    public ModelAndView order(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        ModelAndView modelAndView = new ModelAndView();
        List<Order> order = orderService.selectOrder(user.getId());
        modelAndView.addObject("order",order);
        modelAndView.setViewName("order");
        return modelAndView;
    }

    //删除订单(用户)
    @ResponseBody
    @RequestMapping("/deleteOrder")
    public Result deleteOrder(Integer id) {
        Order order = new Order();
        order.setOrderId(id);
        orderService.orderIsDeleted(order.getOrderId());
        return new Result(true, "删除成功!");
    }

    //收货(用户)
    @ResponseBody
    @RequestMapping("/receivedGoods")
    public Result receivedGoods(Integer id) {
        Order order = new Order();
        order.setOrderId(id);
        orderService.receiving(order.getOrderId());
        return new Result(true, "操作成功!");
    }

    //查询所有订单(管理员)
    @ResponseBody
    @RequestMapping("/managerOrder")
    public ModelAndView managerOrder(@RequestParam(defaultValue = "1")Integer pageNum){
        if (pageNum < 1){
            pageNum = 1;
        }
        PageHelper.startPage(pageNum,10);
        List<Order> order = orderService.listOrders();
        for (Order list:order) {
            User user = userService.searchUser(list.getUserId());
            list.setUser(user);
        }
        PageInfo pageInfo = new PageInfo(order,10);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("manager_order");
        return modelAndView;
    }

    //申请退单(用户)
    @ResponseBody
    @RequestMapping("/applyForChargeback")
    public Result applyForChargeback(Integer id) {
        Order order = new Order();
        order.setOrderId(id);
        orderService.chargeback(order.getOrderId());
        return new Result(true, "申请退单成功!");
    }

    //查看订单详情(用户/管理员)
    @ResponseBody
    @RequestMapping("/orderDetail")
    public Result<Order> orderDetail(Integer id){
        Order order = orderService.orderById(id);
        String[] ids = order.getBookIds().split(",");
        String[] nums = order.getBookNums().split(",");
        List<Cart> cartList = new ArrayList<>();
        int index = 0;
        for(String id1:ids){
            Book book = bookService.bookDetails(Integer.parseInt(id1));
            Cart cart = new Cart();
            cart.setCartNum(Integer.parseInt(nums[index]));
            cart.setBook(book);
            cartList.add(cart);
            index++;
        }
        order.setCartList(cartList);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("order",order);
        return new Result<Order>(true,"",order);
    }

    //发货(管理员)
    @ResponseBody
    @RequestMapping("/deliverGoods")
    public Result deliverGoods(Integer id) {
        Order order = new Order();
        order.setOrderId(id);
        orderService.deliverGoods(order.getOrderId());
        return new Result(true, "发货成功!");
    }

    //同意退单(管理员)
    @ResponseBody
    @RequestMapping("/agreeChargeback")
    public Result agreeChargeback(Integer id) {
        Order order = new Order();
        order.setOrderId(id);
        orderService.agreeChargeback(order.getOrderId());
        Order order1 = orderService.orderById(order.getOrderId());
        String bookIdArray = order1.getBookIds();
        System.out.println(bookIdArray);
        String bookNumArray = order1.getBookNums();
        System.out.println(bookNumArray);
        order.setBookIds(bookIdArray);
        order.setBookNums(bookNumArray);
        //更新对应书籍库存和销量
        String[] ids=bookIdArray.split(",");
        String[] nums=bookNumArray.split(",");
        int index=0;
        for(String id1:ids){
            int i=Integer.parseInt(id1);
            Book book=bookService.bookDetails(i);
            book.setNumber(book.getNumber()+Integer.parseInt(nums[index]));
            book.setSales(book.getSales()-Integer.parseInt(nums[index]));
            bookService.updateBook(book);
            index++;
        }
        return new Result(true, "退单成功!");
    }

    //直接购买(用户)
    @ResponseBody
    @RequestMapping("/byNow")
    public void byNow(Integer id, Integer num, Double prices, HttpServletRequest request){
        User user= (User) request.getSession().getAttribute("USER_SESSION");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = sdf.format(new java.util.Date());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String str = formatter.format(new Date());
        str = (str) + (int)((Math.random() * 9 + 1) * 10);
        User user1 = userService.searchUser(user.getId());
        Order order = new Order();
        order.setOrderNum(str);
        order.setUserId(user.getId());
        order.setState("1");
        order.setPrice(prices);
        order.setOrderTime(createTime);
        String bookIdArray = String.valueOf(id);
        String bookNumArray = String.valueOf(num);
        order.setBookIds(bookIdArray);
        order.setBookNums(bookNumArray);
        order.setAddress(user1.getProvince()+user1.getCity()+user1.getCounty()+user1.getPlace());
        orderService.createOrder(order);
        //更新对应书籍库存和销量
        String[] ids=bookIdArray.split(",");
        String[] nums=bookNumArray.split(",");
        int index=0;
        for(String id1:ids){
            int i=Integer.parseInt(id1);
            Book book=bookService.bookDetails(i);
            book.setNumber(book.getNumber()-Integer.parseInt(nums[index]));
            book.setSales(book.getSales()+Integer.parseInt(nums[index]));
            bookService.updateBook(book);
            index++;
        }
    }


}

package com.cl.controller;

import com.cl.domain.Book;
import com.cl.domain.Cart;
import com.cl.domain.User;
import com.cl.entity.Result;
import com.cl.service.BookService;
import com.cl.service.CartService;
import com.cl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/27 14:10
 */
@Controller
public class CartController {

    @Autowired
    private CartService cartService;
    
    @Autowired
    private BookService bookService;
    
    @Autowired
    private UserService userService;
    
    //加入购物车
    @ResponseBody
    @RequestMapping("/addShoppingCart")
    public Result addShoppingCart(Integer id, Integer num, HttpServletRequest request) {
        User u = (User) request.getSession().getAttribute("USER_SESSION");
        Cart cart = new Cart();
        cart.setUserId(u.getId());
        cart.setBookId(id);
        cart.setCartNum(num);
        cart.setStatus(0); //默认不勾选
        Cart cart1 = new Cart();
        cart1 = cartService.findCartBook(id, u.getId());
        if (cart1 == null) {
            cartService.addCart(cart);
            return new Result(true, "加入成功!");
        } else {
            cart.setCartNum(cart1.getCartNum() + num);
            cartService.updateCartNum(cart);
            return new Result(true, "追加成功!");
        }
    }

    //查询用户购物车信息
    @RequestMapping("/shoppingcart")
    public ModelAndView shoppingCart(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        List<Cart>  cartList = cartService.findCartBookByUser(user.getId());
        for (Cart list:cartList) {
            Book book = bookService.bookDetails(list.getBookId());
            list.setBook(book);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("cartlist",cartList);
        modelAndView.setViewName("shoppingcart");
        return modelAndView;
    }

    //删除购物车里的书
    @ResponseBody
    @RequestMapping("/deleteCartBook")
    public Result deleteCartBook(Integer id,HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        Cart cart=new Cart();
        cart.setUserId(user.getId());
        cart.setBookId(id);
        cartService.deleteBook(cart);
        return new Result(true, "删除成功!");
    }

    //增加购物车里的书
    @ResponseBody
    @RequestMapping("/addCartBookNum")
    public void addCartBookNum(Integer id,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        Cart cart = cartService.findCartBook(id, user.getId());
        int i = cart.getCartNum()+1;
        cart.setCartNum(i);
        cart.setUserId(user.getId());
        cartService.updateCartNum(cart);
    }

    //减少购物车里的书
    @ResponseBody
    @RequestMapping("/subCartBookNum")
    public void subCartBookNum(Integer id,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        Cart cart = cartService.findCartBook(id, user.getId());
        int i = cart.getCartNum()-1;
        cart.setCartNum(i);
        cart.setUserId(user.getId());
        cartService.updateCartNum(cart);
    }

    //修改购物车里的书的勾选状态
    @ResponseBody
    @RequestMapping("/updateStatus")
    public void updateStatus(Integer id,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        Cart cart = cartService.findCartBook(id, user.getId());
        if (cart.getStatus() == 1){
            cart.setStatus(0);
        }else {
            cart.setStatus(1);
        }
        cartService.updateCartBookStatus(cart);
    }

    //修改购物车里的所有书的勾选状态
    @ResponseBody
    @RequestMapping("/updateAllStatus")
    public void updateAllStatus(Integer status,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        Cart cart = new Cart();
        cart.setStatus(status);
        cart.setUserId(user.getId());
        cartService.updateCartBookAllStatus(cart);
    }

    //查看地址是否正确
    @ResponseBody
    @RequestMapping("/settlement")
    public Result<User> settlement(HttpServletRequest request){
        User user= (User) request.getSession().getAttribute("USER_SESSION");
        User user1 = userService.searchUser(user.getId());
        if (user1.getProvince() != null && user1.getCity() != null && user1.getCounty() != null && user1.getPlace() != null){
            return new Result<User>(true,"",user1);
        }
        return new Result<User>(false,"");
    }


}

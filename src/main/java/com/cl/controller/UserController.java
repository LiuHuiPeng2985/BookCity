package com.cl.controller;

import com.cl.domain.Book;
import com.cl.domain.Order;
import com.cl.domain.User;
import com.cl.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //登录
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request){
        try {
            User u=userService.login(user);
            request.getSession().setAttribute("USER_SESSION",u);
            if(u!=null){
                if (u.getIdentity().equals("0")){
                    return "redirect:/jsp/main.jsp";
                }
                else {
                    return "redirect:/jsp/manager.jsp";
                }
            }
            request.setAttribute("msg","邮箱或密码错误");
            return "forward:/jsp/login.jsp";
        }catch(Exception e){
            e.printStackTrace();
            return "forward:/jsp/login.jsp";
        }
    }

    //注册
    @RequestMapping("/register")
    public String register(User user, HttpServletRequest request){
        User user1 = userService.searchEmail(user);
        if (user1 == null){
            user.setIdentity("0");
            userService.register(user);
            request.setAttribute("msg","注册成功");
            return "login";
        }else {
            request.setAttribute("msg","邮箱存在");
            return "login";
        }
    }

    //注销
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            //调用该方法，被删除
            session.invalidate();
            return "forward:/jsp/login.jsp";
        }catch (Exception e){
            e.printStackTrace();
            return "forward:/jsp/login.jsp";
        }
    }

    //查看个人资料
    @RequestMapping("/personal")
    public User searchUser(Integer id,HttpServletRequest request){
        User u = (User) request.getSession().getAttribute("USER_SESSION");
        id = u.getId();
        User result = userService.searchUser(id);
        request.setAttribute("user",result);
        return result;
    }

    //修改个人信息
    @RequestMapping("/updateInformation")
    public String updateInformation(User user,HttpServletRequest request){
        User u = (User) request.getSession().getAttribute("USER_SESSION");
        user.setId(u.getId());
        userService.updateInformation(user);
        user.setEmail(u.getEmail());
        user.setIdentity(u.getIdentity());
        return "forward:/jsp/personal.jsp";
    }


    //查询所有用户(管理员)
    @ResponseBody
    @RequestMapping("/managerUser")
    public ModelAndView managerUser(@RequestParam(defaultValue = "1")Integer pageNum){
        if (pageNum < 1){
            pageNum = 1;
        }
        PageHelper.startPage(pageNum,10);
        List<User> user = userService.listUser();
        PageInfo pageInfo = new PageInfo(user,10);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("manager_user");
        return modelAndView;
    }



}
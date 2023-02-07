package com.cl.config;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/4 11:31
 */

import com.cl.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        String uri = request.getRequestURI();
        if (user != null){
            return true;
        }
        if (uri.indexOf("register") >= 0){
            return true;
        }
        if (uri.indexOf("login")>=0){
            return true;
        }
        request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
        return false;
    }

    //    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        HttpSession session = request.getSession();
//        String uri = request.getRequestURI();
//        if (session.getAttribute("USER_SESSION") != null || uri.indexOf("login")>=0){
//            System.out.println("拦截失败");
//            return true;
//        }
//        System.out.println("拦截成功");
//        request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
//        return false;
//    }
}

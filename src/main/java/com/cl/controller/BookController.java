package com.cl.controller;

import com.cl.domain.Book;
import com.cl.domain.Cart;
import com.cl.domain.User;
import com.cl.entity.Result;
import com.cl.service.BookService;
import com.cl.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/17 11:40
 */
@Controller
public class BookController{

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    //查询全部书籍
    @RequestMapping("/allBooks")
    public ModelAndView allBooks(@RequestParam(defaultValue = "1")Integer pageNum){
        if (pageNum < 1){
            pageNum = 1;
        }
        PageHelper.startPage(pageNum,16);
        List<Book> book = bookService.listBooks();
        PageInfo pageInfo = new PageInfo(book,16);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("allBooks");
        return modelAndView;
    }

    //根据书名查找书籍
    @RequestMapping("/findBookByName")
    public ModelAndView findBookByName(String bookName,@RequestParam(defaultValue = "1")Integer pageNum){
        if (pageNum < 1){
            pageNum = 1;
        }
        PageHelper.startPage(pageNum,8);
        List<Book> book = bookService.findBookByName("%"+bookName+"%");
        PageInfo pageInfo = new PageInfo(book,8);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("allBooks");
        return modelAndView;
    }

    //查看书籍详情
    @RequestMapping("/viewDetail/{id}")
    public ModelAndView viewDetail(@PathVariable Integer id,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER_SESSION");
        Book book = bookService.bookDetails(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("book",book);
        modelAndView.addObject("address",userService.searchUser(user.getId()).getProvince());
        modelAndView.setViewName("book_details");
        return modelAndView;
    }

    //查询全部书籍(管理员)
    @ResponseBody
    @RequestMapping("/managerBook")
    public ModelAndView managerBook(@RequestParam(defaultValue = "1")Integer pageNum){
        if (pageNum < 1){
            pageNum = 1;
        }
        PageHelper.startPage(pageNum,10);
        List<Book> book = bookService.listBooks();
        PageInfo pageInfo = new PageInfo(book,10);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("manager_book");
        return modelAndView;
    }

    //查看书籍(管理员)
    @RequestMapping("/checkOrUpdate/{id}")
    public ModelAndView checkOrUpdate(@PathVariable Integer id){
        Book book = bookService.bookDetails(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("book",book);
        modelAndView.setViewName("update_book");
        return modelAndView;
    }

    //修改书籍(管理员)
    @RequestMapping("/updateBook/{id}")
    public ModelAndView updateBook(@PathVariable Integer id,Book book){
        book.setId(id);
        bookService.updateBook(book);
        ModelAndView modelAndView = new ModelAndView();
        book = bookService.bookDetails(id);
        modelAndView.addObject("book",book);
        modelAndView.setViewName("update_book");
        return modelAndView;
    }

    //删除书籍(管理员)
    @ResponseBody
    @RequestMapping("/deleteBook")
    public Result deleteCartBook(Integer id) {
        bookService.deleteBook(id);
        return new Result(true, "删除成功!");
    }

    //添加书籍(管理员)
    @ResponseBody
    @RequestMapping(value = "/addBook",method = RequestMethod.POST)
    public Result addBook(@RequestParam("file") MultipartFile file,HttpServletRequest request,Book book) throws IOException {
        //路径
        String path = request.getServletContext().getRealPath("/img/bookImg");
        //名称
        String filename = file.getOriginalFilename();
        //后缀
//        String extension = FilenameUtils.getExtension(filename);
//        String fileNewName = UUID.randomUUID().toString().replace("-","")+"."+extension;
        //构建上传目录
//        File fe = new File(path);
//        if (!fe.exists()){
//            fe.mkdir();
//        }
        //把file文件写入指定路径下
        file.transferTo(new File(path+"/"+filename));
//        file.transferTo(new File("D:/IntelliJ IDEA 2021.2.1/书城/src/main/webapp/img/bookImg/"+fileNewName));
        book.setPicture("img/bookImg/"+filename);
//        System.out.println(book.getPicture());
        bookService.addBook(book);
        return new Result(true, "添加图书成功!");
    }

    //根据书名查找书籍
    @RequestMapping("/selectType/{type}")
    public ModelAndView selectType(@PathVariable String type,@RequestParam(defaultValue = "1")Integer pageNum){
        if (pageNum < 1){
            pageNum = 1;
        }
        PageHelper.startPage(pageNum,8);
        List<Book> book = bookService.selectType(type);
        PageInfo pageInfo = new PageInfo(book,8);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("allBooks");
        return modelAndView;
    }

}

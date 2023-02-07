package com.cl.service;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/17 11:40
 */

import com.cl.domain.Book;


import java.util.List;

public interface BookService {

    //查询全部书籍
    List<Book> listBooks();

    //根据书名查找书籍
    List<Book> findBookByName(String bookName);

    //查看书籍详情
    Book bookDetails(Integer id);

    //修改书籍(管理员)
    void updateBook(Book book);

    //删除书籍(管理员)
    void deleteBook(Integer id);

    //添加书籍(管理员)
    void addBook(Book book);

    //选择类型
    List<Book> selectType(String type);
}

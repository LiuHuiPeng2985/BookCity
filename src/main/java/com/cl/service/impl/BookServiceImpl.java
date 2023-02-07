package com.cl.service.impl;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/17 11:40
 */

import com.cl.domain.Book;

import com.cl.mapper.BookMapper;
import com.cl.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    //查询全部书籍
    @Override
    public List<Book> listBooks() {
        return bookMapper.listBooks();
    }

    //根据书名查找书籍
    @Override
    public List<Book> findBookByName(String bookName) {
        return bookMapper.findBookByName(bookName);
    }

    //查看书籍详情
    @Override
    public Book bookDetails(Integer id) {
        return bookMapper.bookDetails(id);
    }

    //修改书籍
    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    //删除书籍(管理员)
    @Override
    public void deleteBook(Integer id) {
        bookMapper.deleteBook(id);
    }

    //添加书籍(管理员)
    @Override
    public void addBook(Book book) {
        bookMapper.addBook(book);
    }

    //选择类型
    @Override
    public List<Book> selectType(String type) {
        return bookMapper.selectType(type);
    }
}

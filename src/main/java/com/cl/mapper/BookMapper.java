package com.cl.mapper;

import com.cl.domain.Book;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/17 11:40
 */
@Repository
public interface BookMapper {

    //查询全部书籍
    @Select("select * from book")
    @Results(id = "bookMap",value = {
            @Result(id = true,column = "book_id",property = "id"),
            @Result(column = "book_name",property = "name"),
            @Result(column = "book_author",property = "author"),
            @Result(column = "book_price",property = "price"),
            @Result(column = "book_number",property = "number"),
            @Result(column = "book_sales",property = "sales"),
            @Result(column = "book_synopsis",property = "synopsis"),
            @Result(column = "book_type",property = "type"),
            @Result(column = "book_picture",property = "picture")
    })
    List<Book> listBooks();

    //根据书名查找书籍
    @Select("select * from book where book_name like #{name} order by book_price")
    @ResultMap("bookMap")
    List<Book> findBookByName(String bookName);

    //查看书籍详情
    @Select("select * from book where book_id = #{id}")
    @ResultMap("bookMap")
    Book bookDetails(Integer id);

    //修改书籍(管理员)
    @Update("update book set book_name = #{name},book_author = #{author},book_price = #{price},book_number = #{number},book_sales = #{sales},book_synopsis = #{synopsis},book_type = #{type} where book_id = #{id}")
    @ResultMap("bookMap")
    void updateBook(Book book);

    //删除书籍(管理员)
    @Delete("delete from book where book_id = #{bookId}")
    @ResultMap("bookMap")
    void deleteBook(Integer id);

    //添加书籍(管理员)
    @Insert("insert into book(book_name,book_author,book_price,book_number,book_sales,book_synopsis,book_type,book_picture) values(#{name},#{author},#{price},#{number},#{sales},#{synopsis},#{type},#{picture})")
    @ResultMap("bookMap")
    void addBook(Book book);

    //选择类型
    @Select("select * from book where book_type = #{type}")
    @ResultMap("bookMap")
    List<Book> selectType(String type);

}

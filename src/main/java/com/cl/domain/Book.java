package com.cl.domain;

import lombok.Getter;
import lombok.Setter;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/16 12:23
 */
@Getter
@Setter
public class Book {
    private Integer id;
    private String name;  //书名
    private String author;  //作者
    private Double price;  //价格
    private Integer number;  //库存数量
    private Integer sales;  //图书销量
    private String synopsis;  //书籍介绍
    private String type;  //书籍类型
    private String picture;  //书籍图片路径

}

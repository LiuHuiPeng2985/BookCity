package com.cl.domain;

import lombok.Getter;
import lombok.Setter;

/*
 * @author  LiuHuiPeng
 * @date    2022/4/27 13:54
 */
@Getter
@Setter
public class Cart {
    private Integer cartId;
    private Integer userId;
    private Integer bookId;
    private Integer cartNum;    //单种书籍数量
    private Integer status;     //书的勾选状态
    Book book;
}

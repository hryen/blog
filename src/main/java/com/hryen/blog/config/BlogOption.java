package com.hryen.blog.config;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

@Component
public final class BlogOption {

    public static String TITLE;

    public static String OWNER;

    public static Integer PAGE_SIZE;

    @Value("${blog.title}")
    public void setTITLE(String title) {
        BlogOption.TITLE = title;
    }

    @Value("${blog.owner}")
    public void setOWNER(String owner) {
        BlogOption.OWNER = owner;
    }

    @Value("${blog.pagesize}")
    public void setPAGE_SIZE(Integer pageSize) {
        BlogOption.PAGE_SIZE = pageSize;
    }
}

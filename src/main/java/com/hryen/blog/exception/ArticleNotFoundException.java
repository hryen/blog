package com.hryen.blog.exception;

public class ArticleNotFoundException extends RuntimeException {

    private static final long serialVersionUID = -5769884614873063588L;

    public ArticleNotFoundException() {
        super("The article not found");
    }
}

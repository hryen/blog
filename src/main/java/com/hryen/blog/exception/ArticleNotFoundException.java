package com.hryen.blog.exception;

public final class ArticleNotFoundException extends BlogException {

    private static final long serialVersionUID = -5769884614873063588L;

    public ArticleNotFoundException() {
        super("The article not found");
    }
}

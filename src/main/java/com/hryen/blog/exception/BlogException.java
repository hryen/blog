package com.hryen.blog.exception;

public abstract class BlogException extends RuntimeException {

    private static final long serialVersionUID = 7057209151612686667L;

    public BlogException(String message) {
        super(message);
    }
}

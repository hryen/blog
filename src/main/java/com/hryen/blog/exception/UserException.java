package com.hryen.blog.exception;

public class UserException extends RuntimeException {

    private static final long serialVersionUID = -7742581025640427134L;

    public UserException(String message) {
        super(message);
    }
}

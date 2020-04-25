package com.hryen.blog.exception;

public class UserLoginException extends RuntimeException {

    private static final long serialVersionUID = -7108397220068505825L;

    public UserLoginException(String message) {
        super(message);
    }
}

package com.hryen.blog.core;

import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.hryen.blog.model.dto.ResponseDTO;
import com.hryen.blog.model.dto.ApiErrorResponseDTO;

@RestControllerAdvice("com.hryen.blog.controller.backend")
public class ApiControllerExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseDTO handleException(Exception e) {
        e.printStackTrace();
        return new ApiErrorResponseDTO(e.getMessage());
    }
}

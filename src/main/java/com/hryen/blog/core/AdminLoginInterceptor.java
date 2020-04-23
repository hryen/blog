package com.hryen.blog.core;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
public class AdminLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {

        Object user = request.getSession().getAttribute("user");
        if(null == user) {
            response.sendRedirect("/admin/login");
            return false;
        } else {
            return true;
        }
    }
}

package com.hryen.blog.core;

import com.hryen.blog.model.entity.User;
import com.hryen.blog.repository.UserRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Component
public class InstallInterceptor implements HandlerInterceptor {

    private UserRepository userRepository;

    public InstallInterceptor(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {

        List<User> all = userRepository.findAll();
        if(all.size() != 0) {
            response.sendRedirect("/admin/login");
            return false;
        } else {
            return true;
        }
    }
}

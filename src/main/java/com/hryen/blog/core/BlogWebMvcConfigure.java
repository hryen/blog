package com.hryen.blog.core;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

@Configuration
public class BlogWebMvcConfigure implements WebMvcConfigurer {

    private InstallInterceptor installInterceptor;
    private AdminLoginInterceptor adminLoginInterceptor;

    public BlogWebMvcConfigure(AdminLoginInterceptor adminLoginInterceptor,
                               InstallInterceptor installInterceptor) {
        this.adminLoginInterceptor = adminLoginInterceptor;
        this.installInterceptor = installInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(installInterceptor).addPathPatterns("/admin/install");

        registry.addInterceptor(adminLoginInterceptor)
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/install", "/admin/login");
    }
}

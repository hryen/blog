package com.hryen.blog.controller.backend;

import com.hryen.blog.model.dto.ApiResponseDTO;
import com.hryen.blog.model.dto.ResponseDTO;
import com.hryen.blog.model.entity.User;
import com.hryen.blog.service.UserService;
import org.springframework.stereotype.Controller;
import com.hryen.blog.config.BlogOption;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class BackendController {

    private UserService userService;
    public BackendController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/install")
    public String getInstallPage() {
        return "backend/install";
    }

    @PostMapping("/install")
    public @ResponseBody ResponseDTO doInstall(@RequestBody User user) {
        User save = userService.save(user);
        return new ApiResponseDTO("Save completed", save);
    }

    @GetMapping("/login")
    public String getLoginPage(Model model, HttpSession session) {
        if(null == session.getAttribute("user")) {
            this.setModelAttributes(model);
            return "backend/login";
        } else {
            return "redirect:/admin/article/list";
        }
    }

    @PostMapping("/login")
    public @ResponseBody ResponseDTO doLogin(@RequestBody User user, HttpSession session) {
        User loginUser = userService.login(user);
        session.setAttribute("user", loginUser);
        return new ApiResponseDTO("Login successful", null);
    }

    @GetMapping("/logout")
    public String doLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }

    @GetMapping
    public String getIndexPage() {
        return "redirect:/admin/article/list";
    }

    @GetMapping("/article/list")
    public String getArticleListPage(Model model) {
        this.setModelAttributes(model);
        return "backend/article/list";
    }

    @GetMapping("/article/new")
    public String getArticleNewPage(Model model) {
        this.setModelAttributes(model);
        return "backend/article/new";
    }

    @GetMapping("/article/edit/{id}")
    public String getArticleEditPage(@PathVariable("id") String id, Model model) {
        this.setModelAttributes(model);
        model.addAttribute("id", id);
        return "backend/article/edit";
    }

    private void setModelAttributes(Model model) {
        model.addAttribute("blogTitle", BlogOption.TITLE);
    }

}

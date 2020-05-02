package com.hryen.blog.controller.frontend;

import com.hryen.blog.config.BlogOption;
import com.hryen.blog.model.entity.Article;
import com.hryen.blog.service.ArticleService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class IndexController {

    private final ArticleService articleService;
    public IndexController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @GetMapping
    public String getIndex(Model model) {
        this.doGetIndex(1, model);
        return "frontend/index";
    }

    @GetMapping("/page/{pageNumber}")
    public String getIndexWithPage(@PathVariable("pageNumber") Integer pageNumber, Model model) {
        this.doGetIndex(pageNumber, model);
        return "frontend/index";
    }

    private void doGetIndex(Integer pageNumber, Model model) {
        Page<Article> articles = articleService.listArticleWithPage(pageNumber);
        model.addAttribute("articleList", articles.getContent());
        model.addAttribute("totalPages", articles.getTotalPages());
        model.addAttribute("pageNumber", pageNumber);

        model.addAttribute("blogTitle", BlogOption.TITLE);
        model.addAttribute("blogOwner", BlogOption.OWNER);
    }

}

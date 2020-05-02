package com.hryen.blog.controller.frontend;

import com.hryen.blog.config.BlogOption;
import com.hryen.blog.exception.ArticleNotFoundException;
import com.hryen.blog.model.entity.Article;
import com.hryen.blog.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ArticleController {

    private final ArticleService articleService;
    public ArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @GetMapping("/article/{permalink}")
    public String getArticleByPermalink(@PathVariable("permalink") String permalink, Model model) {

        try {
            Article article = articleService.findByPermalinkIgnoreCase(permalink);
            model.addAttribute("article", article);
        } catch (ArticleNotFoundException e) {
            return "error/404";
        }

        model.addAttribute("blogTitle", BlogOption.TITLE);
        model.addAttribute("blogOwner", BlogOption.OWNER);

        return "frontend/article";
    }
}

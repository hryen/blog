package com.hryen.blog.controller.backend.api;

import com.google.common.collect.Maps;
import com.hryen.blog.model.dto.ApiResponseDTO;
import com.hryen.blog.model.dto.ResponseDTO;
import com.hryen.blog.model.entity.Article;
import com.hryen.blog.service.ArticleService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@RequestMapping("/admin/api/articles")
public class ApiArticleController {

    private final ArticleService articleService;
    public ApiArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @PostMapping
    public ResponseDTO save(@RequestBody Article article) {
        Article save = articleService.save(article);
        return new ApiResponseDTO("Save completed", save);
    }

    @DeleteMapping("/{id}")
    public ResponseDTO deleteById(@PathVariable("id") String id) {
        Article delete = articleService.deleteById(id);
        return new ApiResponseDTO("Delete completed", delete);
    }

    @PutMapping("/{id}")
    public ResponseDTO updateById(@PathVariable("id") String id, @RequestBody Article article) {
        Article update = articleService.updateById(id, article);
        return new ApiResponseDTO("Update completed", update);
    }

    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable("id") String id) {
        Article article = articleService.findById(id);
        return new ApiResponseDTO("Find completed", article);
    }

    @GetMapping
    public ResponseDTO list(Integer page, Integer limit) {
        Page<Article> articles = articleService.listArticleWithPageAndLimit(page, limit);

        HashMap<String, Object> dataMap = Maps.newHashMap();
        dataMap.put("items", articles.getContent());
        dataMap.put("totalCount", articles.getTotalElements());
        dataMap.put("totalPage", articles.getTotalPages());

        return new ApiResponseDTO("Find completed", dataMap);
    }

}

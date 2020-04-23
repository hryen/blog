package com.hryen.blog.repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.hryen.blog.model.entity.Article;


@Repository
public interface ArticleRepository extends MongoRepository<Article, String> {

    Article findByPermalinkIgnoreCase(String permalink);

    boolean existsByPermalinkIgnoreCase(String permalink);
}

package com.hryen.blog.service;

import com.google.common.base.Strings;
import com.hryen.blog.config.BlogOption;
import com.hryen.blog.exception.*;
import com.hryen.blog.model.entity.Article;
import com.hryen.blog.repository.ArticleRepository;
import com.hryen.blog.util.MarkdownUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;

@Service
public final class ArticleService {

    private final ArticleRepository articleRepository;

    public ArticleService(ArticleRepository articleRepository) {
        this.articleRepository = articleRepository;
    }


    /**
     * Save article
     *
     * @param article Article entity
     * @return Saved article entity
     */
    public Article save(Article article) {

        // 1.Check if there is no permalink
        if(Strings.isNullOrEmpty(article.getPermalink())) {
            throw new IllegalArgumentException("The article permalink cannot be empty");
        }

        // 2.Check if the permalink already exists
        if(articleRepository.existsByPermalinkIgnoreCase(article.getPermalink())) {
            throw new IllegalArgumentException("The article permalink already exists");
        }

        // 3.Check if there is no title
        if(Strings.isNullOrEmpty(article.getTitle())) {
            throw new IllegalArgumentException("The article title cannot be empty");
        }

        // 4.Check if there is no content
        if(Strings.isNullOrEmpty(article.getMarkdownContent())) {
            throw new IllegalArgumentException("The article content cannot be empty");
        }

        // 5.Parser markdown
        String html = MarkdownUtils.renderHtml(article.getMarkdownContent());
        article.setHtmlContent(html);

        // 6.Set date
        Date now = new Date();
        article.setPublished(now);
        article.setModified(now);

        return articleRepository.save(article);
    }


    /**
     * Update article by id
     *
     * @param id Article's id
     * @param article Article entity
     * @return Updated article
     */
    public Article updateById(String id, Article article) {
        Optional<Article> oldArticle = articleRepository.findById(id);
        oldArticle.orElseThrow(ArticleNotFoundException::new);

        // 1.Check if there is no permalink
        if(Strings.isNullOrEmpty(article.getPermalink())) {
            throw new IllegalArgumentException("The article permalink cannot be empty");
        }

        // 2.Check if the permalink already exists
        // 如果根据此固定链接查到了文章 并且查到的文章的id跟当前文章id不一致
        Article byPermalink = articleRepository.findByPermalinkIgnoreCase(article.getPermalink());
        if(null != byPermalink) {
            if(!(id.equals(byPermalink.getId()))) {
                throw new IllegalArgumentException("The article permalink already exists");
            }
        }

        // 3.Check if there is no title
        if(Strings.isNullOrEmpty(article.getTitle())) {
            throw new IllegalArgumentException("The article title cannot be empty");
        }

        // 4.Check if there is no content
        if(Strings.isNullOrEmpty(article.getMarkdownContent())) {
            throw new IllegalArgumentException("The article content cannot be empty");
        }

        // 5.Parser markdown
        String html = MarkdownUtils.renderHtml(article.getMarkdownContent());
        article.setHtmlContent(html);

        // 6.Set id
        article.setId(id);

        // 7.Set date
        article.setPublished(oldArticle.get().getPublished());
        article.setModified(new Date());

        return articleRepository.save(article);
    }


    /**
     * TODO
     * Delete article by id
     *
     * @param id Article's id
     * @return Deleted article
     */
    public Article deleteById(String id) {
        Optional<Article> article = articleRepository.findById(id);

        article.orElseThrow(ArticleNotFoundException::new);

        articleRepository.deleteById(id);

        return article.get();
    }





















    /**
     * List article with page
     *
     * @param page Page number, start at 1
     * @return Article List
     */
    public Page<Article> listArticleWithPage(Integer page) {
        Sort published = Sort.by(Sort.Direction.DESC, "published");
        PageRequest pageRequest = PageRequest.of(page-1, BlogOption.PAGE_SIZE, published);
        return articleRepository.findAll(pageRequest);
    }

    /**
     * List articles with page and page size
     *
     * @param page Page number
     * @param limit Page size
     * @return Article list
     */
    public Page<Article> listArticleWithPageAndLimit(Integer page, Integer limit) {
        Sort published = Sort.by(Sort.Direction.DESC, "published");
        PageRequest pageRequest = PageRequest.of(page-1, limit, published);
        return articleRepository.findAll(pageRequest);
    }

    /**
     * Find article by id
     *
     * @param id Article's id
     * @return Article entity
     */
    public Article findById(String id) {
        Optional<Article> article = articleRepository.findById(id);
        article.orElseThrow(ArticleNotFoundException::new);
        return article.get();
    }

    /**
     * find by permalink
     *
     * @param permalink Article's permalink
     * @return Article entity
     */
    public Article findByPermalinkIgnoreCase(String permalink) {
        Article article = articleRepository.findByPermalinkIgnoreCase(permalink);
        if (null == article) {
            throw new ArticleNotFoundException();
        }
        return article;
    }
}

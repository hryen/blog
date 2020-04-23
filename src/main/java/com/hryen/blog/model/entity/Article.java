package com.hryen.blog.model.entity;

import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.annotation.Id;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;

@Data
@Document
public class Article {

    @Id
    private String id;

    private String title;

    private String permalink;

    private String markdownContent;

    private String htmlContent;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date published;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date modified;
}

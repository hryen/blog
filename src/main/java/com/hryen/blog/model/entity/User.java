package com.hryen.blog.model.entity;

import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.annotation.Id;

@Data
@Document
public class User {

    @Id
    private String id;

    private String username;

    private String password;
}

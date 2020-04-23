package com.hryen.blog.repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.hryen.blog.model.entity.User;


@Repository
public interface UserRepository extends MongoRepository<User, String> {

    User findByUsername(String username);
}

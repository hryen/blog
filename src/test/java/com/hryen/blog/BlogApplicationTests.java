package com.hryen.blog;

import com.hryen.blog.util.bcrypt.BCryptPasswordEncoder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BlogApplicationTests {

    @Test
    void contextLoads() {

        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String encode = bCryptPasswordEncoder.encode("123.com");
        System.out.println(encode);
    }

}

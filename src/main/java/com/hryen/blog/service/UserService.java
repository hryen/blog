package com.hryen.blog.service;

import com.google.common.base.Strings;
import com.hryen.blog.exception.UserException;
import com.hryen.blog.exception.UserLoginException;
import com.hryen.blog.model.dto.UserUpdatePasswordRequestDTO;
import com.hryen.blog.model.entity.User;
import com.hryen.blog.repository.UserRepository;
import com.hryen.blog.util.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public final class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }


    public User login(User user) {
        if(Strings.isNullOrEmpty(user.getUsername()) || Strings.isNullOrEmpty(user.getPassword())) {
            throw new UserLoginException("Incorrect username or password");
        }

        User byUsername = userRepository.findByUsername(user.getUsername());
        if(null != byUsername) {
            boolean matches = passwordEncoder.matches(user.getPassword(), byUsername.getPassword());
            if(matches) {
                return byUsername;
            }
        }

        throw new UserLoginException("Incorrect username or password");
    }

    /**
     * 下面两个方法还没用到过
     */
    public User updatePassword(String id, UserUpdatePasswordRequestDTO dto) {
        Optional<User> optionalUser = userRepository.findById(id);
        if(optionalUser.isPresent()) {
            User user = optionalUser.get();
            boolean matches = passwordEncoder.matches(dto.getCurrentPassword(), user.getPassword());
            if(matches) {
                user.setPassword(passwordEncoder.encode(dto.getNewPassword()));
                return userRepository.save(user);
            } else {
                throw new UserException("Current password do not match");
            }
        } else {
            throw new UserException("The user cannot be found");
        }
    }

    public User save(User user) {
        if(Strings.isNullOrEmpty(user.getUsername())) {
            throw new UserException("The username cannot be empty");
        }

        if(Strings.isNullOrEmpty(user.getPassword())) {
            throw new UserException("The password cannot be empty");
        }

        String encode = passwordEncoder.encode(user.getPassword());
        user.setPassword(encode);

        return userRepository.save(user);
    }
}

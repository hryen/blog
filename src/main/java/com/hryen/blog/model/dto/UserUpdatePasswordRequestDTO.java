package com.hryen.blog.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserUpdatePasswordRequestDTO {
    private String currentPassword;
    private String newPassword;
}

package com.hryen.blog.controller.backend.api;

import com.hryen.blog.model.dto.ApiResponseDTO;
import com.hryen.blog.model.dto.ResponseDTO;
import com.hryen.blog.model.dto.UserUpdatePasswordRequestDTO;
import com.hryen.blog.model.entity.User;
import com.hryen.blog.service.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/api/users")
public class ApiUserController {

    private final UserService userService;
    public ApiUserController(UserService userService) {
        this.userService = userService;
    }

    @PutMapping("/{id}")
    public ResponseDTO update(@PathVariable("id") String id, UserUpdatePasswordRequestDTO dto) {
        User user = userService.updatePassword(id, dto);
        return new ApiResponseDTO("Update completed", user);
    }

}

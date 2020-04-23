package com.hryen.blog.model.dto;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Setter
@Getter
public class ApiErrorResponseDTO implements ResponseDTO {

    private Integer code;
    private String msg;
    private LocalDateTime timestamp;

    public ApiErrorResponseDTO(String msg) {
        this.code = 1;
        this.msg = msg;
        this.timestamp = LocalDateTime.now();
    }
}

package com.hryen.blog.model.dto;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Getter
@Setter
public class ApiResponseDTO implements ResponseDTO {

    private Integer code;
    private String msg;
    private Object data;
    private LocalDateTime timestamp;

    public ApiResponseDTO(String msg, Object data) {
        this.code = 0;
        this.msg = msg;
        this.data = data;
        this.timestamp = LocalDateTime.now();
    }
}

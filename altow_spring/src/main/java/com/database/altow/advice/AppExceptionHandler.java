package com.database.altow.advice;

import com.database.altow.exception.UserNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class AppExceptionHandler {

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(UserNotFoundException.class)
    public Map<String,Object> handleLoginException(UserNotFoundException exception){
        Map<String,Object> errorResponse = new HashMap<>();
        Map<String, String> errorData = new HashMap<>();
        errorData.put("message", "Please enter the code sent");
        errorData.put("code", "otp_is_not_correct");
        errorData.put("title", "Wrong code");
        errorResponse.put("data",errorData);
        errorResponse.put("message","otp_is_not_correct");
        errorResponse.put("status","error");
   return  errorResponse;
 }

}

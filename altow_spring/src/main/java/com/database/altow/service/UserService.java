package com.database.altow.service;

import com.database.altow.entity.UserInfo;
import com.database.altow.entity.phoneNumber;
import com.database.altow.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository repository;

    @Autowired
    private BCryptPasswordEncoder encoder;
    public void addUserByUser (UserInfo user){
        user.setPassword(encoder.encode(user.getPassword()));
        repository.save(user);
    }
    public UserInfo checkUser (phoneNumber phoneNumber){
        return repository.findByMobilePhone(phoneNumber.getPhoneNumber());
    }
    public UserInfo updateUserPassword(UserInfo user ){
        UserInfo existingUser= repository.findByMobilePhone(user.getMobilePhone());
        existingUser.setPassword(encoder.encode(user.getPassword()));
        return  repository.save(existingUser);
    }
    public void removeUserByUser (int id){
        UserInfo user = repository.findById(id);
        repository.delete(user);
    }
}

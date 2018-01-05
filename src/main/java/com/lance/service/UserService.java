package com.lance.service;


import com.lance.bean.Users;

/**
 * Created by lance on 2018/1/4.
 */
public interface UserService {
    public Users findUser(Integer id);
    public Users findUserByUserName (String username);
}

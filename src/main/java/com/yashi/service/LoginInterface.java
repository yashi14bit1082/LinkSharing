package com.yashi.service;

import com.yashi.model.User;

/**
 * Created by yashi on 10-07-2017.
 */
public interface LoginInterface {

    default String loginUser(User user)
    {
       return "error";
    }
}

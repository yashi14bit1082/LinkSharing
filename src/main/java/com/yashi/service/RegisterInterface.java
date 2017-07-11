package com.yashi.service;

import com.yashi.model.User;

/**
 * Created by yashi on 10-07-2017.
 */
public interface RegisterInterface {

    default String registerUser(User user)
    {
        return "error";
    }

    default boolean validateUsername(String username)
    {
        return false;
    }
}
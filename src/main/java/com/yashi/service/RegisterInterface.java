package com.yashi.service;

import com.yashi.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by yashi on 10-07-2017.
 */
public interface RegisterInterface {

    default String registerUser(User user, HttpServletRequest request)
    {
        return "error";
    }

    default boolean validateUsername(String username)
    {
        return false;
    }
}
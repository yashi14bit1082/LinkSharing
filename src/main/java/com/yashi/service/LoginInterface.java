package com.yashi.service;

import com.yashi.model.User;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yashi on 10-07-2017.
 */
public interface LoginInterface {

    default String loginUser(String credential, String password, HttpServletRequest request)
    {
       return "error";
    }
}

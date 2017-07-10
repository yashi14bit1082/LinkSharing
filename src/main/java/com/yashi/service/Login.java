package com.yashi.service;

import com.yashi.dao.LoginDaoInterface;
import com.yashi.model.User;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 10-07-2017.
 */
public class Login implements LoginInterface{
    @Autowired
    LoginDaoInterface loginDaoInterface;

    @Override
    public String loginUser(User user) {
        boolean fetchresult = loginDaoInterface.loginUser(user);

        if(true)
        return "xyz";
        else
            return "home";
    }
}

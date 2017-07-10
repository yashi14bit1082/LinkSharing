package com.yashi.service;

import com.yashi.dao.RegisterDaoInterface;
import com.yashi.model.User;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 10-07-2017.
 */
public class Register implements RegisterInterface {

    @Autowired
    RegisterDaoInterface registerDaoInterface;

    @Override
    public String registerUser(User user) {
        boolean response = registerDaoInterface.saveRegisteredUser(user);
        if(response)
            return "xyz";
        else
            return "home";
    }
}

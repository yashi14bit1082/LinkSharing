package com.yashi.service;

import com.yashi.dao.RegisterDaoInterface;
import com.yashi.model.User;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by yashi on 10-07-2017.
 */
public class Register implements RegisterInterface {

    @Autowired
    RegisterDaoInterface registerDaoInterface;

    @Override
    public String registerUser(User user,HttpServletRequest request) {
        boolean response = registerDaoInterface.saveRegisteredUser(user);
        HttpSession session = request.getSession();

        if(response) {
            session.setAttribute("username",user.getUsername());
            return "dashboard";
        }
            else
            return "home";
    }

    @Override
    public boolean validateUsername(String username) {

        boolean result = registerDaoInterface.validateUsernameDao(username);
        return result;
    }
}

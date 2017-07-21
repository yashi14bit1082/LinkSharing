package com.yashi.service;

import com.yashi.dao.LoginDaoInterface;
import com.yashi.model.User;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by yashi on 10-07-2017.
 */
public class Login implements LoginInterface{
    @Autowired
    LoginDaoInterface loginDaoInterface;

    @Override
    public String loginUser(String credential, String password, HttpServletRequest request) {
        User fetchedLoginResult = loginDaoInterface.loginUser(credential,password);
        HttpSession session = request.getSession();

        if(fetchedLoginResult!=null) {

            session.setAttribute("username",fetchedLoginResult.getUsername());
            session.setAttribute("userDetails",fetchedLoginResult);

                return "dashboard";
        }

        else
            return "home";
    }
}

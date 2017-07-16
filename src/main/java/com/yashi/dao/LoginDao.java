package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

/**
 * Created by yashi on 10-07-2017.
 */


public class LoginDao implements LoginDaoInterface,startSession,stopSession {

    @Override
    public User loginUser(String credential,String password) {


        String checkCredentialForUsernameOREmail;
        String queryString;

        if(credential.matches("/([a-zA-Z0-9]+)([\\_\\.\\-{1}])?([a-zA-Z0-9]+)\\@([a-zA-Z0-9]+)([\\.])([a-zA-Z\\.]+)/g"))
        {
            checkCredentialForUsernameOREmail = "email";
        }
        else
        {
            checkCredentialForUsernameOREmail = "username";
        }

        Session session = startsession();
        if(checkCredentialForUsernameOREmail.equals("username"))
        {
            queryString = "from User where username = :username AND password = :password AND active = true";
        }
        else {
           queryString = "from User where email = :username AND password = :password AND active = true";
        }
        Query query = session.createQuery(queryString);
        query.setString("username", credential);
        query.setString("password",password);
        Object queryResult = query.uniqueResult();
        User user1 = (User)queryResult;
        stopsession(session);
        return user1;
    }
}

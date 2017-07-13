package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Date;

/**
 * Created by yashi on 10-07-2017.
 */
public class RegisterDao implements RegisterDaoInterface,startSession,stopSession {
    @Override
    public boolean saveRegisteredUser(User user) {
            Session session = startsession();

       Integer committed = (Integer) session.save(user);
        stopsession(session);

        if(committed>0)
        return true;

        else
            return false;

    }

    @Override
    public boolean validateUsernameDao(String credential) {

        boolean result;
        Session session = startsession();
        String queryString;
        if(credential.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"))
        {
            queryString = "from User where email = :credential";

        }
        else
        {

            queryString = "from User where username = :credential";
        }

    Query query = session.createQuery(queryString);
        query.setString("credential", credential);
    Object queryResult = query.uniqueResult();
    User user1 = (User)queryResult;

        if(user1!=null)
            result = true;

        else
            result = false;

        return result;
    }
}

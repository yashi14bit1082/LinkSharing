package com.yashi.dao;

import com.yashi.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Date;

/**
 * Created by yashi on 10-07-2017.
 */
public class RegisterDao implements RegisterDaoInterface{
    @Override
    public boolean saveRegisteredUser(User user) {

        Session session=sessionFactory.openSession();
        session.beginTransaction();

       Integer committed = (Integer) session.save(user);
        session.getTransaction().commit();
        session.close();

        if(committed>0)
        return true;

        else
            return false;

    }
}

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

        user.setDateCreated(new Date());
        user.setDateUpdated(new Date());
        user.setAdmin(false);
        user.setActive(true);

        session.save(user);
        session.getTransaction().commit();
        session.close();

        return true;

    }
}

package com.yashi.dao;

import com.yashi.model.User;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Created by yashi on 10-07-2017.
 */
public interface RegisterDaoInterface {

  final  SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();

        default boolean saveRegisteredUser(User user)
        {
            return false;
        }
}

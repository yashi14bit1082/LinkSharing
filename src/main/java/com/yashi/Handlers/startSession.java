package com.yashi.Handlers;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.servlet.http.HttpSession;

/**
 * Created by yashi on 11-07-2017.
 */
public interface startSession {
    final SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();

    default Session startsession()
    {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        return session;
    }
}

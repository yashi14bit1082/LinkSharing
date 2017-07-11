package com.yashi.Handlers;

import org.hibernate.Session;

/**
 * Created by yashi on 11-07-2017.
 */
public interface stopSession {

    default void stopsession(Session session)
    {
        session.getTransaction().commit();
        session.close();
    }
}

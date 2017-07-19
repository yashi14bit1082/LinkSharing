package com.yashi;

import com.yashi.Handlers.startSession;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * Created by yashi on 19-07-2017.
 */
public class Main implements startSession {

    public static void main(String[] args) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String queryString = "update User u set u.password = :password where u.email = :email";
        Query query = session.createQuery(queryString);

        query.setString("password","1234");
        query.setString("email","yashi22gupta@gmail.com");
        Integer response = query.executeUpdate();
        session.getTransaction().commit();
        session.close();
        System.out.println(response);
    }

}

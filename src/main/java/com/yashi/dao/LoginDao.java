package com.yashi.dao;

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
public class LoginDao implements LoginDaoInterface {

    @Override
    public boolean loginUser(User user) {

     //   Session session=sessionFactory.openSession();

        /*AnnotationConfiguration config = new AnnotationConfiguration();
        config.addAnnotatedClass(User.class);
        SessionFactory factory= config.configure().buildSessionFactory();*/
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String queryString = "from User where username = :username AND password = :password";
        Query query = session.createQuery(queryString);
        query.setString("username", user.getUsername());
        query.setString("password",user.getPassword());
        Object queryResult = query.uniqueResult();
        User user1 = (User)queryResult;
        session.getTransaction().commit();
        session.close();
        if(user1!=null)
            return true;
        else
            return false;

    }
}

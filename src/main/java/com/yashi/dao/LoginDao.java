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
    public boolean loginUser(String credential,String password) {

     //   Session session=sessionFactory.openSession();

        /*AnnotationConfiguration config = new AnnotationConfiguration();
        config.addAnnotatedClass(User.class);
        SessionFactory factory= config.configure().buildSessionFactory();*/

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

        Session session = sessionFactory.openSession();
        session.beginTransaction();
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
        session.getTransaction().commit();
        session.close();
        if(user1!=null)
            return true;
        else
            return false;
    }
}

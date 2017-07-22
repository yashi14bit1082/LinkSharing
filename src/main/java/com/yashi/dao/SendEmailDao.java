package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.EmailOTP;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 14-07-2017.
 */
public class SendEmailDao implements SendEmailDaoInterface,startSession,stopSession {

    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionDaoInterface;

    @Override
    public Integer sendEmail(String... a) {

        Integer response = 0;
        Session session ;
        EmailOTP emailOTP = new EmailOTP();

        boolean dataExist = databaseConnectionDaoInterface.checkDataExistence("EmailOTP","emailSendTo",a[0]);
        System.out.println(dataExist);
        if(dataExist==false)
        {
            session = startsession();
            emailOTP.setEmailSendTo(a[0]);
            emailOTP.setOtp(a[1]);
            response = (Integer)session.save(emailOTP);
            stopsession(session);

        }
       else
        {
            session = startsession();
            response = databaseConnectionDaoInterface.updateTable("EmailOTP","Otp",a[1],"emailSendTo",a[0]);
            stopsession(session);

        }

        return response;


    }

    @Override
    public Integer updatePassword(String... a) {

        Session session = startsession();
        String queryString = "update User set password = :password where email = :email";
        Query query = session.createQuery(queryString);
        query.setString("password",a[0]);
        query.setString("email",a[1]);
        Integer response = (Integer)query.executeUpdate();


        queryString = "delete EmailOTP where emailSendTo = :email";
        query = session.createQuery(queryString);
        query.setString("email",a[1]);
        query.executeUpdate();


        stopsession(session);

        return response;
    }
}

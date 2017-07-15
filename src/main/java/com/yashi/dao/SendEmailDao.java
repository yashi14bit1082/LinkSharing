package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.EmailOTP;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * Created by yashi on 14-07-2017.
 */
public class SendEmailDao implements SendEmailDaoInterface,startSession,stopSession {
    @Override
    public Integer sendEmail(String... a) {

        Integer response = 0;
        Session session = startsession();
        EmailOTP emailOTP = new EmailOTP();

        String queryString = "from EmailOTP where emailSendTo = :email";
        Query query = session.createQuery(queryString);
        query.setString("email",a[0]);
        Object queryResult = query.uniqueResult();

        if(queryResult==null)
        {
            emailOTP.setEmailSendTo(a[0]);
            emailOTP.setOtp(a[1]);
            response = (Integer)session.save(emailOTP);

        }
        else
        {
            String queryString1 = "update EmailOTP set Otp = :Otp where emailSendTo = :email";
            Query query1 = session.createQuery(queryString1);
            query1.setString("Otp",a[1]);
            query1.setString("email",a[0]);
            response = query1.executeUpdate();

        }
        stopsession(session);
        return response;


    }
}

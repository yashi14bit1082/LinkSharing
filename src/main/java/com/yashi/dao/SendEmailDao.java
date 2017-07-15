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
        Session session = startsession();
        EmailOTP emailOTP = new EmailOTP();

        boolean dataExist = databaseConnectionDaoInterface.checkDataExistence("EmailOTP","emailSendTo",a[0]);

        if(dataExist==false)
        {
            emailOTP.setEmailSendTo(a[0]);
            emailOTP.setOtp(a[1]);
            response = (Integer)session.save(emailOTP);

        }
        else
        {
            response = databaseConnectionDaoInterface.updateTable("EmailOTP","Otp",a[1],"emailSendTo",a[0]);

        }
        stopsession(session);
        return response;


    }
}

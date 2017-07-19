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
        String email = a[0];
        String otp = a[1];
        boolean dataExist = databaseConnectionDaoInterface.checkDataExistence("EmailOTP","emailSendTo",email);

        System.out.println("aaya dataExistResult "+dataExist);

        if(!dataExist)
        {
            System.out.println("data table mein nhi h...nyii entry h");
            emailOTP.setEmailSendTo(email);
            emailOTP.setOtp(otp);
            session.save(emailOTP);

            response = 1 ;


        }
        else
        {
            System.out.println("data alredy table mein h....update krna h");
            response = databaseConnectionDaoInterface.updateTable("EmailOTP","Otp",otp,"emailSendTo",email);


            System.out.println("update table ka response "+response);

        }
        stopsession(session);
        return response;


    }

    @Override
    public Integer updatePassword(String... a) {

        Session session = startsession();
        String queryString = "update User u set u.password = :password where u.email = :email";
        Query query = session.createQuery(queryString);
        System.out.println(queryString +" "+a[0]+a[1]);
        query.setString("password",a[0]);
        query.setString("email",a[1]);
        Integer response = (Integer)query.executeUpdate();
        return response;

    }

    @Override
    public void deleteOTPEntry(String... a) {
        String email = a[0];
      Session  session = startsession();
        String  queryString = "delete EmailOTP where emailSendTo = :email";
        Query query = session.createQuery(queryString);
        query.setString("email",email);
        query.executeUpdate();
    }



}

package com.yashi.service;

import com.yashi.Handlers.EmailHandler;
import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.dao.SendEmailDaoInterface;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.concurrent.ThreadLocalRandom;

/**
 * Created by yashi on 14-07-2017.
 */


public class SendEmailService implements SendEmailServiceInterface {
    @Autowired
    SendEmailDaoInterface sendEmailDaoInterface;
    @Autowired
    EmailHandler emailHandler;
    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionDaoInterface;

    @Override
    public Integer sendEmail(String... a) {

        Integer response = 0;

        if(a[1].equals("OTPforPasswordReset")) {
            int min = 1000;
            int max = 9999;
            int randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);

            String toAddr = a[0];
            String fromAddr = "yashi.gupta@tothenew.com";
            String subject = "Reset Password";
            String body = "Your OTP for password reset is " + randomNum;
            emailHandler.ReadyToSendEmail(toAddr, fromAddr, subject, body);
            String email = a[0];
            response = sendEmailDaoInterface.sendEmail(email, randomNum + "");

        }
        else if(a[1].equals("TopicSubscriptionMail"))
        {
            String toAddr = a[0];
            String fromAddr = "yashi.gupta@tothenew.com";
            String subject = "Topic Subscription Invitation";
            String body = "Click here for subscribing";

            emailHandler.ReadyToSendEmail(toAddr, fromAddr, subject, body);
            response = 1;
        }
        return response;
    }

    @Override
    public boolean validateEmailOtp(String... a) {
        String email = a[0];
        String otp = a[1];

        boolean response = databaseConnectionDaoInterface.checkDataExistence("EmailOTP","emailSendTo",email,"Otp",otp);
        return response;
    }

    @Override
    public Integer updatePassword(String... a) {
        String password=a[0];
        String email=a[1];
        Integer response = sendEmailDaoInterface.updatePassword(password,email);
        sendEmailDaoInterface.deleteOTPEntry(email);

        return response;
    }
}

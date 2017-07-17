package com.yashi.service;

import com.yashi.Handlers.EmailHandler;
import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.dao.SendEmailDaoInterface;
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

            response = sendEmailDaoInterface.sendEmail(a[0], randomNum + "");

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
    public Boolean validateEmailOtp(String... a) {

        Boolean response = databaseConnectionDaoInterface.checkDataExistence("EmailOTP","emailSendTo",a[0],"Otp",a[1]);
        return response;
    }

    @Override
    public Integer updatePassword(String... a) {

        Integer response = databaseConnectionDaoInterface.updateTable("User","password",a[0],"email",a[1]);
        return response;
    }
}

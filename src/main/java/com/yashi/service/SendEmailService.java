package com.yashi.service;

import com.yashi.Handlers.EmailHandler;
import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.dao.SendEmailDaoInterface;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.UnsupportedEncodingException;
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
    public Integer sendEmail(String... a) throws UnsupportedEncodingException {

        Integer response = 0;

        if(a[1].equals("OTPforPasswordReset")) {
            int min = 1000;
            int max = 9999;
            int randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);

            String toAddr = a[0];
            String fromAddr = "yashi.gupta@tothenew.com";
            String subject = "Reset Password";
            String body = "Your OTP for password reset is " + randomNum;

            EmailHandler.send(toAddr,subject,body);


            response = sendEmailDaoInterface.sendEmail(a[0], randomNum + "");

        }
        else if(a[3].equals("TopicSubscriptionMail"))
        {

            String toAddr = a[0];
            String topicInvite = a[1];
            String sender = a[2];

            String fromAddr = "yashi.gupta@tothenew.com";
            String subject = "Topic Subscription Invitation";
            String body = "<html><body><p>An invitation has been send from "+toAddr+" for "+topicInvite+".<a href='http://10.1.12.24:8080/subscribeToInvite?name="+topicInvite+"'>Click here</a> for subscribing.</p></body></html>";

            EmailHandler.send(toAddr, subject, body);
            response = 1;
        }
        return response;
    }

    @Override
    public boolean validateEmailOtp(String... a) {

        boolean response = databaseConnectionDaoInterface.checkDataExistence("EmailOTP","emailSendTo",a[0],"Otp",a[1]);
        return response;
    }

    @Override
    public Integer updatePassword(String... a) {

        String password = a[0];
        String email = a[1];

        Integer response = sendEmailDaoInterface.updatePassword(password,email);
        return response;
    }
}

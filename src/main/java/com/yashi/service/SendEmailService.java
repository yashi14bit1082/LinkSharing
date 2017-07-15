package com.yashi.service;

import com.yashi.Handlers.EmailHandler;
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

    @Override
    public Integer sendEmail(String... a) {

        int min = 1000;
        int max = 9999;
        int randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);

        ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("main/resources/servlet-config.xml");
        EmailHandler emailHandler = (EmailHandler) context.getBean("mailSender");
     /*  EmailHandler emailHandler = new EmailHandler();*/
       String toAddr = a[0];
        String fromAddr = "yashi.gupta@tothenew.com";

        // email subject
        String subject = "Reset Password";

        // email body
        String body = "Your OTP for password reset is "+randomNum;
        emailHandler.ReadyToSendEmail(toAddr, fromAddr, subject, body);
        System.out.println("xfcghjklhbcgfxdgh");
        return 0;
    }
}

package com.yashi.Handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

/**
 * Created by yashi on 14-07-2017.
 */

@Service
public class EmailHandler {


   static final String password="LastChance@1";
   static final String from="yashi.gupta@tothenew.com";

    public static Boolean send(String toAddr,String subject,String body) throws UnsupportedEncodingException {
        //Get properties object
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        //get Session
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from,password);
                    }
                });
        //compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO ,new InternetAddress(toAddr));
            message.setSubject(subject);

            message.setFrom(new InternetAddress(from,"noreply@LinkSharing"));
            message.setContent(body,"text/html");
            Transport.send(message);
            System.out.println("message sent successfully");
            return true;
        } catch (MessagingException e) {throw new RuntimeException(e);}

    }

}





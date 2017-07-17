package com.yashi.Handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

/**
 * Created by yashi on 14-07-2017.
 */

@Service
public class EmailHandler {
    @Autowired
    private MailSender mailSender;

    public void ReadyToSendEmail(String toAddress, String fromAddress, String subject, String msgBody) {

        SimpleMailMessage simpleMailMsg = new SimpleMailMessage();
        simpleMailMsg.setFrom(fromAddress);
        simpleMailMsg.setTo(toAddress);
        simpleMailMsg.setSubject(subject);
        simpleMailMsg.setText(msgBody);
        mailSender.send(simpleMailMsg);

    }
}

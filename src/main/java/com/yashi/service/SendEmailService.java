package com.yashi.service;

import com.yashi.dao.SendEmailDaoInterface;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 14-07-2017.
 */
public class SendEmailService implements SendEmailServiceInterface {
    @Autowired
    SendEmailDaoInterface sendEmailDaoInterface;

    @Override
    public Integer sendEmail(String... a) {
        return 0;
    }
}

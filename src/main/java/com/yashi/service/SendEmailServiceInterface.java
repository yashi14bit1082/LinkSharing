package com.yashi.service;

/**
 * Created by yashi on 14-07-2017.
 */
public interface SendEmailServiceInterface {
    default Integer sendEmail(String... a)
    {
        return 0;
    }
}
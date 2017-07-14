package com.yashi.dao;

/**
 * Created by yashi on 14-07-2017.
 */
public interface SendEmailDaoInterface {
    default Integer sendEmail(String... a)
    {
        return 0;
    }
}

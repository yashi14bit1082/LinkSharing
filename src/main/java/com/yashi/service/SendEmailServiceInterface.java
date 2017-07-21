package com.yashi.service;

import java.io.UnsupportedEncodingException;

/**
 * Created by yashi on 14-07-2017.
 */
public interface SendEmailServiceInterface {
    default Integer sendEmail(String... a) throws UnsupportedEncodingException {
        return 0;
    }

    default boolean validateEmailOtp(String... a)
    {
        return false;
    }

    default Integer updatePassword(String... a)
    {
        return 0;
    }
}

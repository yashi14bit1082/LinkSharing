package com.yashi.model;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by yashi on 15-07-2017.
 */
@Entity
public class EmailOTP {
    @Id
    String emailSendTo;
    String Otp;

    public String getEmailSendTo() {
        return emailSendTo;
    }

    public void setEmailSendTo(String emailSendTo) {
        this.emailSendTo = emailSendTo;
    }

    public String getOtp() {
        return Otp;
    }

    public void setOtp(String otp) {
        Otp = otp;
    }
}

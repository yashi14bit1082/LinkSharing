package com.yashi.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by yashi on 15-07-2017.
 */
@Entity
public class EmailOTP {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    String emailSendTo;
    String Otp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

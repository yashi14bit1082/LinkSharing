package com.yashi.controller;

import com.yashi.service.DatabaseConnectionServiceInterface;
import com.yashi.service.SendEmailServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by yashi on 14-07-2017.
 */
@Controller
public class PasswordResetController {
    @Autowired
    DatabaseConnectionServiceInterface databaseConnectionServiceInterface;
    @Autowired
    SendEmailServiceInterface sendEmailServiceInterface;

    @RequestMapping(value = "/resetPassword")
    public ModelAndView resetPasswordView() {
        return new ModelAndView("resetPassword");
    }

    @RequestMapping (value = "/checkEmail",method = RequestMethod.POST)
    public @ResponseBody  String checkEmail(@RequestParam ("email") String email)
    {
        boolean response = databaseConnectionServiceInterface.checkDataExistence("User","email",email);
        return response+"";
    }

    @RequestMapping (value = "/sendOtpMail",method = RequestMethod.POST)
    public @ResponseBody String sendOtpMail(@RequestParam ("email") String email)
    {
        Integer response = sendEmailServiceInterface.sendEmail(email,"OTPforPasswordReset");

        if(response==1) {
            return "OTP sent to your Mail...";
        }
        else {
         //   System.out.println("svghjdskam");
            return "Problem while sending OTP!!!";
        }
    }

    @RequestMapping (value = "/updatePassword",method = RequestMethod.POST)
    public @ResponseBody String updatePassword(@RequestParam("emailRegistered") String emailRegistered,@RequestParam("OTP") String OTP,@RequestParam("password") String password)
    {
        Boolean response = sendEmailServiceInterface.validateEmailOtp(emailRegistered,OTP);
        if(response==true)
        {
            Integer updateResponse = sendEmailServiceInterface.updatePassword(password,emailRegistered);
            if(updateResponse==1) {
                return "Password is Updated successfully";
            }
            else {
                return "Password is not updated!!!";
            }
        }
        else
        {
            return "Password cannot be updated, Wrong Email/OTP!!!";
        }

    }


}
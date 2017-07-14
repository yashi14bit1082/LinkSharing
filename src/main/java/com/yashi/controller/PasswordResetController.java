package com.yashi.controller;

import com.yashi.dao.FetchFromDatabaseInterface;
import com.yashi.service.FetchDataService;
import com.yashi.service.FetchDataServiceInterface;
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
    FetchDataServiceInterface fetchDataServiceInterface;
    @Autowired
    SendEmailServiceInterface sendEmailServiceInterface;

    @RequestMapping(value = "/resetPassword")
    public ModelAndView resetPasswordView() {
        return new ModelAndView("resetPassword");
    }

    @RequestMapping (value = "/checkEmail",method = RequestMethod.POST)
    public @ResponseBody  String checkEmail(@RequestParam ("email") String email)
    {
        boolean response = fetchDataServiceInterface.checkDataExistence("User","email",email);
        return response+"";
    }

    @RequestMapping (value = "/sendOtpMail",method = RequestMethod.POST)
    public @ResponseBody String sendOtpMail(@RequestParam ("email") String email)
    {
       // Integer response = sendEmailServiceInterface.sendEmail(email);

       /* if(response==1)*/
            /*return "OTP sent to your Mail...";
        else*/
        System.out.println("svghjdskam");
            return "Problem while sending OTP!!!";
    }

}
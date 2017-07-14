package com.yashi.controller;

import com.yashi.dao.FetchFromDatabaseInterface;
import com.yashi.service.FetchDataService;
import com.yashi.service.FetchDataServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by yashi on 14-07-2017.
 */
@Controller
public class PasswordResetController {
    @Autowired
    FetchDataServiceInterface fetchDataServiceInterface;

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
}
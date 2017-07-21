package com.yashi.controller;

import com.yashi.model.User;
import com.yashi.service.DatabaseConnectionService;
import com.yashi.service.DatabaseConnectionServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yashi on 21-07-2017.
 */

@Controller
public class ProfileUpdateController {

    @Autowired
    DatabaseConnectionServiceInterface databaseConnectionServiceInterface;


    @RequestMapping(value = "/updateProfileView",method = RequestMethod.GET)
    public ModelAndView updateProfileView()
    {
        ModelAndView modelAndView = new ModelAndView("updateProfile");
        return modelAndView;
    }

    @RequestMapping(value = "/updateProfile",method = RequestMethod.POST)
    public @ResponseBody String updateProfile(String firstname, String lastname, HttpServletRequest request)
    {
        String username = request.getSession().getAttribute("username").toString();
        User user = new User();
        user.setFirstname(firstname);
        user.setLastname(lastname);
        Integer response = databaseConnectionServiceInterface.updateProfile(user,username);

        if(response>0)
        {return "updated...";}
        else
        {
            return "not updated...";
        }
    }


}

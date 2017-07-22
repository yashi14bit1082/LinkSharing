package com.yashi.controller;

import com.yashi.model.User;
import com.yashi.service.DatabaseConnectionService;
import com.yashi.service.DatabaseConnectionServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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
    public @ResponseBody String updateProfile(@ModelAttribute User user, HttpServletRequest request) throws IOException {
        String username = request.getSession().getAttribute("username").toString();

        user.setFirstname(user.getFirstname());
        user.setLastname(user.getLastname());
        user.setUsername(user.getUsername());


        Integer response = databaseConnectionServiceInterface.updateProfile(user,username);

        if(response>0)
        {return "updated...";}
        else
        {
            return "not updated...";
        }
    }


    @RequestMapping(value = "/updatePasswordForm",method = RequestMethod.POST)
    public @ResponseBody String updatePassword(@RequestParam("password") String password, HttpServletRequest request)
    {
        String username = request.getSession().getAttribute("username").toString();

        Integer response = databaseConnectionServiceInterface.updatePassword(password,username);

        if(response>0)
        {return "updated...";}
        else
        {
            return "not updated...";
        }
    }


}

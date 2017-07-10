package com.yashi.controller;

import com.yashi.model.User;
import com.yashi.service.LoginInterface;
import com.yashi.service.RegisterInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Created by yashi on 10-07-2017.
 */

@Controller
public class UserController {

    @Autowired
    RegisterInterface registerInterface;
    @Autowired
    LoginInterface loginInterface;

    @RequestMapping("/")
    public ModelAndView callHome()
    {
        return new ModelAndView("home","userRegisterForm",new User());
    }

    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    public ModelAndView registerUser(@ModelAttribute("userRegisterForm") User user,
                                     BindingResult result, ModelMap model,@RequestParam("photo") MultipartFile file) throws IOException {
            if(!file.isEmpty())
            {
                user.setPhoto(file.getBytes());
            }else{
                Path path = Paths.get("src\\main\\webapp\\WEB-INF\\resources\\default_photu.jpg");
                user.setPhoto(Files.readAllBytes(path));
            }
           String view =  registerInterface.registerUser(user);
                return new ModelAndView(view);

    }

    @RequestMapping(value = "/loginUser", method = RequestMethod.POST)
    public ModelAndView loginUser(@ModelAttribute("userLoginForm") User user,
                                     BindingResult result, ModelMap model) {

        String view =  loginInterface.loginUser(user);
        return new ModelAndView(view);

    }
}

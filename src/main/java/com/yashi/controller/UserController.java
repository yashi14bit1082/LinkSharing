package com.yashi.controller;

import com.yashi.model.User;
import com.yashi.service.LoginInterface;
import com.yashi.service.RegisterInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("userRegisterForm",new User());

        return modelAndView;
    }

    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    public ModelAndView registerUser(@ModelAttribute("userRegisterForm") User user,
                                     BindingResult result, ModelMap model,@RequestParam("photo") MultipartFile file) throws IOException {
            if(!file.isEmpty())
            {
                user.setPhoto(file.getBytes());
            }else{
                Path path = Paths.get("C:\\Users\\hp\\Downloads\\TTN Demo Project\\LinkSharing\\src\\main\\webapp\\WEB-INF\\resources\\default_photu.jpg");
                user.setPhoto(Files.readAllBytes(path));
            }
           String view =  registerInterface.registerUser(user);
                return new ModelAndView(view);

    }

    @RequestMapping(value = "/loginUser", method = RequestMethod.POST)
    public ModelAndView loginUser(@RequestParam("credential") String credential,@RequestParam("password") String password) {

        String view =  loginInterface.loginUser(credential,password);
        return new ModelAndView(view);

    }

    @RequestMapping(value = "/CheckUniqueUsername",method = RequestMethod.POST)
    public @ResponseBody String checkUniqueness(@RequestParam("credential") String credential)
    {
        boolean result = registerInterface.validateUsername(credential);
        return result+"";
    }
}

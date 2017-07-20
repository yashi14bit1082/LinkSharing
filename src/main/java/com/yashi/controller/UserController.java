package com.yashi.controller;

import com.yashi.model.Resource;
import com.yashi.model.User;
import com.yashi.service.DatabaseConnectionServiceInterface;
import com.yashi.service.LoginInterface;
import com.yashi.service.RegisterInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by yashi on 10-07-2017.
 */

@Controller
public class UserController {

    @Autowired
    RegisterInterface registerInterface;
    @Autowired
    LoginInterface loginInterface;
    @Autowired
    DatabaseConnectionServiceInterface databaseConnectionServiceInterface;

    @RequestMapping("/")
    public ModelAndView callHome(HttpServletRequest request)
    {
        ModelAndView modelAndView;
        if(request.getSession().getAttribute("username")==null)
        {
            modelAndView = new ModelAndView("home");
            modelAndView.addObject("userRegisterForm",new User());
            List<Resource> recentSharesList = databaseConnectionServiceInterface.recentShares();
            System.out.println(recentSharesList);
            modelAndView.addObject("recentShares",recentSharesList);
        }
        else {
            modelAndView = new ModelAndView("dashboard");
            String username= request.getSession().getAttribute("username").toString();

            modelAndView.addObject("unreadPosts",databaseConnectionServiceInterface.fetchUnreadPosts(username,0));

            modelAndView.addObject("maxPosts",databaseConnectionServiceInterface.fetchMaxPostCount(username));
            System.out.println(databaseConnectionServiceInterface.fetchMaxPostCount(username));

            modelAndView.addObject("user",(User)databaseConnectionServiceInterface.fetchObject("User","username",username));
            modelAndView.addObject("subscriptionNumber",databaseConnectionServiceInterface.fetchNumberSubscription(username));
            modelAndView.addObject("topicNumber",databaseConnectionServiceInterface.fetchNumberTopic(username));


        }
        return modelAndView;
    }

    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    public ModelAndView registerUser(@ModelAttribute("userRegisterForm") User user,
                                     BindingResult result, ModelMap model, @RequestParam("photo") MultipartFile file, HttpServletRequest request) throws IOException {
            if(!file.isEmpty())
            {
                user.setPhoto(file.getBytes());
            }else{
                Path path = Paths.get("C:\\Users\\hp\\Downloads\\TTN Demo Project\\LinkSharing\\src\\main\\webapp\\resources\\unknown_icon.png");
                user.setPhoto(Files.readAllBytes(path));
            }
        System.out.println(user);
           String view =  registerInterface.registerUser(user,request);
           if(view=="dashboard")
           {
               return new ModelAndView("redirect:/");
           }
               else
           {return new ModelAndView(view);}

    }

    @RequestMapping(value = "/loginUser", method = RequestMethod.POST)
    public ModelAndView loginUser(@RequestParam("credential") String credential, @RequestParam("password") String password, HttpServletRequest request) {

        String view = loginInterface.loginUser(credential, password, request);
        if (view == "home" || view=="dashboard") {
            return new ModelAndView("redirect:/");
        }
        else {
            return new ModelAndView(view);
        }
    }

    @RequestMapping(value = "/CheckUniqueUsername",method = RequestMethod.POST)
    public @ResponseBody String checkUniqueness(@RequestParam("credential") String credential)
    {
        boolean result = registerInterface.validateUsername(credential);
        return result+"";
    }

    @RequestMapping(value = "/logOut",method = RequestMethod.GET)
    public String logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.getSession().invalidate();
        return "redirect:/";
    }
}

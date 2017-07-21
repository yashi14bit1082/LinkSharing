package com.yashi.controller;

import com.yashi.service.AdminServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by yashi on 16-07-2017.
 */
@Controller
public class AdminController {

    @Autowired
    AdminServiceInterface adminServiceInterface;

    @RequestMapping(value = "/fetchUTPListForAdmin", method = RequestMethod.POST)
    public @ResponseBody List<Object> fetchUTPListForAdmin(@RequestParam ("utpSelected") String utpSelected,@RequestParam ("utpOptionSelected") String utpOptionSelected)
    {
        List<Object> responseList = adminServiceInterface.fetchList(utpSelected,utpOptionSelected);

        return responseList;
    }

    @RequestMapping(value = "/users")
    public ModelAndView adminPageForUsers(HttpServletRequest request)
    {
        if(request.getSession().getAttribute("username")!=null)
        {
            ModelAndView modelAndView = new ModelAndView("adminPage");
            modelAndView.addObject("UTP","User");

        return modelAndView;
        }

        else
        {
            return new ModelAndView("redirect:/");
        }
    }


    @RequestMapping(value = "/topics")
    public ModelAndView adminPageForTopics(HttpServletRequest request)
    {
        if(request.getSession().getAttribute("username")!=null) {
            ModelAndView modelAndView = new ModelAndView("adminPage");
            modelAndView.addObject("UTP","Topic");

            return modelAndView;
        }
        else
        {
            return new ModelAndView("redirect:/");
        }
    }


    @RequestMapping(value = "/posts")
    public ModelAndView adminPageForPosts(HttpServletRequest request)
    {
        if(request.getSession().getAttribute("username")!=null) {
            ModelAndView modelAndView = new ModelAndView("adminPage");
            modelAndView.addObject("UTP","Post");

            return modelAndView;
        }
        else
        {
            return new ModelAndView("redirect:/");
        }
    }
}

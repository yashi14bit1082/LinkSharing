package com.yashi.controller;

import com.yashi.service.CheckUniquenessInterface;
import com.yashi.service.TopicServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by yashi on 11-07-2017.
 */

@Controller
@EnableWebMvc
public class DashboardTopicController {
    @Autowired
    TopicServiceInterface topicServiceInterface;
    @Autowired
    CheckUniquenessInterface checkUniquenessInterface;

    @RequestMapping(value = "/addTopic",method = RequestMethod.POST)
    public @ResponseBody String addTopic(@RequestParam ("topicName") String topicName, @RequestParam ("visibility") String visibility, HttpServletRequest request)
    {
        System.out.println(topicName);
        HttpSession session = request.getSession();
       String topicCreatedBy = session.getAttribute("username").toString();
        Integer topicAddedResultVal = topicServiceInterface.addTopic(topicName,visibility,topicCreatedBy);
        return topicAddedResultVal+"";
    }

    @RequestMapping(value = "/checkTopicUniqueness",method = RequestMethod.POST)
    public @ResponseBody String checkTopicUniqueness(@RequestParam ("topicName") String topicName)
    {
        Boolean response = checkUniquenessInterface.checkTopicUniqueness(topicName);
        return response+"";
    }

}

package com.yashi.controller;

import com.yashi.model.Topic;
import com.yashi.service.CheckUniquenessInterface;
import com.yashi.service.TopicServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
    public @ResponseBody String addTopic(@ModelAttribute Topic topic , HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        String topicCreatedBy = session.getAttribute("username").toString();
        Integer topicAddedResultVal = topicServiceInterface.addTopic(topic,topicCreatedBy);
        return topicAddedResultVal+"";
    }

    @RequestMapping(value = "/checkTopicUniqueness",method = RequestMethod.POST)
    public @ResponseBody String checkTopicUniqueness(@RequestParam ("topicName") String topicName,HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        String currentUser = (String)session.getAttribute("username");
        Boolean response = checkUniquenessInterface.checkTopicUniqueness(topicName,currentUser);
        return response+"";
    }

}

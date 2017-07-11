package com.yashi.controller;

import com.yashi.service.TopicServiceInterface;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by yashi on 11-07-2017.
 */

@Controller
public class DashboardTopicController {
    @Autowired
    TopicServiceInterface topicServiceInterface;

    @RequestMapping(value = "/addTopic",method = RequestMethod.POST)
    public @ResponseBody Integer addTopic(@RequestParam ("topicName") String topicName, @RequestParam ("visibility") String visibility, HttpServletRequest request)
    {
        System.out.println(topicName);
        HttpSession session = request.getSession();
       String topicCreatedBy = session.getAttribute("username").toString();
        Integer topicAddedResultVal = topicServiceInterface.addTopic(topicName,visibility,topicCreatedBy);
        return topicAddedResultVal;
    }

}

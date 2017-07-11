package com.yashi.controller;

import com.yashi.service.TopicServiceInterface;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by yashi on 11-07-2017.
 */
@Controller
public class DashboardTopicController {
    TopicServiceInterface topicServiceInterface;

    @RequestMapping(value = "/addTopic",method = RequestMethod.POST)
    public @ResponseBody Integer addTopic(@RequestParam ("topicName") String topicName, @RequestParam ("visibility") String visibility, @RequestParam ("sessionUsername") String topicCreatedBy)
    {
        Integer topicAddedResultVal = topicServiceInterface.addTopic(topicName,visibility,topicCreatedBy);
        return topicAddedResultVal;
    }

}

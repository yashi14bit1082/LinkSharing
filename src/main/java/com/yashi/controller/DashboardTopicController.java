package com.yashi.controller;

import com.yashi.model.Topic;
import com.yashi.service.CheckUniquenessInterface;
import com.yashi.service.FetchDataServiceInterface;
import com.yashi.service.TopicServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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
    @Autowired
    FetchDataServiceInterface fetchDataServiceInterface;

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

    @RequestMapping(value = "/fetchListSearch",method = RequestMethod.POST)
    public @ResponseBody List<Object> fetchTopicList(@RequestParam("table_name") String table_name, @RequestParam("field_name") String field_name, @RequestParam ("search_string") String search)
    {
        List<Object> fetched_list = fetchDataServiceInterface.fetchData(table_name,field_name,search,1);
        return fetched_list;

    }

}

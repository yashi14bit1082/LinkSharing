package com.yashi.controller;

import com.yashi.model.*;
import com.yashi.service.CheckUniquenessInterface;
import com.yashi.service.DatabaseConnectionServiceInterface;
import com.yashi.service.SendEmailServiceInterface;
import com.yashi.service.TopicServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    DatabaseConnectionServiceInterface databaseConnectionServiceInterface;
    @Autowired
    SendEmailServiceInterface sendEmailServiceInterface;

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
    public @ResponseBody List<Topic> fetchTopicList(@RequestParam ("searchString") String search)
    {
        List<Topic> fetched_list = databaseConnectionServiceInterface.fetchData(search);
        return fetched_list;
    }



    @RequestMapping(value = "/fetchSubscribedListSearch",method = RequestMethod.POST)
    public @ResponseBody List<Subscription> fetchSubscribedTopicList(@RequestParam ("searchString") String search,HttpServletRequest request)
    {
        String username = request.getSession().getAttribute("username").toString();

        List<Subscription> fetched_list = databaseConnectionServiceInterface.fetchSubscribedList(search,username);
        return fetched_list;
    }




    @RequestMapping(value = "/displaySelectedTopicPage",method = RequestMethod.GET)
    public ModelAndView redirectToSelectedTopic(@RequestParam ("SelectedItem") String selectedItem)
    {
        ModelAndView modelAndView = new ModelAndView("TopicShow");

        int stringLength = selectedItem.length();
        int indexOfComma = selectedItem.lastIndexOf(',');
        String topicName = selectedItem.substring(0,indexOfComma);
        String username = selectedItem.substring(indexOfComma+1,stringLength);

        modelAndView.addObject("topic",databaseConnectionServiceInterface.fetchObject("Topic","topicName",topicName,"username",username));

        modelAndView.addObject("topicSubscriptionCount",databaseConnectionServiceInterface.topicSubscriptionCount(topicName,username));
        modelAndView.addObject("topicPostCount",databaseConnectionServiceInterface.topicPostCount(topicName,username));


        modelAndView.addObject("maxPosts",databaseConnectionServiceInterface.fetchMaxPostCountForTopicShow(topicName));

     List<Resource> ResourceList =  databaseConnectionServiceInterface.fetchResourceList(topicName,0+""); // 0 is the starting index of ajaxified pagination
      // System.out.println(ResourceList);
      modelAndView.addObject("resourceList",ResourceList);

      return modelAndView;
    }



    @RequestMapping(value = "/ajaxifiedPaginationTopic",method = RequestMethod.POST)
    public @ResponseBody List<Resource> ajaxifiedPaginationTopic(@RequestParam("topicName") String topicName, @RequestParam("index") String index)
    {
        List<Resource> ResourceList =  databaseConnectionServiceInterface.fetchResourceList(topicName,index); // 0 is the starting index of ajaxified pagination
        return ResourceList;
    }


    @RequestMapping(value = "/sendSubscriptionInvitation",method = RequestMethod.POST)
    public @ResponseBody String sendSubscriptionInvitation(@RequestParam ("email") String email, @RequestParam ("topicInvite") String topicInvite)
    {
        System.out.println(email+"aaya  "+topicInvite);
        Integer response = sendEmailServiceInterface.sendEmail(email,"TopicSubscriptionMail");
        System.out.println(email+"aaya  "+topicInvite);
        System.out.println(response);
        if(response==1) {
            return "Subscription mail sent successfully.";
        }
        else {

            return "Problem while sending Subscription Mail!!!";
        }

    }


    @RequestMapping(value = "/fetchAjaxInbox",method = RequestMethod.POST)
    public @ResponseBody List<ReadingItem> fetchAjaxInbox(HttpServletRequest request,@RequestParam("index") String index)
    {
        String username = request.getSession().getAttribute("username").toString();
        List<ReadingItem> fetchedPostListDynamically = databaseConnectionServiceInterface.fetchUnreadPosts(username,Integer.parseInt(index));
        return fetchedPostListDynamically;
    }

    @RequestMapping(value = "markPostRead",method = RequestMethod.POST)
    public @ResponseBody String markPostRead(@RequestParam("id") int id)
    {
        Integer i = databaseConnectionServiceInterface.markPostRead(id);
        System.out.println(i+"aaya");
        return i+"";
    }

}

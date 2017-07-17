package com.yashi.service;

import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.dao.ResourceDaoInterface;
import com.yashi.model.Resource;
import com.yashi.model.Subscription;
import com.yashi.model.Topic;
import com.yashi.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yashi on 13-07-2017.
 */
public class ResourceService implements ResourceServiceInterface {

    @Autowired
    ResourceDaoInterface resourceDaoInterface;
    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionDaoInterface;

    @Override
    public Integer saveLinkResourceService(String link, String desc, String topic,String resourceType) {

        int result = 0;
        int str_length = topic.length();
        int indexOfComma = topic.lastIndexOf(',');
        String userName = topic.substring(indexOfComma+1,str_length);
        String topicName = topic.substring(0,indexOfComma);

        User user = (User) databaseConnectionDaoInterface.fetchData("User","username",userName);
        Topic topic1 = (Topic) databaseConnectionDaoInterface.fetchData("Topic","topicName",topicName,"createdBy_id",user.getId().toString());


        Resource resource = resourceDaoInterface.saveLinkResourceDao(link,desc,topic1,user,resourceType);
                        if(resource!=null) {
                            result = 1;
                            List<Subscription> userList = databaseConnectionDaoInterface.fetchSubscribedUsersFromSubscription(topic1);
                            resourceDaoInterface.setPostReadUnread(resource,userList);
                        }


        return result;
    }
}

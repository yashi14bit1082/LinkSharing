package com.yashi.service;

import com.yashi.dao.FetchFromDatabaseInterface;
import com.yashi.dao.ResourceDaoInterface;
import com.yashi.model.Topic;
import com.yashi.model.User;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 13-07-2017.
 */
public class ResourceService implements ResourceServiceInterface {

    @Autowired
    ResourceDaoInterface resourceDaoInterface;
    @Autowired
    FetchFromDatabaseInterface fetchFromDatabaseInterface;

    @Override
    public Integer saveLinkResourceService(String link, String desc, String topic) {

        int str_length = topic.length();
        int indexOfComma = topic.lastIndexOf(',');
        String userName = topic.substring(indexOfComma+1,str_length);
        String topicName = topic.substring(0,indexOfComma);

        Topic topic1 = (Topic)fetchFromDatabaseInterface.fetchData("Topic","topicName",topicName);
        User user = (User)fetchFromDatabaseInterface.fetchData("User","username",userName);

        Integer result = resourceDaoInterface.saveLinkResourceDao(link,desc,topic1,user);
        return result;
    }
}

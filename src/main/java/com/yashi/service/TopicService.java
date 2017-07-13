package com.yashi.service;

import com.yashi.dao.FetchFromDatabase;
import com.yashi.dao.FetchFromDatabaseInterface;
import com.yashi.dao.SubscriptionDaoInterface;
import com.yashi.dao.TopicDaoInterface;
import com.yashi.model.Seriousness;
import com.yashi.model.Subscription;
import com.yashi.model.Topic;
import com.yashi.model.User;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 11-07-2017.
 */
public class TopicService implements TopicServiceInterface,CheckUniquenessInterface {
        @Autowired
        TopicDaoInterface topicDaoInterface;
        @Autowired
    SubscriptionDaoInterface subscriptionDaoInterface;
        @Autowired
    FetchFromDatabaseInterface fetchFromDatabaseInterface;

    @Override
    public Integer addTopic(Topic topic, String topicCreatedBy) {
        Integer val = topicDaoInterface.topicAddDatabase(topic,topicCreatedBy);
        // Topic Creator automatically get subscribed to the topic

       User user = (User)fetchFromDatabaseInterface.fetchData("User","username",topicCreatedBy);
       Seriousness seriousness = Seriousness.VERY_SERIOUS;
        Integer t = subscriptionDaoInterface.addSubscriptionDB(topic,user,seriousness);
        return val;
    }

}
